//
//  QSSGroupDetailViewModel.m
//  GroupSearch
//
//  Created by kyson on 2019/7/14.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSGroupDetailViewModel.h"
#import "QSSGroupInfoModel.h"

@interface QSSGroupDetailViewModel ()


@property (nonatomic, strong) QSSGroupInfoModel *groupInfo;

@end


@implementation QSSGroupDetailViewModel


- (instancetype)initWithParams:(NSDictionary *)params {
    if (self = [super initWithParams:params]) {
        QSSGroupInfoModel *groupInfo = params[@"group"];
        self.groupInfo = groupInfo;
        self.title = groupInfo.name;
    }
    return self;
}

-(void)initilize {
    QSSGroupContentShowCellModel *cellModel = [[QSSGroupContentShowCellModel alloc] init];
    cellModel.groupInfo = self.groupInfo.describes;
    self.cellModels = @[cellModel];
    
}




@end
