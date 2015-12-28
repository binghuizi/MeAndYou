//
//  MainViewController.m
//  UILessionCustemView
//
//  Created by scjy on 15/11/20.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "MainViewController.h"
#import "NewView.h"
@interface MainViewController ()

@end

@implementation MainViewController
//加载视图  MainViewController  自带的View
//-(void)loadView{
//    [super loadView];
//    //打印当前哪一个函数  哪一行
//    NSLog(@"%s %d",__FUNCTION__,__LINE__);
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s %d",__FUNCTION__,__LINE__);
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0 ];
//用户名
    NewView *newlabelField = [[NewView alloc]initWithFrame:CGRectMake(30, 100, 300, 50)];
    newlabelField.label.text = @"用户名";
    newlabelField.textField.placeholder = @"请输入用户名";

    
    [self.view addSubview:newlabelField];
    [newlabelField release];
    
//密码
    NewView *passLabelField = [[NewView alloc]initWithFrame:CGRectMake(30, 190, 300, 50)];
    passLabelField.label.text = @"密码";
    passLabelField.textField.placeholder = @"请输入密码";
//密文显示
    passLabelField.textField.secureTextEntry = YES;
    [self.view addSubview:passLabelField];
    [passLabelField release];
    
//手机号
    NewView *phoneNum = [[NewView alloc]initWithFrame:CGRectMake(30, 280, 300, 50)];
    
    phoneNum.label.text = @"手机号";
    phoneNum.textField.placeholder = @"请输入手机号";
  //弹出键盘类型
    phoneNum.textField.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:phoneNum];
    
    

}
////视图将要显示
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    NSLog(@"%s %d",__FUNCTION__,__LINE__);
//}
////视图已将显示
//-(void)viewDidAppear:(BOOL)animated{
//     [super viewDidAppear:animated];
//    NSLog(@"%s %d",__FUNCTION__,__LINE__);
//}


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
