//
//  QSSUserInfoCell.m
//  GroupSearch
//
//  Created by kyson on 2019/7/13.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSUserInfoCell.h"

@interface QSSUserInfoCell ()
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;

@end

@implementation QSSUserInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // app版本
    NSString *appVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    
    self.rightLabel.text = [NSString stringWithFormat:@"版本号 %@",appVersion];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
