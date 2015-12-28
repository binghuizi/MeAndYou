//
//  MangoViewController.m
//  LianXi9UITabelViewCell
//
//  Created by scjy on 15/11/30.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "MangoViewController.h"
#import "TwoViewController.h"
@interface MangoViewController ()

@end

@implementation MangoViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"通讯录";
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    self.tableView.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    //分割线
    self.tableView.separatorColor = [UIColor magentaColor];
    self.tableView.rowHeight = 60;
    //设置代理
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self.tableView release];

}
#pragma mark ---------UITableViewDataSource-协议里必须实现的方法----------------
//在区域中显示几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
//设置分区Sections
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
//每一行中显示的内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *cellIdentifier = @"CycelCell";
    self.cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (self.cell == nil) {
        self.cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            self.cell.imageView.image = [UIImage imageNamed:@"88.jpg"];
            self.cell.textLabel.text = @"A小花";
            self.cell.detailTextLabel.text = @"123456";
        
        }else if (indexPath.row == 1){
            self.cell.imageView.image = [UIImage imageNamed:@"99.jpg"];
            self.cell.textLabel.text = @"A羊驼";
            self.cell.detailTextLabel.text = @"456789";
        }
    }else if (indexPath.section == 1){
            if (indexPath.row == 0) {
           self.cell.imageView.image = [UIImage imageNamed:@"22.jpg"];
           self.cell.textLabel.text = @"B花菜";
           self.cell.detailTextLabel.text = @"123987";
       }
    }else if (indexPath.section == 2){
          if (indexPath.row == 0){
        self.cell.imageView.image = [UIImage imageNamed:@"33.jpg"];
        self.cell.textLabel.text = @"C鸵鸟";
        self.cell.detailTextLabel.text = @"789123";
    }else if (indexPath.row == 1){
        self.cell.imageView.image = [UIImage imageNamed:@"44.jpg"];
        self.cell.textLabel.text = @"C白马";
        self.cell.detailTextLabel.text = @"987569";
      }
    }else if (indexPath.section == 3){
        if (indexPath.row == 0){
            self.cell.imageView.image = [UIImage imageNamed:@"33.jpg"];
            self.cell.textLabel.text = @"D乌龟";
            self.cell.detailTextLabel.text = @"789123";
        }else if (indexPath.row == 1){
            self.cell.imageView.image = [UIImage imageNamed:@"44.jpg"];
            self.cell.textLabel.text = @"D绵羊";
            self.cell.detailTextLabel.text = @"987569";
        
        }
    }
    
        
    

    return self.cell;
}

//每个分区 区头标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"A";
    }else if (section == 1){
        return @"B";
    }else if (section == 2){
        return @"C";
    }else if (section == 3){
        return @"D";
    }

    return @"E";
}
////每个区尾的 标题
//-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
//    if (section == 0) {
//        return @"1";
//    }else if (section == 1){
//        return @"2";
//    }else if (section == 2){
//        return @"3";
//    }else if (section == 3){
//        return @"4";
//    }
//    return @"5";
//}
//返回右侧索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSArray *tittleArray = @[@"AA",@"BB",@"CC",@"DD",@"EE"];
    return tittleArray;
}
#pragma mark ----UITableViewDelegate代理方法
//区头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
////区尾高度
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
//    return 30;
//}
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
//    return header;
//}

//自定义高度  自定义每一行的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        if (indexPath.row == 1) {
            return 0;
        }
    }
    return 60;
}
//点击方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TwoViewController *two = [[TwoViewController alloc]init];
//    if (self.delegateMango &&[self.delegateMango respondsToSelector:@selector(getImage:withName:andPhoneNumber:)]) {
        
 //   }
    [self.navigationController pushViewController:two animated:YES];
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
