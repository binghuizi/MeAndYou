//
//  MangoTableViewCell.m
//  UILession11UITableViewCell
//
//  Created by scjy on 15/12/2.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//
#define kWideth  [UIScreen mainScreen].bounds.size.width
#import "MangoTableViewCell.h"
//创建是有属性
@interface MangoTableViewCell ()
@property(nonatomic,retain) UIImageView *carImageView;//车标图片
@property(nonatomic,retain) UILabel *carNameLabel;//车名
@property(nonatomic,retain) UILabel *carIntroduceLabel;//介绍

@end
@implementation MangoTableViewCell
//重写cell的初始化方法
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configView];
    }
    return self;
}
-(void)dealloc{
    [_carImageView release];
    [_carNameLabel release];
    [_carIntroduceLabel release];
    [super dealloc];
}
-(void)configView{
   
   // self.contentView.backgroundColor = [UIColor lightGrayColor];
    self.carImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWideth / 4, kWideth / 4)];
    
    
   //宽度是屏幕宽度的3/4 高度是cell高度【屏幕宽度的1/4】de1/4
    self.carNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 4, 5, kWideth * 0.75, kWideth / 4 / 4)];
   // self.carNameLabel.backgroundColor = [UIColor yellowColor];
    
    self.carIntroduceLabel = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 4, kWideth / 4 / 4 + 10, kWideth * 0.75, kWideth / 4 * 0.75)];
    self.carIntroduceLabel.font = [UIFont systemFontOfSize:15];
    self.carIntroduceLabel.numberOfLines = 0;
    [self.contentView addSubview:self.carNameLabel];
    [self.contentView addSubview:self.carImageView];
    [self.contentView addSubview:self.carIntroduceLabel];
    [self.carIntroduceLabel release];
    [self.carImageView release];
    [self.carNameLabel release];
}


//重写model
- (void)setModel:(MangoModel *)model{
    self.carNameLabel.text = model.carName;
    //介绍文字
    self.carIntroduceLabel.text = model.carIntruduce;
    self.carImageView.image = [UIImage imageNamed:model.carImage];
    //在拿到文字介绍之后计算文字高度
    CGFloat height = [[self class]getTextHeightWithText:model.carIntruduce];
    CGRect fram = self.carIntroduceLabel.frame;
    fram.size.height = height;
    self.carIntroduceLabel.frame = fram;
    
}
//根据文本内容 获取文本高度
+ (CGFloat) getTextHeightWithText:(NSString *)carIntroduce{
    //核心方法 boundingRectWithSize 当获取指定文字高度需要CGSize类型参数 让文字在这个限定的宽度和高宽区域内显示，通常宽度和你要显示的label的宽度一致，高度尽可能设置高一点
    //options样式
   //attributes 文字显示的属性设置文字相关的属性 当设置文字大小 要和label显示文本设置的大小保持一致
    //  context文本绘制上下文 一般不需要设置 一班写nil
    CGRect textRect = [carIntroduce boundingRectWithSize:CGSizeMake(kWideth * 0.75, 900) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    return textRect.size.height;
}
//获取整个cell的高度
+ (CGFloat)getCellHeightWithMangoModel:(MangoModel *)mangoModel{
    CGFloat textHeight = [[self class]getTextHeightWithText:mangoModel.carIntruduce]; ;
    return textHeight + kWideth / 4 / 4 + 15;
    
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
