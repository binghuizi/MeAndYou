//
//  SecondView.m
//  UILessonDelegate
//
//  Created by 张茫原 on 15/11/24.
//  Copyright © 2015年 芒果科技. All rights reserved.
//

#import "SecondView.h"

#define kWidth self.frame.size.width

@implementation SecondView
@synthesize tf = _tf;
@synthesize btn = _btn;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadingCustomView];
    }
    return self;
}

- (void)dealloc{
    [_tf release];
    [_btn release];
    [super dealloc];
}

- (void)loadingCustomView{
    self.tf = [[UITextField alloc] initWithFrame:CGRectMake(30, 120, kWidth - 60, 44)];
    self.tf.backgroundColor = [UIColor blackColor];
    //设置边框样式
    self.tf.borderStyle = UITextBorderStyleRoundedRect;
    //字体颜色
    self.tf.textColor = [UIColor whiteColor];
    [self addSubview:self.tf];
    [self.tf release];
    
    self.btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btn.frame = CGRectMake(50, 200, kWidth - 100, 44);
    //背景颜色
    [self.btn setBackgroundColor:[UIColor redColor]];
    //标题颜色
    [self.btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //按钮标题
    [self.btn setTitle:@"返回" forState:UIControlStateNormal];
    [self addSubview:self.btn];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
