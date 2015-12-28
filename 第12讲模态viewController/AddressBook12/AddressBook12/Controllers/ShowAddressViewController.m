//
//  ShowAddressViewController.m
//  AddressBook12
//
//  Created by scjy on 15/12/4.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//
#define kWideth  [UIScreen mainScreen].bounds.size.width
#import "ShowAddressViewController.h"

@interface ShowAddressViewController ()
@property(nonatomic,retain) UIView *viewNew;
@property(nonatomic,retain) UIImageView *addressImageView;
@property(nonatomic,retain) UILabel *nameLabel;
@property(nonatomic,retain) UILabel *genderLabel;
@property(nonatomic,retain) UILabel *ageLabel;
@property(nonatomic,retain) UILabel *phoneNumLabel;
@property(nonatomic,retain) UILabel *hobbyLabel;
@end


@implementation ShowAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"联系人详情";
    self.viewNew = [[UIView alloc]initWithFrame:self.view.frame];
    self.viewNew.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
//图片 名字 各个状态 显示的位置
    self.addressImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kWideth/ 4, 80, kWideth / 2 , kWideth / 2 )];
    self.nameLabel        = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 4, kWideth - 100,  kWideth , 50)];
    self.genderLabel      = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 4, kWideth - 70, kWideth, 40)];
    self.ageLabel         = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 4, kWideth - 40, kWideth, 40)];
    self.phoneNumLabel    = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 4, kWideth - 10, kWideth, 40)];
    self.hobbyLabel       = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 4, kWideth + 20, kWideth, 40)];
    self.addressImageView.layer.cornerRadius = self.addressImageView.frame.size.width/ 2;
    self.addressImageView.clipsToBounds = YES;
//字符串 + 传递过来的数据
    NSString *addressName   = [NSString stringWithFormat:@"姓名：%@ ",self.model.nameModel ];
    NSString *addressGender = [NSString stringWithFormat:@"性别：%@",self.model.genderModel];
    NSString *addressAge    = [NSString stringWithFormat:@"年龄：%@",self.model.ageGender];
    NSString *addressPhone  = [NSString stringWithFormat:@"电话号码：%@",self.model.phoneModel];
    NSString *addressHobby  = [NSString stringWithFormat:@"爱好：%@",self.model.hobbyModel];
//给各个label赋值 显示出来
    
    self.nameLabel.text     = addressName;
    self.genderLabel.text   = addressGender;
    self.ageLabel.text      = addressAge;
    self.phoneNumLabel.text = addressPhone;
    self.hobbyLabel.text    = addressHobby;
    
    self.addressImageView.image = [UIImage imageNamed:self.model.imageModel];
//字体大小
    self.nameLabel.font     = [UIFont systemFontOfSize:15];
    self.genderLabel.font   = [UIFont systemFontOfSize:15];
    self.ageLabel.font      = [UIFont systemFontOfSize:15];
    self.phoneNumLabel.font = [UIFont systemFontOfSize:15];
    self.hobbyLabel.font    = [UIFont systemFontOfSize:15];
//加载视图
    [self.view addSubview:self.viewNew];
    [self.viewNew addSubview:self.addressImageView];
    [self.viewNew addSubview:self.nameLabel];
    [self.viewNew addSubview:self.genderLabel];
    [self.viewNew addSubview:self.ageLabel];
    [self.viewNew addSubview:self.phoneNumLabel];
    [self.viewNew addSubview:self.hobbyLabel];
    
    [self.viewNew release];
    [self.addressImageView release];
    [self.nameLabel release];
    [self.genderLabel release];
    [self.ageLabel release];
    [self.phoneNumLabel release];
    [self.hobbyLabel release];
    


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
