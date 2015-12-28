//
//  OneViewController.m
//  UILessionNavigationController8
//
//  Created by scjy on 15/11/27.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "OneViewController.h"
#import "TwoViewController.h"
@interface OneViewController ()

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.frame = CGRectMake(100, 100, 100, 50);
    [nextButton setTitle:@"下一页" forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(goToNext) forControlEvents:UIControlEventTouchUpInside];
   
     [self.view addSubview:nextButton];
    //导航栏标题
     self.navigationItem.title = @"One";
    
    //默认导航栏是透明的   no 是不透明的
    self.navigationController.navigationBar.translucent = YES;
    //导航栏上按钮和文字颜色
    self.navigationController.navigationBar.tintColor = [UIColor magentaColor];
    //导航栏样式
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    //导航栏颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
  //导航栏上navigationItem
    UIBarButtonItem *leftBarButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(leftBarAction)];
   
    //1.设置导航栏上的左右按钮  把leftBarButton设置为navigationItem左按钮
    self.navigationItem.leftBarButtonItem = leftBarButton;
    //自定义视图 rightButton
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 100, 50);
    [rightButton setTitle:@"下一页" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    
    //2.创建的按钮设置为UIBarButtonItem 初始化的时候自定义视图
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = right;
}

-(void)leftBarAction{
    TwoViewController *twoView = [[TwoViewController alloc]init];
    //通过self 找控制器navigationController
    [self.navigationController pushViewController:twoView animated:YES];
}
- (void)rightAction{
    TwoViewController *twoView = [[TwoViewController alloc]init];
    //通过self 找控制器navigationController
    [self.navigationController pushViewController:twoView animated:YES];
}

- (void)goToNext{
    TwoViewController *twoView = [[TwoViewController alloc]init];
    //通过self 找控制器navigationController
    [self.navigationController pushViewController:twoView animated:YES];
    
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
