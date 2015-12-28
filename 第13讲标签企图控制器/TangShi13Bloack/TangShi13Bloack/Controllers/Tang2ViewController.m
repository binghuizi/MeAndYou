//
//  Tang2ViewController.m
//  TangShi13Bloack
//
//  Created by scjy on 15/12/8.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//
#define kWidth self.view.frame.size.width
#define kHeight self.view.frame.size.height
#import "Tang2ViewController.h"

@interface Tang2ViewController ()

@end

@implementation Tang2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UITextView *textView = [[UITextView alloc]initWithFrame:self.view.frame];
    textView.text = self.tsLabel;
    textView.editable = NO;
    
    [self.view addSubview:textView];
    
    
    
    
    
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
