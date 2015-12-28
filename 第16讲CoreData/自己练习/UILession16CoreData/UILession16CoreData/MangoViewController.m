//
//  MangoViewController.m
//  UILession16CoreData
//
//  Created by scjy on 15/12/21.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "MangoViewController.h"
#import "MangoViewController.h"
#import "XianShiTableViewCell.h"
@interface MangoViewController ()
@property(nonatomic,retain)UITableView *tableView;

@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.8 alpha:1.0];
    self.tableView.separatorColor = [UIColor blackColor];
    [self.view addSubview:self.tableView];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    
    
    }
//行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
//分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identir = @"cell";
    XianShiTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identir];
    if (cell == nil) {
        cell = [[XianShiTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identir];
    }
    return cell;
    
}

//添加操作
//1.tableView 处于可编辑状态
- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [self.tableView setEditing:YES animated:YES];
}
//2.每一行都处于可编辑状态
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
//3.指定可编辑的样式 添加或删除
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleInsert;
}
//4.提交添加
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
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
