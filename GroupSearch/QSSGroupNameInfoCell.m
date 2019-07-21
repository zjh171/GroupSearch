//
//  QSSGroupNameInfoCell.m
//  GroupSearch
//
//  Created by kyson on 2019/7/13.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSGroupNameInfoCell.h"
#import "QSSGroupNameInfoCellModel.h"

@interface QSSGroupNameInfoCell ()

@property (weak, nonatomic) IBOutlet UITextField *editTextField;

@property (nonatomic, strong) QSSGroupNameInfoCellModel *viewModel;


@end

@implementation QSSGroupNameInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.editTextField.placeholder = @"输入您的群名";
    
    
    // 这种写法其实已经是双向绑定的写法了，但是由于是 textView 的原因只能绑定 model.text 的变化到影响 textView.text 的值的变化的这个单向通道
    RACChannelTo(self,editTextField.text) = RACChannelTo(self,viewModel.groupName);
    
    // 在这里对textView的text changed的信号重新订阅一下，以实现上面channel未实现的另外一个绑定通道.
    @weakify(self)
    [self.editTextField.rac_textSignal subscribeNext:^(NSString *x) {
        @strongify(self)
        self.viewModel.groupName = x;
    }];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


-(void) bindViewModel:(id) viewModel {
    self.viewModel = viewModel;
}

@end
