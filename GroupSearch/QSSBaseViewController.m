//
//  QSSBaseViewController.m
//  GroupSearch
//
//  Created by kyson on 2019/7/14.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSBaseViewController.h"
#import "QSSBaseViewModel.h"
#import <MBProgressHUD/MBProgressHUD.h>
@interface QSSBaseViewController () {
    MBProgressHUD *HUD;
}

@property (nonatomic, strong) QSSBaseViewModel *viewModel;

@end

@implementation QSSBaseViewController


-(instancetype) initWithViewModel:(QSSBaseViewModel *) viewModel {
    if (self = [super init]) {
        self.viewModel = viewModel;
    }
    return self;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:237/255.f green:237/255.f blue:237/255.f alpha:237/255.f];

    @weakify(self);
    [self.viewModel.errorSubject subscribeNext:^(NSString *x) {
        //初始化进度框，置于当前的View当中
        @strongify(self);
        //初始化进度框，置于当前的View当中
        self->HUD = [[MBProgressHUD alloc] initWithView:self.view];
        self->HUD.mode = MBProgressHUDModeText;
        [self.view addSubview:self->HUD];
        //设置对话框文字
        self->HUD.label.text = x;
        self->HUD.margin = 12.f;
        //显示对话框
        [self->HUD showAnimated:YES];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self->HUD hideAnimated:YES];
        });
        
    }];
}


@end
