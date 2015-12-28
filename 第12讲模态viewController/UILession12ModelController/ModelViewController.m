//
//  ModelViewController.m
//  UILession12ModelController
//
//  Created by scjy on 15/12/3.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "ModelViewController.h"

@interface ModelViewController ()

@end

@implementation ModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.8 alpha:1.0];
    self.title = @"model";
    UIBarButtonItem *modelVC= [[UIBarButtonItem alloc]initWithTitle:@"modelVc" style:UIBarButtonItemStylePlain target:self action:@selector(modelVC)];
    self.navigationItem.leftBarButtonItem = modelVC;



}
- (void)modelVC{
    [self dismissViewControllerAnimated:YES completion:nil];
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
