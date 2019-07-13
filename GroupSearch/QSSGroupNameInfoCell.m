//
//  QSSGroupNameInfoCell.m
//  GroupSearch
//
//  Created by kyson on 2019/7/13.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSGroupNameInfoCell.h"

@interface QSSGroupNameInfoCell ()

@property (weak, nonatomic) IBOutlet UITextField *editTextField;



@end

@implementation QSSGroupNameInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.editTextField.placeholder = @"输入您的群名";
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
