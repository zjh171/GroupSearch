//
//  QSSGroupContentShowCell.m
//  GroupSearch
//
//  Created by kyson on 2019/7/14.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSGroupContentShowCell.h"
#import "QSSGroupContentShowCellModel.h"

@interface QSSGroupContentShowCell ()

@property (nonatomic, strong) QSSGroupContentShowCellModel *viewModel;

@end

@implementation QSSGroupContentShowCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    
    
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
