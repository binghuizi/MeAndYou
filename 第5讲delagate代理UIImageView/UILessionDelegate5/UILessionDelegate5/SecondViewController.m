//
//  SecondViewController.m
//  UILessionDelegate5
//
//  Created by scjy on 15/11/25.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "SecondViewController.h"
#import "SecondView.h"
@interface SecondViewController (){
    SecondView *_secondView;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

   _secondView = [[SecondView alloc]initWithFrame:self.view.frame];
    _secondView.backgroundColor = [UIColor lightGrayColor];
    [_secondView.button addTarget:self action:@selector(goback) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_secondView];
    [_secondView release];



}

-(void)goback{
    //判断是否有这个代理类存在 并且这个代理类响应这个协议
    if (self.delegate && [self.delegate respondsToSelector:@selector(getTextFieldInputText:)] ) {
        [self.delegate getTextFieldInputText:_secondView.textfield.text];
    }
    
    //Animated视图是否需要过度动画  completion完成之后需要执行的操作
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"已经返回");
    }];

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
