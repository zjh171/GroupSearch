//
//  QSSBaseViewModel.h
//  GroupSearch
//
//  Created by kyson on 2019/7/14.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface QSSBaseViewModel : NSObject

@property (nonatomic, strong,readonly) NSDictionary *params;

-(instancetype) initWithParams:(NSDictionary *) params;


-(void) initilize ;
@end

NS_ASSUME_NONNULL_END
