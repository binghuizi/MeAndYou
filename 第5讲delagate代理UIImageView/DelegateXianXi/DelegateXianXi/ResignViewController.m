//
//  ResignViewController.m
//  DelegateXianXi
//
//  Created by scjy on 15/11/26.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "ResignViewController.h"

@interface ResignViewController ()
@property(nonatomic,retain) UILabel *label;
@property(nonatomic,retain) UITextField *textField;
@property(nonatomic,retain) UILabel *label2;
@property(nonatomic,retain) UITextField *textField2;
@end

@implementation ResignViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(30, 100, 100, 50)];
    
    self.label.text = @"用户名";
    
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, 200, 30)];
    
    
    self.label2 = [[UILabel alloc]initWithFrame:CGRectMake(30, 200, 100, 50)];
    
    self.label2.text = @"密码";
    
    
    self.textField2 = [[UITextField alloc]initWithFrame:CGRectMake(100, 200, 200, 30)];
    
   
    
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.backgroundColor = [UIColor lightGrayColor];
    self.textField2.borderStyle = UITextBorderStyleRoundedRect;
    self.textField2.backgroundColor = [UIColor lightGrayColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 280, 100, 50);
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.label];
    
    [self.view addSubview:self.textField2];
    [self.view addSubview:self.label2];
    
    
    
    
}
//3.在需要触发的地方让代理对象给你执行协议里面的方法
- (void)needMoney{
    [self.delegate makeMoney:@"给我钱"];
}
-(void)back{
    //如果代理对象存在  看这个方法是否存在 存在才能去执行
    if (self.delegate &&[self.delegate respondsToSelector:@selector(getTextFieldName:passWord:)]) {
        [self.delegate getTextFieldName:self.textField.text passWord:self.textField2.text];
        [self.delegate makeMoney:@"给我钱"];
    }
    
    //执行代理需要传参数
    
    //导航控制器返回方法 不需要指定返回到哪   从哪来到哪去
    [self.navigationController popViewControllerAnimated:YES];
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
