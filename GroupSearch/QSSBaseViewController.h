//
//  QSSBaseViewController.h
//  GroupSearch
//
//  Created by kyson on 2019/7/14.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface QSSBaseViewController : UIViewController


-(instancetype) initWithViewModel:(NSObject *) viewModel;

@end

NS_ASSUME_NONNULL_END
