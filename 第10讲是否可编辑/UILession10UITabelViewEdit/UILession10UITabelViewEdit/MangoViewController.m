//
//  MangoViewController.m
//  UILession10UITabelViewEdit
//
//  Created by scjy on 15/12/1.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "MangoViewController.h"

@interface MangoViewController ()
@property(nonatomic,retain) UITableView *tabelView;
@property(nonatomic,retain) NSMutableArray *array;
@end

@implementation MangoViewController
-(void)dealloc{
    [_tabelView release];
    [_array release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.navigationItem.title = @"编辑";
    self.tabelView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tabelView.separatorColor = [UIColor magentaColor];
    self.tabelView.backgroundColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.8 alpha:1.0];
    self.tabelView.rowHeight = 60;
    //设置代理
    self.tabelView.dataSource = self;
    self.tabelView.delegate = self;
    [self.view addSubview: self.tabelView];
    [self.tabelView release];
//各个数组
    NSMutableArray *group1 = [NSMutableArray arrayWithObjects:@"A",@"B",@"C",@"D",nil];
    NSMutableArray *group2 = [NSMutableArray arrayWithObjects:@"a",@"b",@"c",@"d",@"e",nil];
    
    NSMutableArray *group3 = [NSMutableArray arrayWithObjects:@"Aa",@"Bb",@"Cc",nil];
    NSMutableArray *group4 = [NSMutableArray arrayWithObjects:@"aa",@"bb",@"cc",@"dd",@"ee",@"ff",nil];
    //初始化数组
    self.array = [NSMutableArray new];
    [self.array addObject:group1];
    [self.array addObject:group2];
    [self.array addObject:group3];
    [self.array addObject:group4];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *bar =[[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(finish)];
    self.navigationItem.leftBarButtonItem = bar;


}
#pragma mafk   实现代理方法-----------------
//返回行数  每显示一次cell丢回调用该方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   //取出对分区 下边的小组
    NSMutableArray *group = self.array[section];
    return group.count;
}
//设置分区Sections
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.array.count;
}
//cell显示的位置  内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//静态全局变量   1.重用标识符
   static NSString *cellIdetir = @"CelyCell";
//2.从重用队列（cellIdetir）中取TableViewCell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdetir];
//3.如果为空 表示重用队列 没有可用对象   自己重新创建一个
   
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdetir];
    }
    
    //取出当前分区 下边的小组
    NSMutableArray *group = self.array[indexPath.section];
    cell.textLabel.text = group[indexPath.row];
    
    
    return cell;//返回当前创建好的cell
}
//区头
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    for (int i = 0; i < self.array.count; i++) {
        if (section == i) {
            NSString *string = [NSString stringWithFormat:@"第%d组",i + 1];
            return string;
        }
    }
    return @"第4组";
}

#pragma mark  tableView   删除操作----------------
//1.处于可 编辑
- (void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [self.tabelView setEditing:YES animated:YES];//1.处于可编辑状态
    
    
}
//2.哪一行可编辑  让所有cell都处于可编辑状态
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
//3.指定可编辑的样式 选择tableView编辑样式 添加或删除
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;//删除样式
}
//4.编辑完成 提交（先操作数据源 后更新UI） 修改数据源
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
   // 1.找到对应分区数组  2.删除数组 中对应数据
    NSMutableArray *group = self.array[indexPath.section];
    [group removeObjectAtIndex:indexPath.row];
    //通知TableView删除对应行
    [self.tabelView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)finish{
    [self.tabelView setEditing:NO animated:YES];
}
#pragma mark  移动操作-----------------
//1.让tableView处于可编辑状态
//2.tableView指定哪个可移动
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;//所有都可移动
}
//3.移动
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    //1.获取元素数组
    NSMutableArray *group = self.array[sourceIndexPath.section];
    //2.当前数组对应位置的元素取出来 指向将要删除的元素如果继续访问，存下潜在的风险 添加retain持有这个对象一份
    NSString *name = [group[sourceIndexPath.row] retain];//
    //3.把元素从原来位置  删除
    [group removeObjectAtIndex:sourceIndexPath.row];
    //4.元素取出来插入到新的位置
    [group insertObject:name atIndex:destinationIndexPath.row];
    [name release];
}
//监测移动过程 实现限制区域移动
-(NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{
    //判断起始位置的区域  将要移动到目的地区域  是否是同一个区域
    if (sourceIndexPath.section == proposedDestinationIndexPath.section) {
        return proposedDestinationIndexPath;
    }
    return sourceIndexPath;//返回原来的位置  从哪来回哪去
}
#pragma mark 添加操作----------
////3.样式
//-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return UITableViewCellEditingStyleInsert;//添加样式
//}
////4.提交添加
//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//    // 1.找到对应分区数组  2.添加数组 中对应数据
//    NSMutableArray *group = self.array[indexPath.section];
//    //3.在数组中指定位置添加元素
//    [group insertObject:@"添加新元素" atIndex:indexPath.row];
//    //通知TableView添加对应行
//    [self.tabelView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
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
