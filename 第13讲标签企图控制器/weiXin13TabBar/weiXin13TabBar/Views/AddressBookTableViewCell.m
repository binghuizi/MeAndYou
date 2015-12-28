//
//  AddressBookTableViewCell.m
//  AddressBook12
//
//  Created by scjy on 15/12/3.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//
#define kWideth  [UIScreen mainScreen].bounds.size.width
#import "AddressBookTableViewCell.h"
@interface AddressBookTableViewCell ()
@property(nonatomic,retain) UIImageView *addressImageView;
@property(nonatomic,retain) UILabel *nameLabel;
@property(nonatomic,retain) UILabel *phoneLabel;
@end

@implementation AddressBookTableViewCell
//重写init方法
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self loadingCustomView];
    }
    return self;
}
-(void)dealloc{
    [_addressImageView release], _addressImageView = nil;
    [_nameLabel        release], _nameLabel        = nil;
    [_phoneLabel       release], _phoneLabel       = nil;
    [super dealloc];
}

- (void)loadingCustomView{
    //懒加载
    [self.contentView addSubview:self.addressImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.phoneLabel];
    [self.addressImageView release];
    [self.nameLabel release];
    [self.phoneLabel release];
}
//图片
-(UIImageView *)addressImageView{
    if (_addressImageView == nil) {
        self.addressImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, kWideth / 5, kWideth / 5)];
//        self.addressImageView.layer.cornerRadius = self.addressImageView.frame.size.width / 2;
//        self.addressImageView.clipsToBounds = YES;
       
    }
    return _addressImageView;
}
//姓名
-(UILabel *)nameLabel{
    if (_nameLabel == nil) {
        self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 0,kWideth - 60, 44)];
    }
    return _nameLabel;
}
//手机号
-(UILabel *)phoneLabel{
    if (_phoneLabel == nil) {
        self.phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(100, 44, kWideth - 60, 44)];
       // self.phoneLabel.backgroundColor = [UIColor grayColor];
    }
    return _phoneLabel;
}
//重写model   get方法
-(void)setModel:(AddressBookModel *)model{
    
    self.addressImageView.image = [UIImage imageNamed:model.imageModel];
    self.nameLabel.text         = model.nameModel;
   // self.phoneLabel.text        = model.phoneModel;
    NSLog(@"%@",self.model.imageModel);
    
    
}

//文本高度
+(CGFloat)getCellWithHeight:(AddressBookModel *)addressModel{
    CGFloat cellHeight = kWideth / 4;
    return cellHeight;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
