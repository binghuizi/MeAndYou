//
//  MangoView.m
//  UILessionDelegate5
//
//  Created by scjy on 15/11/24.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//
#define kwidth  self.frame.size.width
#define kHeight   self.frame.size.height
#import "MangoView.h"

@implementation MangoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadingCusteView];
    }
    return self;
}
-(void)loadingCusteView{
    self.nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(30,120,kwidth - 60, 44)];
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    self.nameLabel.font = [UIFont systemFontOfSize:20];
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.text = @"用户名";
    
    self.btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btn.frame = CGRectMake(50, 200, kwidth - 100, 50);
   self.btn.backgroundColor = [UIColor purpleColor];
    [self.btn setTitle:@"下一页" forState:UIControlStateNormal];
    [self.btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addSubview:self.nameLabel];
    [self addSubview:self.btn];
    [self.nameLabel release];
    
    
    
    
}
@end
