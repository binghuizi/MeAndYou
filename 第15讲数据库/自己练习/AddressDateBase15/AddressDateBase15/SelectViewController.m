//
//  SelectViewController.m
//  AddressDateBase15
//
//  Created by scjy on 15/12/20.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "SelectViewController.h"
#import "DataBaseManger.h"
#import "SelectTableViewCell.h"
#import "XiangXiViewController.h"
@interface SelectViewController ()
@property(nonatomic,retain) UITableView *tableView;
@property(nonatomic,retain) NSMutableArray *array;
@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0 ];
    self.tableView.separatorColor = [UIColor magentaColor];
   
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self.tableView release];
    
    DataBaseManger *database = [[DataBaseManger alloc]init];
    self.array =  [database seleatAllLinkMans];
//自定义设置标题
    UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    titleButton.frame = CGRectMake(0, 0, 100, 50);
    [titleButton setTitle:@"返回" forState:UIControlStateNormal];
    [titleButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [titleButton addTarget:self action:@selector(fanhuiAction) forControlEvents:UIControlEventTouchUpInside];
//创建导航button   左按钮
    
    UIBarButtonItem *leaftButton = [[UIBarButtonItem alloc]initWithCustomView:titleButton];
    self.navigationItem.leftBarButtonItem = leaftButton;
    
}
//行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.array.count;
}
//分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cellSelect";
    SelectTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[SelectTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.backgroundColor = [UIColor colorWithRed:1.0 green:0.8 blue:0.5 alpha:1.0];
    LinkMan *link = self.array[indexPath.row];
    cell.linkMan = link;
    return cell;
}

//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
//点击显示详细信息
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    XiangXiViewController *xiangxiVc = [[XiangXiViewController alloc]init];
    xiangxiVc.linkMan = self.array[indexPath.row];
    [self.navigationController pushViewController:xiangxiVc animated:YES];
    
}
//点击返回按钮
-(void)fanhuiAction{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
