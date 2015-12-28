//
//  thirdViewController.m
//  UILession11SingleTon
//
//  Created by scjy on 15/12/3.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "thirdViewController.h"
#import "MangoSingleTon.h"
@interface thirdViewController ()

@end

@implementation thirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.8 blue:0.5 alpha:1.0];
    //单利使用过程中不能alloc  确保单利属性唯一性
    MangoSingleTon *mango = [MangoSingleTon sharedInstance];
    self.title = mango.inputText ;
    
    UIBarButtonItem *thirdVC= [[UIBarButtonItem alloc]initWithTitle:@"thirddVc" style:UIBarButtonItemStylePlain target:self action:@selector(modelVC)];
    self.navigationItem.rightBarButtonItem = thirdVC;

}
- (void)modelVC{
    
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
