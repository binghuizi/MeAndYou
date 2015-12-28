//
//  AddressBookViewController.m
//  AddressBook12
//
//  Created by scjy on 15/12/3.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "AddressBookViewController.h"
#import "AddressBookTableViewCell.h"
#import "AddressBookModel.h"
#import "ShowAddressViewController.h"
@interface AddressBookViewController ()
@property(nonatomic,retain) UITableView *tableView;
@property(nonatomic,retain) NSArray *sectionTitleArray;
@property(nonatomic,retain) NSMutableArray *allAddressArray;
@end

@implementation AddressBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"通讯录";
    [self.view addSubview:self.tableView];
//解析文件
    [self configTableData];

}
//lazy Loading 懒加载
-(UITableView *)tableView{
    if (_tableView == nil) {
        //不存在 创建一个
        self.tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        self.tableView.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0 ];
        self.tableView.separatorColor = [UIColor magentaColor];
//设置代理
        self.tableView.dataSource = self;
        self.tableView.delegate = self;
//添加背景图片
//        self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"3.jpg"]];
    }
    return _tableView;
}
//解析文件
- (void)configTableData{
//找到文件路径
    NSString *pth = [[NSBundle mainBundle]pathForResource:@"AddressBook" ofType:@".plist"];
//找到 转化成字典型的数据
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:pth];
    self.sectionTitleArray = dic.allKeys;//分区标题数组
    self.allAddressArray = [NSMutableArray new];
   
    for (NSString *key in self.sectionTitleArray) {
    
         __block NSMutableArray *groupArray = [NSMutableArray new];
        NSArray *array = dic[key];
        for (NSDictionary *dic in array) {
            //定义小组 存放每组人员的model数据
            AddressBookModel *model = [[AddressBookModel alloc]init];
            [model getModelFromDictionary:dic abdModelBlock:^(AddressBookModel *addressModel) {
                [groupArray addObject:addressModel];
                
            }];
        }
        [self.allAddressArray addObject:groupArray];
        
    }
    //NSLog(@"%@",self.allAddressArray);
    
}
//行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSMutableArray *group = self.allAddressArray[section];
    
    return group.count;
}
//分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.sectionTitleArray.count;
}
//cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //创建重用标识符
    static NSString *addressIdentifier = @"addressCell";
//从重用队列取出cell
    AddressBookTableViewCell *addressCell = [tableView dequeueReusableCellWithIdentifier:addressIdentifier];
    if (addressCell == nil) {
        addressCell = [[AddressBookTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:addressIdentifier];
    }
    //清除颜色
//    addressCell.backgroundColor = [UIColor clearColor];
    NSMutableArray *group = self.allAddressArray[indexPath.section];
    AddressBookModel *model = group[indexPath.row];//分区下数据model
    
    addressCell.model = model;
    
   
    return addressCell;
}

//标题
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return self.sectionTitleArray[section];
}

//自定义高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    AddressBookModel *model = self.allAddressArray[indexPath.section][indexPath.row];
    CGFloat height = [AddressBookTableViewCell getCellWithHeight:model];
    return height;
}

//点击显示详细信息
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ShowAddressViewController *showVc = [[ShowAddressViewController alloc]init];
    NSMutableArray *group = self.allAddressArray[indexPath.section];
    showVc.model = group[indexPath.row];
//
//    showVc.showImageName = model.imageModel;
//    showVc.showName = model.nameModel;
//    showVc.showGender = model.genderModel;
//    showVc.showAge = model.ageGender;
//    showVc.showPhoneNum = model.phoneModel;
//    showVc.showHobby = model.hobbyModel;
    

    [self.navigationController pushViewController:showVc animated:YES];
}

//返回右侧索引
-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    NSArray *titleArray = @[@"A",@"B",@"C",@"D",@"E"];
    return titleArray;
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
