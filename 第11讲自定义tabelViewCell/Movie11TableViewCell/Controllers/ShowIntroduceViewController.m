//
//  ShowIntroduceViewController.m
//  Movie11TableViewCell
//
//  Created by scjy on 15/12/4.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//
#define kWideth  [UIScreen mainScreen].bounds.size.width
#import "ShowIntroduceViewController.h"

@interface ShowIntroduceViewController ()
@property(nonatomic,retain) UIView *viewNew;
@property(nonatomic,retain) UIImageView *imageView;
@property(nonatomic,retain) UILabel *movieNameLable;
@property(nonatomic,retain) UILabel *movieTimeLabel;
@property(nonatomic,retain) UILabel *movieIntroduceLabel;
@property(nonatomic,retain) UILabel *movieLeaderLabel;
@property(nonatomic,retain) UILabel *movieDirectorLabel;
@property(nonatomic,retain) UILabel *movieAreayLabel;
@property(nonatomic,retain) UILabel *movieTypeLabel;
@property(nonatomic,retain) UILabel *playLabel;

@end

@implementation ShowIntroduceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.viewNew = [[UIView alloc]initWithFrame:self.view.frame];
    self.viewNew.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
//图片 名字 各个状态 显示的位置
    self.imageView           = [[UIImageView alloc]initWithFrame:CGRectMake(10, 80, kWideth / 4 + 30, kWideth / 2 )];
    self.movieNameLable      = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 3 + 20, 80, kWideth , 50)];
    self.movieLeaderLabel    = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 3 + 20, 120, kWideth, 40)];
    self.movieDirectorLabel  = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 3 + 20, 150, kWideth, 40)];
    self.movieAreayLabel     = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 3 + 20, 180, kWideth, 40)];
    self.movieTypeLabel      = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 3 + 20, 210, kWideth, 40)];
    self.movieTimeLabel      = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 3 + 20, 230, kWideth, 50)];
    self.movieIntroduceLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, kWideth *0.75 , kWideth - 10, kWideth)];
    self.playLabel           = [[UILabel alloc]initWithFrame:CGRectMake(10, 250, kWideth, 40)];
//字符串 + 传递过来的数据
    NSString *movieName     = [NSString stringWithFormat:@"%@  国语 2015",self.showMovieName ];
    NSString *movieLeader   = [NSString stringWithFormat:@"主演：%@",self.showLeader];
    NSString *movieDirector = [NSString stringWithFormat:@"导演：%@",self.showDirector];
    NSString *movieAreay    = [NSString stringWithFormat:@"地区：%@",self.showAreay];
    NSString *movieType     = [NSString stringWithFormat:@"类型：%@",self.showType];
//给各个label赋值 显示出来
    self.movieNameLable.text      = movieName;
    self.movieLeaderLabel.text    = movieLeader;
    self.movieDirectorLabel.text  = movieDirector;
    self.movieAreayLabel.text     = movieAreay;
    self.movieTypeLabel.text      = movieType;
    self.movieTimeLabel.text      = self.showTime;
    self.movieIntroduceLabel.text = self.showIntroduce;
    self.playLabel.text = @"简介";
//字体大小
    self.movieNameLable.font     = [UIFont systemFontOfSize:20];
    self.movieLeaderLabel.font   = [UIFont systemFontOfSize:15];
    self.movieDirectorLabel.font = [UIFont systemFontOfSize:15];
    self.movieAreayLabel.font    = [UIFont systemFontOfSize:15];
    self.playLabel.font = [UIFont systemFontOfSize:20];
    
    self.imageView.image = [UIImage imageNamed:self.showImageName];
    self.movieNameLable.shadowColor = [UIColor purpleColor];
    self.playLabel.shadowColor = [UIColor purpleColor];
    self.movieIntroduceLabel.numberOfLines = 0;
    
    
    [self.view addSubview:self.viewNew];
    [self.viewNew addSubview:self.imageView];
    [self.viewNew addSubview:self.movieNameLable];
    [self.viewNew addSubview:self.movieLeaderLabel];
    [self.viewNew addSubview:self.movieDirectorLabel];
    [self.viewNew addSubview:self.movieAreayLabel];
    [self.viewNew addSubview:self.movieTypeLabel];
    [self.viewNew addSubview:self.movieTimeLabel];
    [self.viewNew addSubview:self.movieIntroduceLabel];
    [self.viewNew addSubview:self.playLabel];
    
    [self.viewNew release];
    [self.imageView release];
    [self.movieNameLable release];
    [self.movieLeaderLabel release];
    [self.movieDirectorLabel release];
    [self.movieAreayLabel release];
    [self.movieTypeLabel release];
    [self.movieTimeLabel release];
    [self.movieIntroduceLabel release];
    [self.playLabel release];
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
