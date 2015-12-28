//
//  Tang2TableViewCell.m
//  TangShi11
//
//  Created by scjy on 15/12/5.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//
#define kWideth  [UIScreen mainScreen].bounds.size.width
#import "Tang2TableViewCell.h"
@interface Tang2TableViewCell ()
@property(nonatomic,retain) UILabel *nameLame;
@end
@implementation Tang2TableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self confiView];
    }
    return self;
}
-(void)dealloc{
    [_nameLame release],_nameLame = nil;
    [super dealloc];
}

- (void)confiView{
    self.nameLame = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 5, 0, kWideth, 44)];
    
    
    [self.contentView addSubview:self.nameLame];
    [self.nameLame release];
}
-(void)setModel:(TangModel *)model{
    self.nameLame.text = model.twoNameModel;
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
