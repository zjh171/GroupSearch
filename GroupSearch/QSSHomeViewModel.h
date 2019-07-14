//
//  QSSHomeViewModel.h
//  GroupSearch
//
//  Created by kyson on 2019/7/14.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QSSGroupInfoModel.h"
#import "QSSGroupInfoCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QSSHomeViewModel : NSObject

@property (nonatomic, strong) NSArray<QSSGroupInfoCellModel *> *cellModels;

@end

NS_ASSUME_NONNULL_END
