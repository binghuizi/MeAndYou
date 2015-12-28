//
//  NewView.m
//  UILessionCustemView
//
//  Created by scjy on 15/11/20.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//
#define kWidth   self.frame.size.width
#define kHeight self.frame.size.height
#import "NewView.h"

@implementation NewView
@synthesize label = _label;
@synthesize textField = _textField;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loandingCustomView];
    }
    return self;
}
-(void)dealloc{
    [_label release];
    [_textField release];
    [super dealloc];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)loandingCustomView{
//背景
    self.backgroundColor = [UIColor whiteColor];
//label的位置
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,kWidth *0.25 ,kHeight  )];
//textFieled的位置
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(kWidth/3, 0, kWidth * 0.75, kHeight )];
//label  textField背景颜色
    self.label.backgroundColor = [UIColor brownColor];
    //self.textField.backgroundColor = [UIColor grayColor];
//文本框样式
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
//文本框内容居中
    self.textField.textAlignment = NSTextAlignmentCenter;
//label中的内容居中
    self.label.textAlignment =NSTextAlignmentCenter;
//清除按钮
    self.textField.clearButtonMode = UITextFieldViewModeAlways;
//在内部设置代理  每次创建对象都设置一次
    self.textField.delegate = self;
    
    
    //加视图
    [self addSubview:self.label];
    [self addSubview:self.textField];
//释放
    [self.label release];
    [self.textField release];
    
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.textField resignFirstResponder];
    return YES;
}


@end
