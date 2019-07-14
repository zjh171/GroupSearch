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

    self.qrCodeImageView.layer.cornerRadius = 5.f;
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
    
    
    UIImage *editImage = [UIImage imageNamed:@"ico_back"];
    UIBarButtonItem *item =[[UIBarButtonItem alloc] initWithImage:editImage style:UIBarButtonItemStyleDone target:self action:@selector(backButtonClicked)];
    self.navigationItem.leftBarButtonItem = item;
    
}

-(void) backButtonClicked{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
