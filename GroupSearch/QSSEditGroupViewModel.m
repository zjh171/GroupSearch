//
//  QSSEditGroupViewModel.m
//  GroupSearch
//
//  Created by kyson on 2019/7/21.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSEditGroupViewModel.h"

@interface QSSEditGroupViewModel ()


@end

@implementation QSSEditGroupViewModel






-(QSSGroupSubmitViewModel *)submitViewModel {
    if (!_submitViewModel) {
        _submitViewModel = [[QSSGroupSubmitViewModel alloc] init];
    }
    
    return _submitViewModel;
}

@end
