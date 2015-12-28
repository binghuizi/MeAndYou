//
//  MangoView.m
//  UIdesignDelagate
//
//  Created by scjy on 15/11/24.
//  Copyright (c) 2015年 张鹏飞. All rights reserved.
//

#import "MangoView.h"
#define kweight self.frame.size.width

@interface MangoView ()
{
    id _tatger;
    
    SEL _action;
    
    
}
@end


@implementation MangoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self  Customview];
    }
    return self;
}


-(void)Customview{
    
    self.label=[[UILabel alloc]initWithFrame:CGRectMake(20, 120,self.frame.size.width-40, 44)];
    
    self.label.textAlignment=NSTextAlignmentCenter;
    self.label.font=[UIFont systemFontOfSize:24.0];
    self.label.textColor=[UIColor redColor];
    self.label.backgroundColor=[UIColor blueColor];
    self.label.text=@"用户名";
    [self addSubview:self.label];
    [self.label release];
    _btn=[UIButton buttonWithType:UIButtonTypeCustom];
    
    [_btn setBackgroundColor:[UIColor yellowColor]];
    _btn.frame=CGRectMake(50, 50, kweight-100, 44);
    [_btn setTitle:@"换页" forState:UIControlStateNormal];
    [_btn setTintColor:[UIColor blackColor]];
    [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self addSubview:_btn];
    
    
}
@end
