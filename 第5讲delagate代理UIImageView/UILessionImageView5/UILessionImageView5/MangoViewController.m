//
//  MangoViewController.m
//  UILessionImageView5
//
//  Created by scjy on 15/11/25.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "MangoViewController.h"
#import "MangoView.h"
@interface MangoViewController ()

@end

@implementation MangoViewController
-(void)loadView{
    [super loadView];
    //覆盖自带的view
    self.view = [[MangoView alloc]initWithFrame:self.view.frame];
    
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
