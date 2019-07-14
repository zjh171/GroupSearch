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

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;

@end

@implementation QSSQRCodeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.qrCodeImageView.layer.cornerRadius = 5.f;
//    self.qrCodeImageView.layer.borderColor = [UIColor colorWithRed:233/255.f green:233/255.f blue:233/255.f alpha:1.f].CGColor;
    self.qrCodeImageView.clipsToBounds = YES;
    self.heightConstraint.constant = 1.5 * (UIScreen.mainScreen.bounds.size.width - 30 );
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
