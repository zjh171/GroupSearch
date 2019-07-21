//
//  QSSEditGroupViewModel.h
//  GroupSearch
//
//  Created by kyson on 2019/7/21.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSBaseViewModel.h"
#import "QSSGroupSubmitViewModel.h"
#import "QSSUploadPhotoCellModel.h"
#import "QSSGroupNameInfoCellModel.h"
#import "QSSGroupContentCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QSSEditGroupViewModel : QSSBaseViewModel


@property (nonatomic, strong) QSSGroupSubmitViewModel *submitViewModel;

@property (nonatomic, strong) QSSUploadPhotoCellModel *photoCellModel;
@property (nonatomic, strong) QSSGroupNameInfoCellModel *groupNameInfoCellModel;
@property (nonatomic, strong) QSSGroupContentCellModel *groupContentCellModel;

@property (nonatomic, strong) RACCommand *submitCommand;



@end

NS_ASSUME_NONNULL_END
