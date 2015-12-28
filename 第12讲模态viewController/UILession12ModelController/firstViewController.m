//
//  firstViewController.m
//  UILession12ModelController
//
//  Created by scjy on 15/12/3.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "firstViewController.h"
#import "ModelViewController.h"
@interface firstViewController ()

@end

@implementation firstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
/*
 定义FirstViewController、ModalViewController。
 将window的根视图控制器指定为导航控制器，导航控制器管理firstVC。
 在firstVC的导航栏左侧设置按钮，设置title为modalView。点击按钮，模态展示导航控制器，导航控制器控制modalVC。
 在modalVC的导航栏左侧设置按钮，设置title为dismiss。点击按钮，返回firstVC。
 */
    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    self.title = @"first";
    
    UIBarButtonItem *firstVC= [[UIBarButtonItem alloc]initWithTitle:@"firstVc" style:UIBarButtonItemStylePlain target:self action:@selector(modelVC)];
    self.navigationItem.leftBarButtonItem = firstVC;
    




}
- (void)modelVC{
    ModelViewController *modelvc = [[ModelViewController alloc]init];
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
