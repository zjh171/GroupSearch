//
//  QSSGroupQRCodeShowCell.m
//  GroupSearch
//
//  Created by kyson on 2019/7/14.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSGroupQRCodeShowCell.h"
#import "QSSGroupQRCodeShowCellModel.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import <UIImageView+WebCache.h>

@interface QSSGroupQRCodeShowCell ()
@property (weak, nonatomic) IBOutlet UIImageView *qrImageView;

@property (nonatomic,strong) QSSGroupQRCodeShowCellModel *viewModel;
@end

@implementation QSSGroupQRCodeShowCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    @weakify(self);
    [RACObserve(self, viewModel.pic) subscribeNext:^(NSString *x) {
        @strongify(self);
#ifdef DEBUG
        x = @"http://images.kyson.cn/groupsearch_01.jpg";
#endif
        NSURL *url = [NSURL URLWithString:x];
        [self.qrImageView sd_setImageWithURL:url];
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) bindViewModel:(id) viewModel {
    self.viewModel = viewModel;
}

@end
