//
//  QSSBaseViewController.m
//  GroupSearch
//
//  Created by kyson on 2019/7/14.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSBaseViewController.h"

@interface QSSBaseViewController ()

@property (nonatomic, strong) NSObject *viewModel;

@end

@implementation QSSBaseViewController


-(instancetype) initWithViewModel:(NSObject *) viewModel {
    if (self = [super init]) {
        self.viewModel = viewModel;
    }
    return self;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:237/255.f green:237/255.f blue:237/255.f alpha:237/255.f];

}

@end
