//
//  MangoViewController.h
//  LianXi9UITabelViewCell
//
//  Created by scjy on 15/11/30.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MangoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain) UITableView *tableView;
@property(nonatomic,retain) UITableViewCell *cell;


@end
