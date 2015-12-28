//
//  MangoViewController.m
//  UILession11UITableViewCell
//
//  Created by scjy on 15/12/2.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//
#define kWideth  [UIScreen mainScreen].bounds.size.width
#import "MangoViewController.h"
#import "MangoTableViewCell.h"
#import "NSArray+EasyLog.h"//引入数组扩展 打印数组类目
#import "MangoModel.h"
@interface MangoViewController ()
@property(nonatomic,retain) UITableView *tabelView;
@property(nonatomic,retain) NSArray *sectionTitleArray;//分区标题的数组
@property(nonatomic,retain) NSMutableArray *allCarArray;//所有分区下汽车总和
@end

@implementation MangoViewController
-(void)dealloc{
    //安全释放
    [_tabelView release],_tabelView = nil;
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"自定义cell";
    self.tabelView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tabelView.backgroundColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.8 alpha:1.0];
   // self.tabelView.rowHeight = 100;
   //代理
    self.tabelView.dataSource = self;
    self.tabelView.delegate = self;
    self.tabelView.separatorColor = [UIColor magentaColor];
    [self.view addSubview:self.tabelView];
    [self.tabelView release];
    
    //解析plist文件中的数据方法
    [self configTableData];



}
- (void)configTableData{
    //寻找工程路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Car" ofType:@".plist"];
    //通过资源名字 路径解析文件中内容
    NSDictionary *dic =[NSDictionary dictionaryWithContentsOfFile:path];
    self.sectionTitleArray = dic.allKeys;//所有的key值取出
    self.allCarArray = [NSMutableArray new];

    //取数组
    for (NSString *key in self.sectionTitleArray) {
         NSMutableArray *group = [NSMutableArray new];
        NSArray *array = dic[key];//通过遍历字典中的key值 取出对应的value值
        
        for (NSDictionary *dic in array) {
            //把字典传入model内部进入数据模型的转化
            MangoModel *model = [[MangoModel alloc]initWithDictionary:dic];
            [group addObject:model];
            NSLog(@"%@",model.carName);
        }
        
        [self.allCarArray addObject:group];
    }
  
    
}
//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSMutableArray *group = self.allCarArray[section];//取出对应分区数组
    return group.count;
}
//分区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.sectionTitleArray.count;
}
//cell内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //定义重用标识符
    static NSString *celIdentir = @"Cycell";
    //从队列中 取出重用标识符Cycell  把原来系统UITableView创建的cell  换成自己定义的cell
    MangoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:celIdentir];
    if (cell == nil) {
        cell = [[MangoTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:celIdentir];
    }
    //
    NSMutableArray *group = self.allCarArray[indexPath.section];
    MangoModel *model = group[indexPath.row];
    cell.model = model;
    return cell;
}

//每一行高度  自定义每一行高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *group = self.allCarArray[indexPath.section];
    MangoModel *mangoModel = group[indexPath.row];
    //获取cell高度
    CGFloat cellHeight = [MangoTableViewCell getCellHeightWithMangoModel:mangoModel];
    return cellHeight;
}



//标题 哪个国家
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
        return self.sectionTitleArray[section];
    
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
