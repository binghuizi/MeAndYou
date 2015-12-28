//
//  Tang2ViewController.m
//  TangShi11
//
//  Created by scjy on 15/12/5.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "Tang2ViewController.h"
#import "Tang2TableViewCell.h"
#import "Tang3ViewController.h"
@interface Tang2ViewController ()
@property(nonatomic,retain) UITableView *tabelView;
@property(nonatomic,retain) NSArray *twoIndexArry;
@property(nonatomic,retain) NSMutableArray *twoAllNameArry;
@property(nonatomic,retain) NSMutableDictionary *dicContent;
@end

@implementation Tang2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"目录";
    self.tabelView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tabelView.separatorColor = [UIColor magentaColor];
    self.tabelView.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"22.jpg"]];
    self.tabelView.dataSource = self;
    self.tabelView.delegate = self;
    [self.view addSubview:self.tabelView];
    [self.tabelView release];
    
    [self configData];
    
}
- (void)configData{
    //只解析index
    NSString *path = [[NSBundle mainBundle]pathForResource:@"tangshi" ofType:@".plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
   
    self.dicContent = dic[@"content"];
    
    NSDictionary *dictIndex = dic[@"index"];
    self.twoAllNameArry = dictIndex[self.sectionTitle];//字典下标【第一页面点击的一行】
    
}


//行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"%lu",self.twoAllNameArry.count);
    return self.twoAllNameArry.count;
}
//分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
       static NSString *cellIdentr = @"tang2Cell";
    Tang2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentr];
    if (cell == nil) {
        cell = [[Tang2TableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentr];
    }
    cell.backgroundColor = [UIColor clearColor];
    TangModel *model =[[TangModel alloc]initWithString:self.twoAllNameArry[indexPath.row]];
    cell.model = model;
    
    
    return cell;
}

//触发事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Tang3ViewController *tang3 = [[Tang3ViewController alloc]init];
    NSString *string = self.twoAllNameArry[indexPath.row];
    tang3.contentString = self.dicContent[string];
    
    
    [self.navigationController pushViewController:tang3 animated:YES];
    
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
