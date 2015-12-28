//
//  TwoViewController.m
//  LianXi10UItableView
//
//  Created by scjy on 15/12/1.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "TwoViewController.h"

@interface TwoViewController ()
@property(nonatomic,retain) UIView *viewNew;
@property(nonatomic,retain) UIImageView *imageView;
@property(nonatomic,retain) UILabel *namebel;
@property(nonatomic,retain) UILabel *numbel;
@property(nonatomic,retain) UILabel *xingming;
@property(nonatomic,retain) UILabel *genderBel;
@property(nonatomic,retain) UILabel *iphonNum;
@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.viewNew = [[UIView alloc]initWithFrame:CGRectMake(0, 10, self.view.frame.size.width, 400)];
    self.viewNew.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 50, 200, 200)];
    self.namebel   = [[UILabel alloc]initWithFrame:CGRectMake(280, 50, 100, 40)];
    self.numbel    = [[UILabel alloc]initWithFrame:CGRectMake(300, 120, 300, 40)];
    self.xingming  = [[UILabel alloc]initWithFrame:CGRectMake(220, 50, 100, 40)];
    self.genderBel  = [[UILabel alloc]initWithFrame:CGRectMake(230, 80, 50, 40)];
    self.iphonNum  = [[UILabel alloc]initWithFrame:CGRectMake(200, 120, 200, 40)];
    self.imageView.image   = [UIImage imageNamed:self.image];
    self.namebel.textColor = [UIColor blueColor];
    self.numbel.textColor  = [UIColor blueColor];
    
    self.namebel.font  = [UIFont systemFontOfSize:20];
    self.numbel.font   = [UIFont systemFontOfSize:20];
    self.xingming.font = [UIFont systemFontOfSize:20];
    self.genderBel.font = [UIFont systemFontOfSize:20];
    self.iphonNum.font = [UIFont systemFontOfSize:20];
    
    
    self.namebel.text  = self.name;
    self.numbel.text   = self.number;
    self.genderBel.text = self.gender;
    self.xingming.text = @"姓名：";
    self.iphonNum.text = @"电话号码：";
    //self.imageView.image = [UIImage imageNamed:man.cell.imageView.image;
    
    NSLog(@"dcdcds");
    [self.view addSubview:self.viewNew];
    [self.viewNew addSubview:self.imageView];
    [self.viewNew addSubview:self.namebel];
    [self.viewNew addSubview:self.numbel];
    [self.viewNew addSubview:self.xingming];
    [self.viewNew addSubview:self.iphonNum];
    [self.viewNew addSubview:self.genderBel];

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
