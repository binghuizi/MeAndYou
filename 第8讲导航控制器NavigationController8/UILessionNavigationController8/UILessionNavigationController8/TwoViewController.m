//
//  TwoViewController.m
//  UILessionNavigationController8
//
//  Created by scjy on 15/11/27.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "TwoViewController.h"
#import "ThreeViewController.h"
@interface TwoViewController ()
@property(nonatomic, retain) UITextField *textField;
@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
 //按钮1 button1
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.frame = CGRectMake(100, 100, 100, 50);
    [nextButton setTitle:@"下一页" forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(goToNext) forControlEvents:UIControlEventTouchUpInside];
//按钮2 button2
    UIButton *postButton = [UIButton buttonWithType:UIButtonTypeCustom];
    postButton.frame = CGRectMake(100, 200, 100, 50);
    [postButton setTitle:@"上一页" forState:UIControlStateNormal];
    [postButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [postButton addTarget:self action:@selector(goToPost) forControlEvents:UIControlEventTouchUpInside];
    
 //文本框
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(50, 300, self.view.frame.size.width - 50, 50)];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.backgroundColor = [UIColor lightGrayColor];
//自定义设置标题
    UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
    titleButton.frame = CGRectMake(0, 0, 200, 50);
    [titleButton setTitle:@"自定义返回" forState:UIControlStateNormal];
    [titleButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    //创建导航button   左按钮
    
    UIBarButtonItem *leaftButton = [[UIBarButtonItem alloc]initWithCustomView:titleButton];
    self.navigationItem.leftBarButtonItem = leaftButton;
    
    [self.view addSubview:titleButton];
    [self.view addSubview:self.textField];
    [self.view addSubview:postButton];
    [self.view addSubview:nextButton];
    [self.textField release];
    //导航栏标题
    self.navigationItem.title = @"Two";

}
//下一页
- (void)goToNext{
    ThreeViewController *threeView = [[ThreeViewController alloc]init];
    //传值 传字符串
   // threeView.string = @"哈喽";
    threeView.string = self.textField.text;
    [self.navigationController pushViewController:threeView animated:YES];
    
}
//上一页
- (void)goToPost{
    
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
