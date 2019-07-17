//
//  QSSSearchViewModel.m
//  GroupSearch
//
//  Created by kyson on 2019/7/17.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSSearchViewModel.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>

@implementation QSSSearchViewModel


-(void) requestGroup:(NSString *) key {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSDictionary *params = @{@"key":key};
    [manager GET:@"http://111.231.67.200:8088/groupSearchPlatform/groupInfo" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
        if([responseObject isKindOfClass:NSDictionary.class]) {
            NSDictionary *data = responseObject[@"data"];
            NSArray *groups = [QSSGroupInfoModel mj_objectArrayWithKeyValuesArray:data];
            
            NSMutableArray *cellModels = [[NSMutableArray alloc] init];
            [groups enumerateObjectsUsingBlock:^(QSSGroupInfoModel *obj, NSUInteger idx, BOOL *stop) {
                QSSGroupInfoCellModel *cellModel = [[QSSGroupInfoCellModel alloc] init];
                cellModel.groupInfo = obj;
                [cellModels addObject:cellModel];
                
            }];
            
            self.cellModels = cellModels;
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}



-(RACCommand *)requestGroupCommand {
    if (!_requestGroupCommand) {
        _requestGroupCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(NSString *input) {
            RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                [self requestGroup:input];
                
                RACDisposable *dispose = [RACDisposable disposableWithBlock:^{
                    
                }];
                return dispose;
            }];
            return signal;
        }];
    }
    return _requestGroupCommand;
}





@end
