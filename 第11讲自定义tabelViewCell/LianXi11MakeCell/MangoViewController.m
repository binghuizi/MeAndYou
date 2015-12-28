//
//  MangoViewController.m
//  LianXi11UITableViewCell
//
//  Created by scjy on 15/12/2.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "MangoViewController.h"
#import "MangoModel.h"
#import "MangoTableViewCell.h"
@interface MangoViewController ()
@property(nonatomic,retain) UITableView *tabelView;
@property(nonatomic,retain) NSArray *sectionArray;
@property(nonatomic,retain) NSMutableArray *allCarArray;
@end

@implementation MangoViewController
-(void)dealloc{
    [_tabelView release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"练习UITableViewCell";
    self.tabelView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tabelView.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    
    self.tabelView.separatorColor = [UIColor magentaColor];
    //设置代理
    self.tabelView.dataSource = self;
    self.tabelView.delegate = self;
    
    [self.view addSubview:self.tabelView];
    [self.tabelView release];
    //解析文件
    [self configTableDate];
    
    
}
- (void)configTableDate{
    //寻找工程名字Car.plist
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Car" ofType:@".plist"];
   //通过名字  取出文件中内容 root是子典型 所一创建字典对象 接收
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    self.sectionArray = dic.allKeys;//区域名字从dic取
    self.allCarArray = [NSMutableArray new];//初始化
    //遍历区域
    for (NSString *key in self.sectionArray) {
        NSMutableArray *group = [NSMutableArray new];
        NSArray *array = dic[key];//
        for (NSDictionary *dic in array) {
            MangoModel *model = [[MangoModel alloc]initWithDictionary:dic];//自定义的iniwith 方法return 返回给model(加工过的) model在添加group
            [group addObject:model];
        }
        [self.allCarArray addObject:group];
    }
}
#pragma mark----实现代理方法
//几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSMutableArray *group = self.allCarArray[section];
    
    return group.count;
}
//分区个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.allCarArray.count;
}
//cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //重组队列
    static NSString *cellIndetir = @"makeCell";
    
    MangoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetir];
    if (cell == nil) {
        cell = [[MangoTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndetir];
    }
    NSMutableArray *group = self.allCarArray[indexPath.section];
    MangoModel *model = group[indexPath.row];
    cell.model = model;//在自定的cell写一个model属性  然后传值
    
    
    return cell;
}

//标题 国家
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.sectionArray[section];
}
//每一行高度 自定义行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *group = self.allCarArray[indexPath.section];
    MangoModel *mangoModel = group[indexPath.row];
    CGFloat cellHeight = [MangoTableViewCell getCellHeightWithMangoModel:mangoModel];//文本高 + name高
    return cellHeight;
    
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
