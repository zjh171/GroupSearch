//
//  QSSGroupDetailViewModel.h
//  GroupSearch
//
//  Created by kyson on 2019/7/14.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "QSSBaseViewModel.h"
#import "QSSGroupContentShowCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QSSGroupDetailViewModel : QSSBaseViewModel


@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSArray<QSSGroupContentShowCellModel *> *cellModels;

@end

NS_ASSUME_NONNULL_END
