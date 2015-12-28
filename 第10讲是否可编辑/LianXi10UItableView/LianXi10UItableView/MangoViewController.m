//
//  MangoViewController.m
//  LianXi10UItableView
//
//  Created by scjy on 15/12/1.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "MangoViewController.h"
#import "TwoViewController.h"
@interface MangoViewController ()
@property(nonatomic,retain) UITableView *tabelView;
@property(nonatomic,retain) NSMutableArray *nameArray;
@property(nonatomic,retain) NSMutableArray *numberArray;
@property(nonatomic,retain) NSMutableArray *imageArray;
@property(nonatomic,retain) NSMutableArray *genderArray;
@end

@implementation MangoViewController

-(void)dealloc{
    [_tabelView release];
    [super dealloc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   self.navigationItem.title = @"通讯录";

    self.tabelView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tabelView.backgroundColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.8 alpha:1.0];
    self.tabelView.separatorColor  = [UIColor magentaColor];
    self.tabelView.rowHeight = 60;
    self.tabelView.dataSource = self;
    self.tabelView.delegate = self;
    [self.view addSubview:self.tabelView];
    [self.tabelView release];
    
    NSMutableArray *group1 = [NSMutableArray arrayWithObjects:@"阿婆",@"阿公",@"安娜", nil];
    NSMutableArray *group2 = [NSMutableArray arrayWithObjects:@"波波",@"波斯猫",@"布谷鸟",@"芭比娃娃", nil];
    NSMutableArray *group3 = [NSMutableArray arrayWithObjects:@"楚楚动人",@"厨娘", nil];
    
    NSMutableArray *num1   = [NSMutableArray arrayWithObjects:@"123456",@"321456",@"987456", nil];
    NSMutableArray *num2   = [NSMutableArray arrayWithObjects:@"123789",@"98745666",@"45685255",@"4712399668", nil];
    NSMutableArray *num3   = [NSMutableArray arrayWithObjects:@"7896547896",@"963214", nil];
    
    NSMutableArray *image1 = [NSMutableArray arrayWithObjects:@"22.jpg",@"33.jpg",@"44.jpg", nil];
    NSMutableArray *image2 = [NSMutableArray arrayWithObjects:@"10.jpg",@"9.jpg",@"11.jpg",@"88.jpg", nil];
    NSMutableArray *image3 = [NSMutableArray arrayWithObjects:@"99.jpg",@"22.jpg", nil];
    
    NSMutableArray *gender1 = [NSMutableArray arrayWithObjects:@"女",@"男",@"女", nil];
    NSMutableArray *gender2 = [NSMutableArray arrayWithObjects:@"男",@"女",@"男",@"女", nil];
    NSMutableArray *gender3 = [NSMutableArray arrayWithObjects:@"女",@"男", nil];

    
    self.nameArray   = [NSMutableArray new];
    self.numberArray = [NSMutableArray new];
    self.imageArray  = [NSMutableArray new];
    self.genderArray  = [NSMutableArray new];
    [self.nameArray addObject:group1];
    [self.nameArray addObject:group2];
    [self.nameArray addObject:group3];
    [self.numberArray addObject:num1];
    [self.numberArray addObject:num2];
    [self.numberArray addObject:num3];
    [self.imageArray addObject:image1];
    [self.imageArray addObject:image2];
    [self.imageArray addObject:image3];
    [self.genderArray addObject:gender1];
    [self.genderArray addObject:gender2];
    [self.genderArray addObject:gender3];
//编辑按钮
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
//返回按钮
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(finsh)];
    self.navigationItem.leftBarButtonItem = leftBar;
}
#pragma mark UITableViewDataSource必须实现方法
//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSMutableArray *group = self.nameArray[section];
    return group.count;
}
//分区数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.nameArray.count;
}

//cell显示的位置  内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdetir = @"CelyCell";
    UITableViewCell *cell = [self.tabelView dequeueReusableCellWithIdentifier:cellIdetir];

    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdetir];
    }
    
    
    NSMutableArray *name = self.nameArray[indexPath.section];
    NSMutableArray *number = self.numberArray[indexPath.section];
    NSMutableArray *image = self.imageArray[indexPath.section];
   
    cell.textLabel.text = name[indexPath.row];
    cell.detailTextLabel.text = number[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:image[indexPath.row]];
    return cell;
}

//区头
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"A";
    }else if (section == 1){
        return @"B";
    }else if (section == 2){
        return @"C";
    }
    return @"D";
}
#pragma mark --删除操作
//1.设置可编辑状态
-(void)setEditing:(BOOL)editing animated:(BOOL)animated{
    [self.tabelView setEditing:YES animated:YES];
}
//2. 哪一行可编辑
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
//3.编辑样式 删除 或  添加
//-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return UITableViewCellEditingStyleDelete;
//}
//
////4. 编辑完提交
//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSMutableArray *group = self.nameArray[indexPath.section];
//    NSMutableArray *number = self.numberArray[indexPath.section];
//    NSMutableArray *image = self.imageArray[indexPath.section];
//    [group removeObjectAtIndex:indexPath.row];
//    [number removeObjectAtIndex:indexPath.row];
//    [image removeObjectAtIndex:indexPath.row];
//   //通知TableView删除对应行
//    [self.tabelView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//    
//}
#pragma mark -------添加操作
//3.编辑的样式添加
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleInsert;
}
//4.添加提交
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableArray *group   = self.nameArray[indexPath.section];
    NSMutableArray *number  = self.numberArray[indexPath.section];
    NSMutableArray *image   = self.imageArray[indexPath.section];
    
    [group insertObject:@"添加新元素" atIndex:indexPath.row];
    [number insertObject:@"123" atIndex:indexPath.row];
    [image insertObject:@"88.jpg" atIndex:indexPath.row];
    
    //通知TableView添加对应行
    [self.tabelView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}


//返回按钮 触发事件 返回不可编辑状态
- (void)finsh{
    [self.tabelView setEditing:NO animated:YES];
}

#pragma mark -------移动操作
//1.设置可编辑状态
//2.指定哪个位置可以(移动)编辑
-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
//3.移动
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
     //1.获取当前区域数组
    NSMutableArray *group = self.nameArray[sourceIndexPath.section];
    //2.取出当前要移动的元素
    NSString *name = [group[sourceIndexPath.row] retain];
    //3.删除原来的元素
    [group removeObjectAtIndex:sourceIndexPath.row];
    //4.取出当前元素 然后在插入到 新的位置（也就是移动的位置）
    [group insertObject:name atIndex:destinationIndexPath.row];
    
}
//监测移动操作 移动不能越界所在的区域
-(NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath{
    //判断起始位置区域 和目的地区域是否在同一个区域
    if (sourceIndexPath.section == proposedDestinationIndexPath.section) {
        return proposedDestinationIndexPath;
    }
    return sourceIndexPath;
}

//点击触发事件 联系人详细信息
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TwoViewController *twoControll = [[TwoViewController alloc]init];
    NSMutableArray *group = self.nameArray[indexPath.section];
    NSMutableArray *num   = self.numberArray[indexPath.section];
    NSMutableArray *image = self.imageArray[indexPath.section];
    NSMutableArray *gender = self.genderArray[indexPath.section];
    twoControll.name   = group[indexPath.row];
    twoControll.number = num[indexPath.row];
    twoControll.image  = image[indexPath.row];
    twoControll.gender = gender[indexPath.row];
    [self.navigationController pushViewController:twoControll animated:YES];

    
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
