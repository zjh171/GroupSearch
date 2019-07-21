//
//  QSSGroupContentCell.h
//  GroupSearch
//
//  Created by kyson on 2019/7/13.
//  Copyright © 2019 cn.kyson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QSSGroupContentCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface QSSGroupContentCell : UITableViewCell


-(void) bindViewModel:(id) viewModel;

@end

NS_ASSUME_NONNULL_END
