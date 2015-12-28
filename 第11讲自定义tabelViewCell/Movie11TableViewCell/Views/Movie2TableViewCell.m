//
//  Movie2TableViewCell.m
//  Movie11TableViewCell
//
//  Created by scjy on 15/12/4.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//
#define kWideth  [UIScreen mainScreen].bounds.size.width
#import "Movie2TableViewCell.h"
@interface Movie2TableViewCell ()
@property(nonatomic,retain) UIImageView *movieImageView;
@property(nonatomic,retain) UILabel *movieNameLabel;
@property(nonatomic,retain) UILabel *movieIntroduceLabel;
@property(nonatomic,retain) UILabel *movieTimeLabel;
@property(nonatomic,retain) UILabel *movieLookNumLabel;
@property(nonatomic,retain) UIButton *movieButtonButton;
@end
@implementation Movie2TableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configView];
    }
    return self;
}
-(void)dealloc{
    [_movieImageView release];
    [_movieNameLabel release];
    [_movieIntroduceLabel release];
    [_movieTimeLabel release];
    [_movieLookNumLabel release];
    [_movieButtonButton release];
    [super dealloc];
}
- (void)configView{
//图片  名字 介绍  状态 各个位置
    self.movieImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWideth / 4, kWideth / 3)];
    self.movieNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 4 + 5, 5, kWideth * 0.75, kWideth / 4 / 4)];
    self.movieIntroduceLabel = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 4 + 5, kWideth / 6  , kWideth * 0.75, kWideth / 4 * 0.75)];
    self.movieTimeLabel = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 4 + 5, kWideth / 4 / 4 + 30,kWideth / 1, kWideth / 4 )];
    self.movieLookNumLabel = [[UILabel alloc]initWithFrame:CGRectMake(kWideth - 55, 10, kWideth * 0.75, kWideth / 4 / 4)];
    self.movieButtonButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.movieButtonButton.frame = CGRectMake(kWideth - 80, kWideth / 4 - 10 , 70, kWideth / 16 + 20);
//字体大小
    self.movieNameLabel.font        = [UIFont systemFontOfSize:25];
    self.movieIntroduceLabel.font   = [UIFont systemFontOfSize:16];
    self.movieTimeLabel.font        = [UIFont systemFontOfSize:16];
//字体颜色
    self.movieNameLabel.shadowColor    = [UIColor purpleColor];
    self.movieIntroduceLabel.textColor = [UIColor lightGrayColor];
    self.movieTimeLabel.textColor      = [UIColor lightGrayColor];
    self.movieLookNumLabel.textColor   = [UIColor colorWithRed:226/255.0f green:137/255.0f blue:60/255.0f alpha:1.0];
    [self.movieButtonButton setTitleColor:[UIColor colorWithRed:206/255.0f green:126/255.0f blue:113/255.0f alpha:1.0] forState:UIControlStateNormal];
//按钮buttton样式 圆角样式
    [self.movieButtonButton.layer setMasksToBounds:YES];//圆角半径不会被遮挡
    [self.movieButtonButton.layer setCornerRadius:8];
    [self.movieButtonButton.layer setBorderWidth:2];
//设置按钮的边界颜色
    CGColorSpaceRef colorSpaceRef = CGColorSpaceCreateDeviceRGB();
    CGColorRef color              = CGColorCreate(colorSpaceRef, (CGFloat[]){0.8,0.5,0.5,1});
    [self.movieButtonButton.layer setBorderColor:color];
    
    self.movieIntroduceLabel.numberOfLines = 0;
    
    [self.contentView addSubview:self.movieImageView];
    [self.contentView addSubview:self.movieNameLabel];
    [self.contentView addSubview:self.movieIntroduceLabel];
    [self.contentView addSubview:self.movieTimeLabel];
    [self.contentView addSubview:self.movieLookNumLabel];
    [self.contentView addSubview:self.movieButtonButton];
    
    [self.movieImageView release];
    [self.movieNameLabel release];
    [self.movieIntroduceLabel release];
    [self.movieTimeLabel release];
    [self.movieLookNumLabel release];
    [self.movieButtonButton release];
}
//重写model
-(void)setModel:(MovieModel *)model{
//接收 model传过来的数据
    self.movieNameLabel.text      = model.movieName;
    self.movieIntroduceLabel.text = model.movieIntroduce;
    self.movieTimeLabel.text      = model.movieTime;
    self.movieLookNumLabel.text   = model.movieLookNum;
    self.movieImageView.image     = [UIImage imageNamed:model.movieImage];
    [self.movieButtonButton setTitle:model.movieButtonTitton forState:UIControlStateNormal];
//重新设置高度
    CGFloat height = [[self class]getTextHeightWithText:model.movieIntroduce];
    CGRect fram = self.movieIntroduceLabel.frame;
    fram.size.height = height;
    self.movieIntroduceLabel.frame = fram;
}
//文本高度
+(CGFloat)getTextHeightWithText:(NSString *)movieIntroduce{
    CGRect textRect = [movieIntroduce boundingRectWithSize:CGSizeMake(kWideth * 0.75, 400) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    return textRect.size.height;
}

//cell总高度
+(CGFloat)getCellHeightWithMovieModel:(MovieModel *)movieModel{
    CGFloat textHeight = [[self class] getTextHeightWithText:movieModel.movieIntroduce];
    return textHeight + kWideth / 4 / 4 + kWideth / 4 ;
}
- (void)awakeFromNib {
    // Initialization code
    
    
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
