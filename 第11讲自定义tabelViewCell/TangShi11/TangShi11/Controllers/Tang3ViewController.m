//
//  Tang3ViewController.m
//  TangShi11
//
//  Created by scjy on 15/12/5.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//
#define kWideth  [UIScreen mainScreen].bounds.size.width
#import "Tang3ViewController.h"

@interface Tang3ViewController ()
@property(nonatomic,retain) UITableView *tableView;
@end

@implementation Tang3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"22.jpg"]];
    [self.view addSubview:self.tableView];
    [self.tableView release];
    

    
}
//行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
//分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellInder = @"tang3Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellInder];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellInder];
    }
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.text = self.contentString;
    
  
    return cell;
}
//text文本高度 自定义高度
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    CGRect textRect = [self.contentString boundingRectWithSize:CGSizeMake(kWideth / 2, 400) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
//    return textRect.size.height;
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
