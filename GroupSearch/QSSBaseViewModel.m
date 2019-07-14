//
//  QSSBaseViewModel.m
//  GroupSearch
//
//  Created by kyson on 2019/7/14.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSBaseViewModel.h"


@interface QSSBaseViewModel ()

@property (nonatomic, strong) NSDictionary *params;

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


@end
