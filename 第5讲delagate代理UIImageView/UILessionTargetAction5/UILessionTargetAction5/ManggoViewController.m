//
//  ManggoViewController.m
//  UILessionTargetAction5
//
//  Created by scjy on 15/11/24.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "ManggoViewController.h"
#import "ManggoView.h"
@interface ManggoViewController ()
@property(nonatomic,retain) ManggoView *manggoView;
@property(nonatomic,retain) ManggoView *manggoView2;
@property(nonatomic,retain) ManggoView *manggoView3;
@end

@implementation ManggoViewController
//-(void)loadView{
//    [super loadView];
//    //覆盖自带视图
//    self.view = [[ManggoView alloc]initWithFrame:self.view.frame];
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 //manggoView改变颜色
    self.manggoView = [[ManggoView alloc]init];
    self.manggoView.frame = CGRectMake(50, 100, 100, 100);
    self.manggoView.backgroundColor = [UIColor lightGrayColor];
    [self.manggoView addTarget:self action:@selector(changeColor)];
//manggoView2改变位置
    self.manggoView2 = [[ManggoView alloc]init];
    self.manggoView2.frame = CGRectMake(50, 230, 100, 100);
    self.manggoView2.backgroundColor = [UIColor blueColor];
    [self.manggoView2 addTarget2:self action2:@selector(chageWhere)];
    
    [self.view addSubview:self.manggoView2];
    [self.view addSubview:self.manggoView];
    [self.manggoView release];
    [self.manggoView2 release];

}
//改变颜色
-(void)changeColor{
    self.manggoView.backgroundColor = [UIColor purpleColor];
}
//改变位置
-(void)chageWhere{
    self.manggoView2.frame = CGRectMake(150, 230, 100, 100);
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
