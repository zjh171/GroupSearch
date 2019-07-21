//
//  QSSGroupSubmitViewModel.m
//  GroupSearch
//
//  Created by kyson on 2019/7/21.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSGroupSubmitViewModel.h"


@interface QSSGroupSubmitViewModel ()

@property (nonatomic, strong, readwrite) RACSubject *submitButtonClickedSubject;

@end

@implementation QSSGroupSubmitViewModel



-(RACSubject *)submitButtonClickedSubject {
    if (!_submitButtonClickedSubject) {
        _submitButtonClickedSubject = [RACSubject subject];
    }
    return _submitButtonClickedSubject;
}




@end
