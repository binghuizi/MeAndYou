//
//  NJWeiboCell.h
//  WeiBoTabBar13
//
//  Created by scjy on 15/12/14.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NJWeiboFrame.h"
@interface NJWeiboCell : UITableViewCell
//接收外界传入的模型
@property(nonatomic,retain) NJWeiboFrame *weiboFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;
@end
