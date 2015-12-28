//
//  NJViewController.m
//  WeiBoTabBar13
//
//  Created by scjy on 15/12/14.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "NJViewController.h"
#import "NJWeibo.h"
#import "NJWeiboCell.h"
#import "NJWeiboFrame.h"
@interface NJViewController ()
@property (nonatomic, strong) NSArray *statusFrames;
@property (nonatomic,retain) UITableView *tableView;
@end

@implementation NJViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
}

#pragma mark - 数据源方法
//行
 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
 {
         return self.statusFrames.count;
     }

//cell
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
 {
         NJWeiboCell *cell = [NJWeiboCell cellWithTableView:tableView];
         // 3.设置数据
        cell.weiboFrame = self.statusFrames[indexPath.row];
    
         // 4.返回
         return cell;
     }
#pragma mark - 懒加载
//解析plist  数组、字典
 - (NSArray *)statusFrames
 {
         if (_statusFrames == nil) {
                 NSString *fullPath = [[NSBundle mainBundle] pathForResource:@"microblog.plist" ofType:nil];
                 NSArray *dictArray = [NSArray arrayWithContentsOfFile:fullPath];
                 NSMutableArray *models = [NSMutableArray arrayWithCapacity:dictArray.count];
                 for (NSDictionary *dict in dictArray) {
                         // 创建模型
                         NJWeibo *weibo = [NJWeibo weiboWithDic:dict];
                         // 根据模型数据创建frame模型
                         NJWeiboFrame *wbF = [[NJWeiboFrame alloc] init];
                         wbF.weibo = weibo;
            
                         [models addObject:wbF];
                     }
                self.statusFrames = [models copy];
             }
         return _statusFrames;
     }

#pragma mark - 代理方法
//自定义高度
 - (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
 {
         // NSLog(@"heightForRowAtIndexPath");
         // 取出对应航的frame模型
         NJWeiboFrame *wbF = self.statusFrames[indexPath.row];
         NSLog(@"height = %f", wbF.cellHeight);
         return wbF.cellHeight;
     }

 - (BOOL) prefersStatusBarHidden
 {
         return YES;
     }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
