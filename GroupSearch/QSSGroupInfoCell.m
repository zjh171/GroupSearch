//
//  QSSGroupInfoCell.m
//  GroupSearch
//
//  Created by kyson on 2019/7/13.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSGroupInfoCell.h"
#import "QSSGroupInfoCellModel.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface QSSGroupInfoCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avaterImageView;
@property (weak, nonatomic) IBOutlet UILabel *groupContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *groupDetailLabel;

@property (nonatomic, strong) QSSGroupInfoCellModel *viewModel;

@end

@implementation QSSGroupInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.avaterImageView.layer.cornerRadius = 30.f;
    self.avaterImageView.clipsToBounds = YES;
    
    self.groupContentLabel.text = @"夸夸群";
    self.groupDetailLabel.text = @"大家是爱迪生";

    @weakify(self);
    [[RACObserve(self, viewModel.groupInfo) ignore:nil] subscribeNext:^(QSSGroupInfoModel *x) {
        @strongify(self);
        self.groupContentLabel.text = x.name;
        self.groupDetailLabel.text = x.describes;
    }];
    
}


-(void) bindViewModel:(id) viewModel {
    self.viewModel = viewModel;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
