//
//  QSSHomeViewModel.m
//  GroupSearch
//
//  Created by kyson on 2019/7/14.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSHomeViewModel.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>

@implementation QSSHomeViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initilize];
    }
    return self;
}

-(void) initilize {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSDictionary *params = @{@"key":@"测试"};
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



@end
