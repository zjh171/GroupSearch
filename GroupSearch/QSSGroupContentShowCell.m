//
//  QSSGroupContentShowCell.m
//  GroupSearch
//
//  Created by kyson on 2019/7/14.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSGroupContentShowCell.h"
#import "QSSGroupContentShowCellModel.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface QSSGroupContentShowCell ()

@property (nonatomic, strong) QSSGroupContentShowCellModel *viewModel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;

@end

@implementation QSSGroupContentShowCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    @weakify(self);
    [RACObserve(self, viewModel.groupInfo) subscribeNext:^(NSString * x) {
        @strongify(self);        
        self.detailLabel.text = x;
    }];
    
    
    self.detailLabel.text = @"手机、电脑均安装了TeamViewer。电脑win7家庭普通版、手机里程碑2安卓2.2，连接到同一无线路由且皆可登录互联网。使用手机与电脑连接可以实现控制，但是只在建立连接初始几秒能看见电";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) bindViewModel:(id) viewModel
{
    self.viewModel = viewModel;
}

@end
