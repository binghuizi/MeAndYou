//
//  TangTableViewCell.m
//  TangShi11
//
//  Created by scjy on 15/12/5.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//
#define kWideth  [UIScreen mainScreen].bounds.size.width
#import "TangTableViewCell.h"
@interface TangTableViewCell ()
@property(nonatomic,retain) UILabel *titleLabel;
@end
@implementation TangTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configView];
    }
    return self;
}
-(void)dealloc{
    [_titleLabel release],_titleLabel = nil;
    [super dealloc];
}
- (void)configView{
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(kWideth / 4, 0, kWideth, 44)];

    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel release];
}

-(void)setModel:(TangModel *)model{
    self.titleLabel.text = model.oneTitleModel;
    
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
