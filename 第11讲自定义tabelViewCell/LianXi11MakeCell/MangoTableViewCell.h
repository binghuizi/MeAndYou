//
//  MangoTableViewCell.h
//  LianXi11MakeCell
//
//  Created by scjy on 15/12/2.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MangoModel.h"
@interface MangoTableViewCell : UITableViewCell
@property(nonatomic,retain) MangoModel *model;
+ (CGFloat)getCellHeightWithMangoModel:(MangoModel *)mangoModel;
@end
