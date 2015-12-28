//
//  MangoTableViewCell.m
//  LianXi11MakeCell
//
//  Created by scjy on 15/12/2.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//
#define kWideth  [UIScreen mainScreen].bounds.size.width
#import "MangoTableViewCell.h"
@interface MangoTableViewCell ()
@property(nonatomic,retain) UIImageView *carImageView;
@property(nonatomic,retain) UILabel *carNameLabel;
@property(nonatomic,retain) UILabel *carIntroduceLabel;
@end
@implementation MangoTableViewCell
//重写cell的初始化方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configView];
    }
    return self;
}
- (void)dealloc{
    [_carImageView release];
    [_carNameLabel release];
    [_carIntroduceLabel release];
    [super dealloc];
}
- (void)configView{
    self.carImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWideth / 4, kWideth / 4)];
    self.carNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 4, 5, kWideth * 0.75, kWideth / 4 / 4)];
    self.carIntroduceLabel = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 4, kWideth / 4 / 4 + 10, kWideth * 0.75, kWideth / 4 * 0.75)];
    self.carIntroduceLabel.font = [UIFont systemFontOfSize:15];
    self.carIntroduceLabel.numberOfLines = 0;
    
    [self.contentView addSubview:self.carImageView];
    [self.contentView addSubview:self.carNameLabel];
    [self.contentView addSubview:self.carIntroduceLabel];
    [self.carImageView release];
    [self.carNameLabel release];
    [self.carIntroduceLabel release];
    
}
//重写model方法
-(void)setModel:(MangoModel *)model{
    self.carImageView.image = [UIImage imageNamed:model.carImage];
    self.carNameLabel.text = model.carName;
    self.carIntroduceLabel.text = model.carIntruduce;
//重新设置label高度
    CGFloat height = [[self class]getTextHeightWithText:model.carIntruduce];
    CGRect fram = self.carIntroduceLabel.frame;
    fram.size.height = height;
    self.carIntroduceLabel.frame = fram;
    
}
//获取文本高度
+(CGFloat)getTextHeightWithText:(NSString *)carIntroduce{
    CGRect textRect = [carIntroduce boundingRectWithSize:CGSizeMake(kWideth * 0.75, 900) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    return textRect.size.height;
}
//获取cell整个高度  文本高度 + name高度
+(CGFloat)getCellHeightWithMangoModel:(MangoModel *)mangoModel{
    CGFloat textHeight = [[self class]getTextHeightWithText:mangoModel.carIntruduce];
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
