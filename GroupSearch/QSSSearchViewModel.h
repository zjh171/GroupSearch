//
//  QSSSearchViewModel.h
//  GroupSearch
//
//  Created by kyson on 2019/7/17.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSBaseViewModel.h"
#import "QSSGroupInfoCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QSSSearchViewModel : QSSBaseViewModel

@property (nonatomic, strong) NSArray<QSSGroupInfoCellModel *> *cellModels;

@property (nonatomic, strong) RACCommand *requestGroupCommand;

@end

NS_ASSUME_NONNULL_END
