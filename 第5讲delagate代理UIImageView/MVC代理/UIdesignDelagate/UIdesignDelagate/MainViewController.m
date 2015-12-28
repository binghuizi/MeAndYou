//
//  MainViewController.m
//  UIdesignDelagate
//
//  Created by scjy on 15/11/24.
//  Copyright (c) 2015年 张鹏飞. All rights reserved.
//

#import "MainViewController.h"
#import "MangoView.h"
#import "MangoViewController.h"

@interface MainViewController ()

{
    MangoView *mangoView;
}

@end

@implementation MainViewController


- (void)getTextFieldInput:(NSString *)text{
    
    mangoView.label.text=text;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
   
    mangoView=[[MangoView alloc]initWithFrame:self.view.frame];
    mangoView.backgroundColor=[UIColor redColor];
    [mangoView.btn addTarget:self action:@selector(goTo:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:mangoView];
    [mangoView release];
}


-(void)goTo:(UIButton *)btn{
    MangoViewController *mangoVC=[[MangoViewController alloc]init];
    
    //视图控制器的切换
    //模态视图
    //  self  是当前的视图控制器
    //presentViewController:  是将要切换的试图控制器对象
    //animated:YES  是否需要过度动画
    //completion:nil  切换后时候需要执行操作
    
    [self presentViewController:mangoVC animated:YES completion:nil];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    

}


@end
