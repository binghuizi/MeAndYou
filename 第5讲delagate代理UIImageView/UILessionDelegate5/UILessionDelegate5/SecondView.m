//
//  SecondView.m
//  UILessionDelegate5
//
//  Created by scjy on 15/11/25.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//
#define kWidth self.frame.size.width
#define kHeight  self.frame.size.height
#import "SecondView.h"

@implementation SecondView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadingCustemView];
    }
    return self;
}
@synthesize button = _button;
@synthesize textfield = _textfield;
-(void)dealloc{
    [_button release];
    [_textfield release];
    [super dealloc];
}
- (void)loadingCustemView{
    self.textfield = [[UITextField alloc]initWithFrame:CGRectMake(30,120 , kWidth - 60, 44)];
    
    self.textfield.backgroundColor = [UIColor grayColor];
    self.textfield.textColor = [UIColor whiteColor];
    
    self.button = [[UIButton alloc]initWithFrame:CGRectMake(50, 200, kWidth - 100, 44)];
    self.button.backgroundColor = [UIColor magentaColor];
    [self.button setTitle:@"返回" forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    
    
    [self addSubview:self.button];
    [self addSubview:self.textfield];
    [self.textfield release];
    
    
}





@end
