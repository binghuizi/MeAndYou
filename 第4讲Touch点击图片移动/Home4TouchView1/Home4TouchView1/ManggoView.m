//
//  ManggoView.m
//  Home4TouchView1
//
//  Created by scjy on 15/11/23.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//
#define  kWidth    self.frame.size.width
#define  kHeight  self.frame.size.height
#define x1 50
#define y1 400
#define width 100
#define height 100

#import "ManggoView.h"
@interface ManggoView (){
    NSInteger x ;
    NSInteger y;
    
}
@end
@implementation ManggoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self logainView];
    }
    return self;
}
/*
 自定义view，实现点击事件。
 不同的实例，点击效果不同：点击视图改变颜色、点击视图改变位置，点击视图修改大小
 */
-(void)logainView{
    self.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    self.view1 = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 100, 100)];
    self.view1.backgroundColor = [UIColor whiteColor];
    
    self.view2 = [[UIView alloc]initWithFrame:CGRectMake(50, 250, 100, 100)];
    self.view2.backgroundColor = [UIColor purpleColor];
    
    self.view3 = [[UIView alloc]initWithFrame:CGRectMake(x1, y1, width, height)];
    self.view3.backgroundColor = [UIColor magentaColor];
    
    
    [self addSubview:self.view3];
    [self addSubview:self.view2];
    [self addSubview:self.view1];
    [self.view1 release];
    [self.view2 release];
    [self.view3 release];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //点击改变view1颜色
    self.view1.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0f green:arc4random()%256/255.0f blue:arc4random()%256/255.0f alpha:1.0];
    //点击改变view2位置
    UITouch *oneTouch = [touches anyObject];
    self.point = [oneTouch locationInView:self.view2];
    //改变view3的大小
    self.point3 = [oneTouch locationInView:self.view3];
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
   //点击改变view2位置
    UITouch *twoTouch = [touches anyObject];
    CGPoint moveTouch = [twoTouch locationInView:self.view2];
    CGFloat  offSetX = moveTouch.x - self.point.x;
    CGFloat offSetY = moveTouch.y - self.point.y;
    
    self.view2.center = CGPointMake(self.view2.center.x + offSetX, self.view2.center.y + offSetY);
    
    //改变view3的大小
    UITouch *twoTouch3 = [touches anyObject];
    CGPoint moveTouch3 = [twoTouch3 locationInView:self.view3];
    CGFloat  offSetX3 = moveTouch3.x - self.point3.x;
    CGFloat offSetY3 = moveTouch3.y - self.point3.y;
    self.view3.frame = CGRectMake(x1 , y1, width + offSetX3, height + offSetY3);
}

@end
