//
//  QSSBaseViewModel.m
//  GroupSearch
//
//  Created by kyson on 2019/7/14.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSBaseViewModel.h"


@interface QSSBaseViewModel ()

@property (nonatomic, strong,readwrite) NSDictionary *params;


@end



@implementation QSSBaseViewModel


-(instancetype) initWithParams:(NSDictionary *) params {
    if (self = [super init]) {
        self.params = params;
        
        [self initilize];
    }
    return self;
    
}

-(void) initilize {
    
}

//-(RACSignal *)errorSignal {
//    if (!_errorSignal) {
//        _errorSignal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//
//            RACDisposable *dispose = [RACDisposable disposableWithBlock:^{
//
//            }];
//            return dispose;
//
//        }];
//    }
//    return _errorSignal;
//}
//
//-(RACCommand *)errorCommand {
//    if (!_errorCommand) {
//        _errorCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
//            return self.errorSignal;
//        }];
//    }
//    return _errorCommand;
//}


-(RACSubject *)errorSubject {
    if (!_errorSubject) {
        _errorSubject = [RACSubject subject];
    }
    return _errorSubject;
}

@end
