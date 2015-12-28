//
//  MangoViewController.m
//  UIdesignDelagate
//
//  Created by scjy on 15/11/24.
//  Copyright (c) 2015年 张鹏飞. All rights reserved.
//

#import "MangoViewController.h"
#import "MangoVC.h"


//把方法和实例变量、属性定义在这里属于私有的
@interface MangoViewController ()
{
    
    //把view定义成全局变量
    MangoVC *view;
    
    
}
@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   view=[[MangoVC alloc]initWithFrame:self.view.frame];
    
    view.backgroundColor=[UIColor yellowColor];
    
    [view.btn addTarget:self action:@selector(Return:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:view];
    [view release];
    
    
    
    
}

-(void)Return:(UIButton *)btn{
    //
    [self.delegate  getTextFieldInput:view.tf.text];
    
    
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"wocvjkclkvb");
    }];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
