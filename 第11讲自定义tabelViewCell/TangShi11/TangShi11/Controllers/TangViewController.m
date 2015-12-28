//
//  TangViewController.m
//  TangShi11
//
//  Created by scjy on 15/12/5.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "TangViewController.h"
#import "TangTableViewCell.h"
#import "Tang2ViewController.h"
@interface TangViewController ()
@property(nonatomic,retain) UITableView *tableView;
@property(nonatomic,retain) NSArray *oneAllSectionArray;
@property(nonatomic,retain) NSMutableDictionary *dicContent;
@end

@implementation TangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"唐诗三百首";
    self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.separatorColor = [UIColor magentaColor];
    self.tableView.backgroundColor =[UIColor colorWithPatternImage:[UIImage imageNamed:@"44.jpg"]];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview: self.tableView];
    [self.tableView release];
//解析文件
    [self configData];

}
- (void)configData{
    //只解析section
    NSString *path = [[NSBundle mainBundle]pathForResource:@"tangshi" ofType:@".plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    self.oneAllSectionArray = dic[@"section"];
    //self.dicContent = dic[@"content"];
    
   
}//行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.oneAllSectionArray.count;
}
//分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentir = @"tangCell";
    TangTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentir];
    if (cell == nil) {
        cell = [[TangTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentir];
    }
    cell.backgroundColor =[UIColor clearColor];
    TangModel *model =[[TangModel alloc]initWithString:self.oneAllSectionArray[indexPath.row]];
    cell.model = model;
    
    
    return cell;
}
//点击触发事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    Tang2ViewController *tang2 = [[Tang2ViewController alloc]init];
    tang2.sectionTitle = self.oneAllSectionArray[indexPath.row];
    
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
