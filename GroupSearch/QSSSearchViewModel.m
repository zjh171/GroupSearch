//
//  QSSSearchViewModel.m
//  GroupSearch
//
//  Created by kyson on 2019/7/17.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSSearchViewModel.h"

@implementation QSSSearchViewModel


-(RACCommand *)requestGroupCommand {
    if (!_requestGroupCommand) {
        _requestGroupCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            return nil;
        }];
    }
    return _requestGroupCommand;
}





@end
