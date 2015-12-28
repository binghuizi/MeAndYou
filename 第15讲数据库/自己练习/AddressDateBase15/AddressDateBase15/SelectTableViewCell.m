//
//  SelectTableViewCell.m
//  AddressDateBase15
//
//  Created by scjy on 15/12/20.
//  Copyright © 2015年 scjy. All rights reserved.
//
#define kWideth  [UIScreen mainScreen].bounds.size.width
#import "SelectTableViewCell.h"
#import "LinkMan.h"
@interface SelectTableViewCell ()
@property(nonatomic,retain) UILabel *nameLabel;
@property(nonatomic,retain) UILabel *phoneNumberLabel;
@end
@implementation SelectTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadingCustomView];
    }
    return self;
}
-(void)dealloc{
    [_nameLabel release],_nameLabel = nil;
    [_phoneNumberLabel release], _phoneNumberLabel = nil;
    [super dealloc];
}
- (void)loadingCustomView{
    //懒加载
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.phoneNumberLabel];
    [self.nameLabel release];
    [self.phoneNumberLabel release];
}
//姓名加载
-(UILabel *)nameLabel{
    if (_nameLabel == nil) {
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 5, kWideth/4, 30)];
        
        
    }
    return _nameLabel;
}
//手机号
-(UILabel *)phoneNumberLabel{
    if (_phoneNumberLabel == nil) {
        self.phoneNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 5, kWideth - 60, 30)];
        
        
    }
    return _phoneNumberLabel;
}

-(void)setLinkMan:(LinkMan *)linkMan{
    self.nameLabel.text = linkMan.name;
    self.phoneNumberLabel.text = linkMan.phoneNumber;
        
}



- (void)awakeFromNib {
    // Initialization code
  
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
