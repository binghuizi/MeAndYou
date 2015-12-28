//
//  firstViewController.m
//  UILession11SingleTon
//
//  Created by scjy on 15/12/3.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "firstViewController.h"
#import "secondViewController.h"
#import "MangoSingleTon.h"
@interface firstViewController ()
@property(nonatomic,retain) UITextField *textField;
@end

@implementation firstViewController
-(void)dealloc{
    [_textField release];
    [super dealloc];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    self.title = @"first";
    
    UIBarButtonItem *firstVC= [[UIBarButtonItem alloc]initWithTitle:@"firstVc" style:UIBarButtonItemStylePlain target:self action:@selector(secondNext)];
    self.navigationItem.rightBarButtonItem = firstVC;

    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(50, 200, 270, 50)];
    self.textField.backgroundColor = [UIColor lightGrayColor];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.placeholder = @"请输入";
    self.textField.textAlignment = NSTextAlignmentCenter;
    self.textField.font = [UIFont systemFontOfSize:20];
    //
    
    
    [self.view addSubview:self.textField];
    [self.textField release];



}
- (void)secondNext{
    MangoSingleTon *mangString = [MangoSingleTon sharedInstance];
    mangString.inputText = self.textField.text;
    
    
    secondViewController *modelvc = [[secondViewController alloc]init];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:modelvc];
    //模态视图控制器 显示效果
    modelvc.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    //弹入动画效果
    modelvc.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    
    [self presentViewController:nav animated:YES completion:nil];
    
    
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
