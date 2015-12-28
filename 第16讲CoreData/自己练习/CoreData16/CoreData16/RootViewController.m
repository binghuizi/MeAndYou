//
//  RootViewController.m
//  CoreData16
//
//  Created by scjy on 15/12/24.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "RootViewController.h"
#import "AppDelegate.h"
#import "Teacher.h"
#import "TableViewCell.h"
@interface RootViewController ()
{
    NSInteger count;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;


//数据管理器
@property(weak,nonatomic) NSManagedObjectContext *managerObjectContext;
@property(nonatomic,strong) NSMutableArray *dataSourceArray;
@property(nonatomic,strong) NSArray *teacherArray;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    count = 0;
    //通过应用程序的单利方法获得AppDelegate对象
    AppDelegate *delagate = [UIApplication sharedApplication].delegate;
    //把adddelegate里边的数据管理器工具类赋值给当前页面的数据管理器工具类
    self.managerObjectContext = delagate.managedObjectContext;
    self.dataSourceArray = [NSMutableArray new];
    self.teacherArray = @[@"兰博基尼",@"凯迪拉克",@"玛莎拉蒂"@"劳斯莱斯",@"柯尼塞格",@"法拉利",@"宾利",@"帕加尼",@"布加迪",@"西尔贝"];
    self.tableView.rowHeight = 118;
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];//设置identifiery
    
    //请求数据管理器工具类
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Teacher"];
    //数组
    NSArray *array = [self.managerObjectContext executeFetchRequest:request error:nil];
    [self.dataSourceArray addObjectsFromArray:array];
}
//返回行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    //把teacher类从数组中取出
    Teacher *teacher = self.dataSourceArray[indexPath.row];
    cell.nameLabel.text = [NSString stringWithFormat:@"姓名：%@",teacher.name];
    cell.genderLabel.text = [NSString stringWithFormat:@"性别：%@",teacher.gander];
    cell.ageLabel.text = [NSString stringWithFormat:@"年龄：%@",teacher.age];
    return cell;
}

- (IBAction)addTeacher:(id)sender {
 //获得实体描述信息
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Teacher" inManagedObjectContext:self.managerObjectContext];
    Teacher *teacher = [[Teacher alloc]initWithEntity:entityDescription insertIntoManagedObjectContext:self.managerObjectContext];
    
    if (self.teacherArray.count == count) {
        count = 0;
    }
    teacher.name = self.teacherArray[count];
    teacher.age = @(18);
    teacher.gander = @"女";
    //保存数据
    NSError *error = nil;
    [self.managerObjectContext save:&error];
    //请求数据管理器
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"Teacher"];
    
    NSArray *array = [self.managerObjectContext executeFetchRequest:request error:nil];
    //把查询的数据的数组的最后一个元素添加到dataSourceArray里
    [self.dataSourceArray addObject:array.lastObject];
    [self.tableView reloadData];
    count++;
    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //从数据库中删除当前行
        Teacher *teacher = self.dataSourceArray[indexPath.row];
        [self.managerObjectContext deleteObject:teacher];
        //保存跟新的数据
        [self.managerObjectContext save:nil];
        //然后从数组中移除
        [self.dataSourceArray removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        
        
        
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"删除";
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
