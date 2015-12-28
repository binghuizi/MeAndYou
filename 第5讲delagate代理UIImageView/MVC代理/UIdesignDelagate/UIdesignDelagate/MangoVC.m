//
//  MangoVC.m
//  UIdesignDelagate
//
//  Created by scjy on 15/11/24.
//  Copyright (c) 2015年 张鹏飞. All rights reserved.
//

#import "MangoVC.h"
#define kweight self.frame.size.width

@implementation MangoVC
@synthesize tf=_tf;
@synthesize btn=_btn;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self CustomView];
    }
    return self;
}


-(void)dealloc{
    [_tf release];
    [_btn release];
    [super dealloc];
    
    
}

-(void)CustomView{
    
    _btn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [_btn setBackgroundColor:[UIColor yellowColor]];
    _btn.frame=CGRectMake(50, 50, kweight-100, 44);
    [_btn setTitle:@"返回" forState:UIControlStateNormal];
    [_btn setTintColor:[UIColor blackColor]];
    [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self addSubview:_btn];
    
    
    _tf=[[UITextField alloc]initWithFrame:CGRectMake(50, 200, kweight-100, 44)];
    _tf.textAlignment=NSTextAlignmentCenter;
    _tf.backgroundColor=[UIColor whiteColor];
    _tf.borderStyle=UITextBorderStyleRoundedRect;
    _tf.textColor=[UIColor blackColor];
    
    [self addSubview:_tf];
    [_tf release];
    
    
    
}



@end
