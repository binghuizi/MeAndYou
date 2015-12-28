//
//  ThreeViewController.m
//  UILessionNavigationController8
//
//  Created by scjy on 15/11/27.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "ThreeViewController.h"
#import "TwoViewController.h"
@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor magentaColor];
    
    
    UIButton *nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton.frame = CGRectMake(100, 200, 100, 50);
    [nextButton setTitle:@"返回上一页" forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextButton.backgroundColor = [UIColor lightGrayColor];
    [nextButton addTarget:self action:@selector(goToNext) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *nextButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton1.frame = CGRectMake(100, 300, 100, 50);
    [nextButton1 setTitle:@"根视图" forState:UIControlStateNormal];
    [nextButton1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextButton1.backgroundColor = [UIColor orangeColor];
    [nextButton1 addTarget:self action:@selector(backToRootVc) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *nextButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    nextButton2.frame = CGRectMake(100, 400, 200, 50);
    [nextButton2 setTitle:@"返回指定视图" forState:UIControlStateNormal];
    [nextButton2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    nextButton2.backgroundColor = [UIColor brownColor];
    [nextButton2 addTarget:self action:@selector(backToAnnyVc) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:nextButton1];
    [self.view addSubview:nextButton];
    [self.view addSubview:nextButton2];
    
    //导航栏标题
   // self.navigationItem.title = @"Three";
    //导航栏传值
    self.navigationItem.title = self.string;
    
    //栈顶
    NSLog(@"%@",self.navigationController.topViewController);
    //当前
    NSLog(@"%@",self.navigationController.visibleViewController);
}
//返回上一页
- (void)goToNext{
   //返回上一页操作 popViewControllerAnimated:YES 出栈操作
    [self.navigationController popViewControllerAnimated:YES];
    
}
//返回导航器根视图
- (void)backToRootVc{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
//返回指定视图
- (void)backToAnnyVc{
    //接收导航视图控制器里 在当前栈里所有数据
    NSArray *vcArray = self.navigationController.viewControllers;
    NSLog(@"%@",vcArray);
    //返回指定视图  下标  判断当前数组里面的第0个元素是不是TwoViewController类型
    if ([vcArray[0] isKindOfClass:[TwoViewController class]]) {
        [self.navigationController popToViewController:vcArray[0] animated:YES];
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
