//
//  QSSGroupSubmitViewModel.h
//  GroupSearch
//
//  Created by kyson on 2019/7/21.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QSSBaseViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QSSGroupSubmitViewModel : QSSBaseViewModel

@property (nonatomic, strong, readonly) RACSubject *submitButtonClickedSubject;

@property (nonatomic, assign) BOOL showErrorMsg;

@end

NS_ASSUME_NONNULL_END
