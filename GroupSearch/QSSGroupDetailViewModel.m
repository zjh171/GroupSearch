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

-(void)initilize {
    
    QSSGroupInfoModel *groupInfo = self.params[@"group"];
    self.groupInfo = groupInfo;
    self.title = groupInfo.name;
    
    
    QSSGroupContentShowCellModel *cellModel = [[QSSGroupContentShowCellModel alloc] init];
    cellModel.groupInfo = self.groupInfo.describes;
    
    QSSGroupQRCodeShowCellModel *cellModel2 = [[QSSGroupQRCodeShowCellModel alloc] init];
    cellModel2.pic = self.groupInfo.picUrl;
    
    self.cellModels = @[cellModel,cellModel2];

    
}




@end
