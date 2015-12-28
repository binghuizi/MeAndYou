//
//  TangViewController.m
//  TangShi13Bloack
//
//  Created by scjy on 15/12/7.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "TangViewController.h"
#import "TangTableViewCell.h"
#import "TangModel.h"
#import "Tang2ViewController.h"
@interface TangViewController ()
@property(nonatomic,retain) NSMutableArray *arrayIndex;
@property(nonatomic,retain) TangModel *allinfors;
@property(nonatomic,retain) UITableView *tableview;

@end

@implementation TangViewController
//懒加载
-(NSMutableArray *)arrayIndex{
    if (_arrayIndex == nil) {
        _arrayIndex = [TangModel allInfo];//解析index
    }
    return _arrayIndex;
}
-(TangModel *)allinfors{
    if (_allinfors == nil) {
        _allinfors = [TangModel allInfors];
    }
    return _allinfors;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    
    self.tableview = [[UITableView alloc]initWithFrame:self.view.frame];
    self.tableview.dataSource = self;
    self.tableview.delegate=self;
    [self.view addSubview:self.tableview];
    [self.tableview release];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *array = self.arrayIndex[section];
    return array.count;
    //return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return self.arrayIndex.count;
     return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TangTableViewCell *tang1Cell = [TangTableViewCell getReusedID:tableView];
    NSArray *array = self.arrayIndex[indexPath.section];
   // tang1Cell.textLabel.text = [NSString stringWithFormat:@"%@",array[indexPath.row]];
    tang1Cell.textLabel.text = self.allinfors.section[indexPath.section];
//    NSLog(@"%@",array[indexPath.row]);
    return tang1Cell;
}

//////-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//////{
////    return self.allinfors.section[section];
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Tang2ViewController *tang2 = [[Tang2ViewController alloc]init];
    NSArray *array = self.arrayIndex[indexPath.section];
    NSString *str = array[indexPath.row];
    tang2.tsLabel = self.allinfors.content[str];
    NSLog(@"%@",tang2.tsLabel);
    [self.navigationController pushViewController:tang2 animated:YES];
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
