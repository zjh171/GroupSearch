//
//  QSSQRCodeDetailViewController.m
//  GroupSearch
//
//  Created by kyson on 2019/7/14.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSQRCodeDetailViewController.h"
#import "QSSQRCodeDetailViewModel.h"
#import <UIImageView+WebCache.h>

@interface QSSQRCodeDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *qrCodeImageView;

@property(nonatomic, strong) QSSQRCodeDetailViewModel *viewModel;

@end

@implementation QSSQRCodeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    @weakify(self);
    [[RACObserve(self, viewModel.pic) ignore:nil] subscribeNext:^(NSString *x) {
        @strongify(self);
#ifdef DEBUG
        x = @"http://images.kyson.cn/groupsearch_01.jpg";
#endif
        NSURL *url = [NSURL URLWithString:x];
        [self.qrCodeImageView sd_setImageWithURL:url];

    }];
    
    
}


@end
