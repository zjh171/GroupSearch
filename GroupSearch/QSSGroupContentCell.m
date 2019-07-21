//
//  QSSGroupContentCell.m
//  GroupSearch
//
//  Created by kyson on 2019/7/13.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSGroupContentCell.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import "UITextView+ZWPlaceHolder.h"

@interface QSSGroupContentCell ()
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
@property (nonatomic, strong) QSSGroupContentCellModel *viewModel;


@end

@implementation QSSGroupContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.contentTextView.placeholder = @"请输入您的群简介，200字以内";
    [self.contentTextView.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateTableView" object:nil];
    }];
    
    // 这种写法其实已经是双向绑定的写法了，但是由于是 textView 的原因只能绑定 model.text 的变化到影响 textView.text 的值的变化的这个单向通道
    RACChannelTo(self,contentTextView.text) = RACChannelTo(self,viewModel.groupContent);
    
    // 在这里对textView的text changed的信号重新订阅一下，以实现上面channel未实现的另外一个绑定通道.
    @weakify(self)
    [self.contentTextView.rac_textSignal subscribeNext:^(NSString *x) {
        @strongify(self)
        self.viewModel.groupContent = x;
    }];
}


-(void) bindViewModel:(id) viewModel {
    self.viewModel = viewModel;
    
    
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
