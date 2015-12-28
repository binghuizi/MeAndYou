//
//  MainViewController.m
//  Home4LessionTouchResbonder
//
//  Created by scjy on 15/11/23.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "MainViewController.h"
#import "ManggoView.h"
@interface MainViewController ()

@end

@implementation MainViewController
-(void)loadView{
    [super loadView];//先写父类的初始化
    //有自定义的view  《ManggoTouchView》区覆盖Controller自带的view
    self.view = [[ManggoView alloc]initWithFrame:self.view.frame];
    // self.view.backgroundColor = [UIColor purpleColor];
    
    
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
