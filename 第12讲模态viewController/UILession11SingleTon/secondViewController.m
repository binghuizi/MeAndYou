//
//  secondViewController.m
//  UILession11SingleTon
//
//  Created by scjy on 15/12/3.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "secondViewController.h"
#import "thirdViewController.h"
@interface secondViewController ()

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.8 alpha:1.0];
    self.title = @"second";
    
    UIBarButtonItem *secondVC= [[UIBarButtonItem alloc]initWithTitle:@"secondVc" style:UIBarButtonItemStylePlain target:self action:@selector(thirdNext)];
    self.navigationItem.rightBarButtonItem = secondVC;


}
- (void)thirdNext{
    thirdViewController *modelvc = [[thirdViewController alloc]init];
    // [self.navigationController pushViewController:modelvc animated:YES];
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
