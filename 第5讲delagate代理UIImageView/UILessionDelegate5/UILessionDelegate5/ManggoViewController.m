//
//  ManggoViewController.m
//  UILessionDelegate5
//
//  Created by scjy on 15/11/24.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "ManggoViewController.h"
#import "MangoView.h"
#import "SecondViewController.h"
@interface ManggoViewController ()

@end

@implementation ManggoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    
    self.mangoView = [[MangoView alloc]initWithFrame:self.view.frame];
    self.mangoView .backgroundColor = [UIColor brownColor];
    [self.mangoView .btn addTarget:self action:@selector(goToNext) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.mangoView ];
    
    
    

}
-(void)goToNext{
    
    SecondViewController *secondVc = [[SecondViewController alloc]init];
    secondVc.delegate =self;
    
    [self presentViewController:secondVc animated:YES completion:nil];
    NSLog(@"下一页");
}

-(void)getTextFieldInputText:(NSString *)text{
    self.mangoView.nameLabel.text = text;
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
