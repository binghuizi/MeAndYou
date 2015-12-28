//
//  MainViewController.m
//  UILessionTouchEvent
//
//  Created by scjy on 15/11/23.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "MainViewController.h"
#import "ManggoTouchView.h"
#import "TouchMoveView.h"
@interface MainViewController ()

@end

@implementation MainViewController
//加载当前视图控制器自带的View
-(void)loadView{
    [super loadView];//先写父类的初始化
    //有自定义的view  《ManggoTouchView》区覆盖Controller自带的view
    self.view = [[ManggoTouchView alloc]initWithFrame:self.view.frame];
   // self.view.backgroundColor = [UIColor purpleColor];


}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

//    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    //UIResponder
//大小和self.view一样大
//    ManggoTouchView * manggoView = [[ManggoTouchView alloc]initWithFrame:self.view.frame];
//    
//    [self.view addSubview:manggoView];
//    [manggoView release];
//    
//        TouchMoveView *touch = [[TouchMoveView alloc]initWithFrame:CGRectMake(50, 300, 100, 100)];
//        [self.view addSubview:touch];
//    [touch release];
 
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
