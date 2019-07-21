//
//  QSSEditGroupViewModel.h
//  GroupSearch
//
//  Created by kyson on 2019/7/21.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSBaseViewModel.h"
#import "QSSGroupSubmitViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QSSEditGroupViewModel : QSSBaseViewModel


@property (nonatomic, strong) QSSGroupSubmitViewModel *submitViewModel;

@end

NS_ASSUME_NONNULL_END
