//
//  TangTableViewCell.h
//  TangShi13Bloack
//
//  Created by scjy on 15/12/7.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TangModel.h"
@interface TangTableViewCell : UITableViewCell
@property (nonatomic, retain) TangModel *model;
+(instancetype)getReusedID:(UITableView *)tableView;
@end
