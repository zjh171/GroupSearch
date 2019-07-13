//
//  QSSGroupInfoCell.m
//  GroupSearch
//
//  Created by kyson on 2019/7/13.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSGroupInfoCell.h"

@interface QSSGroupInfoCell ()

@property (weak, nonatomic) IBOutlet UIImageView *avaterImageView;
@property (weak, nonatomic) IBOutlet UILabel *groupContentLabel;
@property (weak, nonatomic) IBOutlet UILabel *groupDetailLabel;


@end

@implementation QSSGroupInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.avaterImageView.layer.cornerRadius = 22.f;
    self.avaterImageView.clipsToBounds = YES;
    
    self.groupContentLabel.text = @"夸夸群";
    self.groupDetailLabel.text = @"大家是爱迪生";

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
