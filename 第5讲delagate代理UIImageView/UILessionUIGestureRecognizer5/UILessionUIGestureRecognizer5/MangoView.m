//
//  MangoView.m
//  UILessionUIGestureRecognizer5
//
//  Created by scjy on 15/11/25.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "MangoView.h"
@interface MangoView ()
@property(nonatomic,retain) UIImageView *rotationImageView;

@end
@implementation MangoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadingCustomView];
    }
    return self;
}
- (void)loadingCustomView{
    self.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    //1.轻拍手势 初始化创建轻拍手势 设置 Target
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
//    //点击次数
//    tap.numberOfTapsRequired = 2;
//    //手指个数
//    tap.numberOfTouchesRequired = 2;
    //轻拍手势添加到视图上
    //[self addGestureRecognizer:tap];
    //[tap release];
    
//2.长按手势
//    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressAction:)];
//    
//    //长按时间
//    longPress.minimumPressDuration = 3.0;
//    //手指个数
//    longPress.numberOfTouchesRequired = 1;
//    
//    [self addGestureRecognizer:longPress];
//    [longPress release];
    
 //3.旋转手势
    //添加图片
    self.rotationImageView = [[UIImageView alloc]initWithFrame:self.frame];
    self.rotationImageView.image = [UIImage imageNamed:@"1.jpg"];
//    self.rotationImageView.contentMode = UIViewContentModeScaleAspectFill;
//4.创建旋转手势
//    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotationAction:)];
//    //将手势添加到图片上
//    [self.rotationImageView addGestureRecognizer:rotation];

    //4.捏合手势
//    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchAction:)];
//    
//    [self.rotationImageView addGestureRecognizer:pinch];
//    [pinch release];
 //平移手势
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
//    [self.rotationImageView addGestureRecognizer:pan];
//    [pan release];
//清扫手势  只能设置水平 垂直
//    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)];
//    
//    //设置垂直方向
//    swipe.direction = UISwipeGestureRecognizerDirectionDown |  UISwipeGestureRecognizerDirectionUp ;
//    //设置水平方向
//    UISwipeGestureRecognizer *swipe1 = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction1:)];
//   swipe1.direction = UISwipeGestureRecognizerDirectionLeft |  UISwipeGestureRecognizerDirectionRight ;
//    
//    //添加视图上
//    [self.rotationImageView addGestureRecognizer:swipe];
//    [self.rotationImageView addGestureRecognizer:swipe1];
//    [swipe release];
//    [swipe1 release];
//屏幕边缘清扫
    UIScreenEdgePanGestureRecognizer *screenEdgePan = [[UIScreenEdgePanGestureRecognizer alloc]initWithTarget:self action:@selector(screenEdgePanAction:)];
    //设置方向   只能设置一个方向
    screenEdgePan.edges =UIRectEdgeRight ;
    [self.rotationImageView addGestureRecognizer:screenEdgePan];
    [screenEdgePan release];
    
    //打开imageVi的用户交互
    self.rotationImageView.userInteractionEnabled = YES;
    [self addSubview:self.rotationImageView];
    [self.rotationImageView release];
    
}
//轻拍手势添方法
-(void)tapAction{
    NSLog(@"一根手指点击一次");
}
//长按手势方法
- (void)longPressAction:(UILongPressGestureRecognizer *)longPress{
 //长按手势默认执行两次 长按开始  手指离开的时候  都会触发一次 state(状况)
    if (longPress.state == UIGestureRecognizerStateBegan) {
        NSLog(@"长按手势");
    }else if (longPress.state == UIGestureRecognizerStateEnded){
        NSLog(@"手指离开屏幕");
    }
}
//旋转手势方法
- (void)rotationAction:(UIRotationGestureRecognizer *)routation{
    //transform形变  self.rotationImageView.transform第一个参数是视图原来的形变状态  第二个旋转手势的弧度
    self.rotationImageView.transform = CGAffineTransformRotate(self.rotationImageView.transform, routation.rotation);
   // NSLog(@"%f",routation.rotation);
    //重置旋转角度为0(假如旋转到45du下一个旋转点 46度)   不重置每次旋转的角度都是基于上一次旋转角进行旋转（不重置0下次形变从45度 旋转到46度 一下就跑到91度 跨度范围大 导致图片旋转比较快）
    routation.rotation = 0;
    NSLog(@"%f",routation.rotation);
}
//捏合手势方法
- (void)pinchAction:(UIPinchGestureRecognizer *)pinch{
    //捏合手势有一个属性scale 就是捏合比例
    self.rotationImageView.transform = CGAffineTransformScale(self.rotationImageView.transform, pinch.scale, pinch.scale);
    NSLog(@"%f",pinch.scale);
    //每次放大 等候室基于1.0  重置
    pinch.scale = 1.0;
}
//平移方法；
- (void)panAction:(UIPanGestureRecognizer *)pan{
    CGPoint offSet = [pan translationInView:self.rotationImageView];
    self.rotationImageView.transform = CGAffineTransformTranslate(self.rotationImageView.transform, offSet.x, offSet.y);
//重置方法 CGPointZero重置0 相对于0点平移
    [pan setTranslation:CGPointZero inView:self.rotationImageView];

}
//清扫方法
- (void)swipeAction:(UISwipeGestureRecognizer *)swipe{
    NSLog(@"垂直方向清扫");
}
- (void)swipeAction1:(UISwipeGestureRecognizer *)swipe{
    NSLog(@"水平方向清扫");
}
//屏幕边缘清扫
- (void) screenEdgePanAction:(UIScreenEdgePanGestureRecognizer *)screenEdgePan{
    NSLog(@"屏幕边缘清扫");
    
}
@end
