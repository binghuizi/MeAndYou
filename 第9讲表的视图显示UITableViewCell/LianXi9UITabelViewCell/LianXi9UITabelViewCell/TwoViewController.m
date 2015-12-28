//
//  TwoViewController.m
//  LianXi9UITabelViewCell
//
//  Created by scjy on 15/12/1.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "TwoViewController.h"
#import "MangoViewController.h"
@interface TwoViewController ()
@property(nonatomic,retain) UITableView *tableView;
@property(nonatomic,retain) UIView *viewNew;
@property(nonatomic,retain) UIImageView *imageView;
@property(nonatomic,retain) UILabel *namebel;
@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.navigationItem.title = @"通讯录详情";
//    self.view.backgroundColor = [UIColor lightGrayColor];
//    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame];
//    self.tableView.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
//    //分割线
//    self.tableView.separatorColor = [UIColor magentaColor];
//    self.tableView.rowHeight = 60;
//    //设置代理
//    //self.tableView.dataSource = self;
//    
//    [self.view addSubview:self.tableView];
//    [self.tableView release];
//
   // self.view.backgroundColor = [UIColor orangeColor];
    
    MangoViewController *man = [[MangoViewController alloc]init];
   
   
    self.viewNew = [[UIView alloc]initWithFrame:CGRectMake(0, 10, self.view.frame.size.width, 200)];
    self.viewNew.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 100, 100)];
    self.namebel = [[UILabel alloc]initWithFrame:CGRectMake(200, 50, 100, 40)];
    self.namebel.backgroundColor = [UIColor magentaColor];
    self.namebel.textColor = [UIColor blueColor];
    //self.imageView.image = [UIImage imageNamed:man.cell.imageView.image;
    self.namebel.text = man.cell.textLabel.text;
    NSLog(@"dcdcds");
     [self.view addSubview:self.viewNew];
    [self.viewNew addSubview:self.imageView];
    [self.viewNew addSubview:self.namebel];
    //[self.viewNew addSubview:man.cell.imageView.image];
}


    
 
    
    



//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    self.cell.imageView.image = [UIImage imageNamed:imageName];
//    self.cell.textLabel.text = nameLabel;
//    self.cell.detailTextLabel.text = number;
//    return self.cell;
//}

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
