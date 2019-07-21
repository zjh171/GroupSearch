//
//  QSSGroupSubmitView.h
//  GroupSearch
//
//  Created by kyson on 2019/7/21.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <ReactiveObjC/ReactiveObjC.h>


NS_ASSUME_NONNULL_BEGIN

@interface QSSGroupSubmitView : UIView

+(id) loadFromXib;



-(void) bindViewModel :(id) viewModel;

@end

NS_ASSUME_NONNULL_END
