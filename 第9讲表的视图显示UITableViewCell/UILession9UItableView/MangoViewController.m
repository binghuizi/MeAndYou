//
//  MangoViewController.m
//  UILession9UItableView
//
//  Created by scjy on 15/11/30.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "MangoViewController.h"
//私有属性
@interface MangoViewController ()
@property(nonatomic,retain) UITableView *tableView;
@end

@implementation MangoViewController
-(void)dealloc{
    [_tableView release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    self.navigationItem.title = @"芒果iOS";
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
//分割线颜色
    self.tableView.separatorColor = [UIColor magentaColor];
//背景颜色
    self.tableView.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
//默认行高44；
    self.tableView.rowHeight = 60.0;
//默认样式SingleLine
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
//设置代理dataSource  delegate
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    [self.tableView release];

}
#pragma mark------------- 实现协议里面必须实现的方法
//每个分区里面有多少行 返回分区  有多少行  默认有1行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

//cell将要显示的位置 在哪个位置
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //reuseIdentifier重用标识符 重用队列触屏幕会添加到重用队列 添加屏幕先从重用队列里面取 如果重用队列是空的就创建一个新的队列
    
    //    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
//    cell.imageView.image = [UIImage imageNamed:@"1.png"];
//    cell.textLabel.text=@"姓名";
//    cell.detailTextLabel.text=@"gdfgvf";
    
    //1.定义一个 重用标识符  静态全局变量只创建一次  程序退出时释放
    //2.去TableView里面的重用队列取cell
    static NSString *cellIdentifier = @"CycleCell";
    UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
   //如果重用队列是空的 需要重新创建
    if (cell2 == nil) {
        //这里不能重新创建，继续使用上边创建建好的cell  重新创建一个cell  把新创建的cell的重用标识符设置为上边定义的重用标识符
        cell2 = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    //设置cell2 相关的属性和赋值
    cell2.imageView.image = [UIImage imageNamed:@"1.png"];
    //标题
   // cell2.textLabel.text = @"主标题  “姓名”";
    //indexPath 有两个属性 区域 行
  //  NSLog(@" %lu = %p",indexPath.row,&cell2);
    if (indexPath.row == 0) {
         cell2.textLabel.text = @"赵佳慧";
         cell2.detailTextLabel.text = @"冰慧子";
        
    }else if (indexPath.row == 1){
        cell2.textLabel.text = @"张鹏飞";
        cell2.detailTextLabel.text = @"小飞飞";
    }else if (indexPath.row == 2){
        cell2.textLabel.text = @"乔自朋";
        cell2.detailTextLabel.text = @"小朋朋";
    }else if (indexPath.row == 3){
        cell2.textLabel.text = @"李志鹏";
        cell2.detailTextLabel.text = @"小小志";
    }
    
    //cell2.detailTextLabel.text = @"name";
//    cell2.contentView.backgroundColor = [UIColor colorWithRed:1.0 green:0.8 blue:0.8 alpha:1.0];
        // cell.contentView = @"fgvf";
    return cell2;//返回创建好的cell
}
//在tableView 里有多少个分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
//返回每个分区的标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
       return @"111";
    }else if (section == 1){
        return @"222";
    }else if (section == 2){
        return @"333";
    }else if (section == 3){
        return @"444";
    }

    return @"ccx";
    
}
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return @"美女";
    }else if (section == 1){
        return @"帅哥";
    }else if (section == 2){
        return @"高富";
    }
    return @"靓女帅男";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//返回右侧索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSArray *titleArray = @[@"AA",@"BB",@"CC",@"DD",@"E"];
    return titleArray;
}

#pragma mark -------------分区高度  UITableViewDelegate代理方法
//区头的高度

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
//区尾的高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 30;
}
//自定义分区 区头
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    headerView.backgroundColor = [UIColor colorWithRed:1.0 green:0.7 blue:0.8 alpha:1.0];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    if (section == 0) {
        label.text = @"A";
    }else if (section == 1){
        label.text = @"B";
    }else if (section == 2){
        label.text = @"C";
    }else if (section == 3){
        label.text = @"D";
    }else if (section == 4){
        label.text = @"E";
    }

    
    label.textColor = [UIColor blueColor];
    [headerView addSubview:label];
    return headerView;
}
//自定义分区 区尾
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    if (section == 0) {
        label.text = @"a";
    }else if (section == 1){
        label.text = @"b";
    }else if (section == 2){
        label.text = @"c";
    }else if (section == 3){
        label.text = @"d";
    }else if (section == 4){
        label.text = @"e";
    }
    [footerView addSubview:label];
    return footerView;
}
//点击方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        NSLog(@"didSelectRowAtIndexPath:1");
    }else if (indexPath.section == 1){
        NSLog(@"didSelectRowAtIndexPath:2");
    }else if (indexPath.section == 2){
        NSLog(@"didSelectRowAtIndexPath:3");
    }else if (indexPath.section == 3){
        NSLog(@"didSelectRowAtIndexPath:4");
    }
    NSLog(@"第%ld区，第%ld行",indexPath.section,indexPath.row);
    
}
//设置某一行高度  返回每一行的高度 rowHeight只能设置统一高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 90;//第0区第0行的高度
        }
        return 60;
    }else if (indexPath.section == 1){
         return 30;//第一区每行全部高度都是30
    }
    return 44;
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
