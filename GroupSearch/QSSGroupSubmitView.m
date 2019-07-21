//
//  QSSGroupSubmitView.m
//  GroupSearch
//
//  Created by kyson on 2019/7/21.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSGroupSubmitView.h"
#import "QSSGroupSubmitViewModel.h"

@interface QSSGroupSubmitView ()

@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@property (nonatomic, strong) QSSGroupSubmitViewModel *viewModel;
@end

@implementation QSSGroupSubmitView

-(void)awakeFromNib {
    [super awakeFromNib];
    self.submitButton.layer.cornerRadius = 4.f;
    self.submitButton.clipsToBounds = YES;
    @weakify(self);
    [[self.submitButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self.viewModel.submitButtonClickedSubject sendNext:nil];
    }];
    
    [RACObserve(self, viewModel.showErrorMsg) subscribeNext:^(id  _Nullable x) {
        @strongify(self);
        
    }];
}


-(void)bindViewModel:(id)viewModel {
    self.viewModel = viewModel;
    
    
}

+(id)loadFromXib {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self.class) owner:nil options:nil].firstObject;
}



@end
