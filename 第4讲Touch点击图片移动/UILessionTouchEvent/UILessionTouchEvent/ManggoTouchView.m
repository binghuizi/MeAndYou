//
//  ManggoTouchView.m
//  UILessionTouchEvent
//
//  Created by scjy on 15/11/23.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "ManggoTouchView.h"

@implementation ManggoTouchView
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

//-(void)loadingCustomView{
//    self.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
//    self.view = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 100, 100)];
//    self.view.backgroundColor = [UIColor blueColor];
//    [self addSubview:self.view];
//    
//}
////触摸事件
////触摸开始 点击屏幕
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
////    NSLog(@"%s",__FUNCTION__);
////从触摸手势里取出任意 一个触摸点(x,y)
//    UITouch *startTouch = [touches anyObject];
////通过触摸点在当前视图上得威海返回当前触摸点的坐标
//    self.point = [startTouch locationInView:self];
//   // NSLog(@"%.2f %.2f",po.x,po.y);
//    NSLog(@"%@",NSStringFromCGPoint(self.point));
//   // NSLog(@"%@",startTouch);
//}
////触摸移动方法 当手指触摸滑动时会调用
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    
//    UITouch *threeTouch = [touches anyObject];
//    CGPoint threePo = [threeTouch locationInView:self];
//    NSLog(@"%@",NSStringFromCGPoint(threePo));
//   // NSLog(@"%s",__FUNCTION__);
//}
////当手指触摸屏幕结束 离开屏幕触发end
//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
////随机颜色arc4random()%256 值的区间（0~255）/255计算出的是（0.0~1.0）
//    self.backgroundColor = [UIColor colorWithRed:arc4random()%256 /255.0f green:arc4random()%256 /255.0f blue:arc4random()%256 /255.0f alpha:1.0];
////    NSLog(@"%s",__FUNCTION__);
////点击结束 返回触摸点的坐标
//    UITouch *twoTouch = [touches anyObject];
//    CGPoint twoPo = [twoTouch locationInView:self];
//    NSLog(@"%@",NSStringFromCGPoint(twoPo));
//    
//}
////取消  触摸终止方法  当来电话或其它系统级别事件打断 当前触摸的时候触发 当拉控制中心时  从上往下 拉 也会触发事件
//-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
//    NSLog(@"%s",__FUNCTION__);
//}
//
//作业一   视图随着鼠标移动 而移动
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
//手指点击时开始移动 touchesMoved
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
//    UITouch *twoTouch = [touches anyObject];
//    CGPoint moveTouch = [twoTouch locationInView:self.view];
//    CGFloat offsetX = moveTouch.x - self.point.x;
//    CGFloat offsetY = moveTouch.y - self.point.y;
//    self.view.center =CGPointMake(self.view.center.x + offsetX, self.view.center.y + offsetY);
//    
//    NSLog(@"%@",NSStringFromCGPoint(moveTouch));
//}
//作业二 清扫   不点击 移动touchesEnded
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *twoTouch = [touches anyObject];
    CGPoint moveTouch = [twoTouch locationInView:self.view];
    CGFloat offsetX = moveTouch.x - self.point.x;
    CGFloat offsetY = moveTouch.y - self.point.y;
    self.view.center =CGPointMake(self.view.center.x + offsetX, self.view.center.y + offsetY);
    
    NSLog(@"%@",NSStringFromCGPoint(moveTouch));
}

@end
