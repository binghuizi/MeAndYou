//
//  girlTableViewCell.m
//  LianXi10UItableView
//
//  Created by scjy on 15/12/2.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "girlTableViewCell.h"

@implementation girlTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = [UIColor colorWithRed:1.0 green:0.7 blue:0.8 alpha:1.0];
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
