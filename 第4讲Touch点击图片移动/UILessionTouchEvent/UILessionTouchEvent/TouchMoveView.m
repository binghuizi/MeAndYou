//
//  TouchMoveView.m
//  UILessionTouchEvent
//
//  Created by scjy on 15/11/23.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "TouchMoveView.h"

@implementation TouchMoveView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadingCustomView];
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)loadingCustomView{
    self.backgroundColor = [UIColor purpleColor];
    self.view = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 100, 100)];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.view];
    [self.view release];
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *oneTouch = [touches anyObject];
    self.point = [oneTouch locationInView:self.view];
    NSLog(@"%@",NSStringFromCGPoint(self.point));
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *twoTouch = [touches anyObject];
    CGPoint moveTouch = [twoTouch locationInView:self.view];
    CGFloat offsetX = moveTouch.x - self.point.x;
    CGFloat offsetY = moveTouch.y - self.point.y;
    self.view.center =CGPointMake(self.view.center.x + offsetX, self.view.center.y + offsetY);
    
    NSLog(@"%@",NSStringFromCGPoint(moveTouch));
}

@end
