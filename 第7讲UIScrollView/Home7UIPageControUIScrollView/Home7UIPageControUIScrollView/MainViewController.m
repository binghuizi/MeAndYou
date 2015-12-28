//
//  MainViewController.m
//  Home7UIPageControUIScrollView
//
//  Created by scjy on 15/11/30.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "MainViewController.h"
#import "MainView.h"
@interface MainViewController ()

@end

@implementation MainViewController
-(void)loadView{
    [super loadView];
    self.view = [[MainView alloc]initWithFrame:self.view.frame];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
