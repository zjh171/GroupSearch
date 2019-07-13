//
//  QSSGroupContentCell.m
//  GroupSearch
//
//  Created by kyson on 2019/7/13.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import "QSSGroupContentCell.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface QSSGroupContentCell ()
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;



@end

@implementation QSSGroupContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self.contentTextView.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"updateTableView" object:nil];
    }];
    
    
}





- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
