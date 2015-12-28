//
//  XiangXiViewController.m
//  AddressDateBase15
//
//  Created by scjy on 15/12/20.
//  Copyright © 2015年 scjy. All rights reserved.
//
#define kWideth  [UIScreen mainScreen].bounds.size.width
#import "XiangXiViewController.h"
#import "EditeViewController.h"
#import "DataBaseManger.h"
#import "SelectViewController.h"
@interface XiangXiViewController ()
@property(nonatomic,retain) UIView *viewNew;
@property(nonatomic,retain) UILabel *nameLabel;
@property(nonatomic,retain) UILabel *genderLabel;
@property(nonatomic,retain) UILabel *ageLabel;
@property(nonatomic,retain) UILabel *phoneNumLabel;
@property(nonatomic,retain) UILabel *remarksLabel;
@property(nonatomic,retain) UIButton *editButton;
@property(nonatomic,retain) UIButton *deleteButton;
@end

@implementation XiangXiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"联系人详情";
    self.viewNew = [[UIView alloc]initWithFrame:self.view.frame];
    self.viewNew.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    self.nameLabel        = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 4, kWideth - 100,  kWideth , 50)];
    self.genderLabel      = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 4, kWideth - 70, kWideth, 40)];
    self.ageLabel         = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 4, kWideth - 40, kWideth, 40)];
    self.phoneNumLabel    = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 4, kWideth - 10, kWideth, 40)];
    self.remarksLabel     = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 4, kWideth + 20, kWideth, 40)];
    
    //字符串 + 传递过来的数据
    NSString *linkName    = [NSString stringWithFormat:@"姓名：%@ ",self.linkMan.name ];
    NSString *linkGender  = [NSString stringWithFormat:@"性别：%@",self.linkMan.gender];
    NSString *linkAge     = [NSString stringWithFormat:@"年龄：%lu",self.linkMan.age ];
    NSString *linkPhone   = [NSString stringWithFormat:@"电话号码：%@",self.linkMan.phoneNumber];
    NSString *linkRemarks = [NSString stringWithFormat:@"备注：%@",self.linkMan.remarks];

    //给各个label赋值 显示出来
    
    self.nameLabel.text     = linkName;
    self.genderLabel.text   = linkGender;
    self.ageLabel.text      = linkAge;
    self.phoneNumLabel.text = linkPhone;
    self.remarksLabel.text  = linkRemarks;
    //字体大小
    self.nameLabel.font     = [UIFont systemFontOfSize:15];
    self.genderLabel.font   = [UIFont systemFontOfSize:15];
    self.ageLabel.font      = [UIFont systemFontOfSize:15];
    self.phoneNumLabel.font = [UIFont systemFontOfSize:15];
    self.remarksLabel.font    = [UIFont systemFontOfSize:15];
//编辑按钮
    self.editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.editButton.frame = CGRectMake(0, 0 , 100, 50);
    [self.editButton setTitle:@"编辑" forState:UIControlStateNormal];
    [self.editButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.editButton addTarget:self action:@selector(ediAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]initWithCustomView:self.editButton];
    self.navigationItem.rightBarButtonItem = rightBar;
//删除按钮
    self.deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.deleteButton.frame = CGRectMake(50, kWideth + 100, kWideth- 100, 40);
    self.deleteButton.backgroundColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.8 alpha:1.0];
    [self.deleteButton setTitle:@"删除该联系人" forState:UIControlStateNormal];
    [self.deleteButton addTarget:self action:@selector(deleteAction) forControlEvents:UIControlEventTouchUpInside];
    
    //加载视图
    [self.view addSubview:self.viewNew];
    [self.viewNew addSubview:self.nameLabel];
    [self.viewNew addSubview:self.genderLabel];
    [self.viewNew addSubview:self.ageLabel];
    [self.viewNew addSubview:self.phoneNumLabel];
    [self.viewNew addSubview:self.remarksLabel];
    [self.view addSubview:self.editButton];
    [self.view addSubview:self.deleteButton];
    
    [self.viewNew release];
    [self.nameLabel release];
    [self.genderLabel release];
    [self.ageLabel release];
    [self.phoneNumLabel release];
    [self.remarksLabel release];
}
//编辑按钮触发事件
- (void)ediAction{
    EditeViewController *editView = [[EditeViewController alloc]init];
    editView.nameString    = self.linkMan.name;
    editView.genderString  = self.linkMan.gender;
    editView.ageString      = self.linkMan.age ;
    editView.phoneNumberString = self.linkMan.phoneNumber;
    editView.remarkString = self.linkMan.remarks;
   
    [self.navigationController pushViewController:editView animated:YES];
    
}
//删除按钮触发事件
- (void)deleteAction{
    DataBaseManger *dataBase = [[DataBaseManger alloc]init];
    ;
    if ([dataBase deleteLinkManWithName:self.linkMan.name] == 1) {
        SelectViewController *selectVc = [[SelectViewController alloc]init];
        [self.navigationController pushViewController:selectVc animated:YES];
    }else{
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"提示" message:@"删除失败" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alter show];
    }
    
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
