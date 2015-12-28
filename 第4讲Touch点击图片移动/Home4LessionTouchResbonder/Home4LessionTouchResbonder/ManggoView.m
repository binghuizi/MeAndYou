//
//  ManggoView.m
//  Home4LessionTouchResbonder
//
//  Created by scjy on 15/11/23.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//
#define  kWeight    self.frame.size.width
 #define  kHeight  self.frame.size.height
#import "ManggoView.h"

@implementation ManggoView
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
    UIView *aView = [[UIView alloc] initWithFrame:self.frame];
    aView.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    [self addSubview:aView];
    [aView release];
    
    
    UIView *viewB= [[UIView alloc]initWithFrame:CGRectMake(30, 30, kWeight - 60, kHeight - 450)];
    viewB.backgroundColor = [UIColor blueColor];
    //响应者链 viewB父视图 NO是阻断响应  父视图阻断 子视图不能响应
    viewB.userInteractionEnabled = YES;
   //button 便利构造器不需要释放buttonWithType
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(30, 30, 80, 80);
    btn2.backgroundColor = [UIColor blackColor];
    [viewB addSubview:btn2];
    [btn2 setTitle:@"Touch" forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(touch) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIView *viewC = [[UIView alloc]initWithFrame:CGRectMake(30, 300, kWeight - 60, kHeight - 400)];
    viewC.backgroundColor = [UIColor orangeColor];
    
    
    
    UIView *viewD = [[UIView alloc]initWithFrame:CGRectMake(30, 30, 290, 130)];
    viewD.backgroundColor = [UIColor blackColor];
    
    UIView *viewE = [[UIView alloc]initWithFrame:CGRectMake(30, 150, 290, 80)];
    viewE.backgroundColor = [UIColor whiteColor];
    
    UIView *viewF = [[UIView alloc]initWithFrame:CGRectMake(30, 30, 230, 70)];
    viewF.backgroundColor = [UIColor grayColor];
    [viewC addSubview:viewF];
    [viewC addSubview:viewE];
    [self addSubview:viewD];
    [self addSubview:viewB];
    [self addSubview:viewC];
    [viewB release];
    [viewC release];
    [viewD release];
    [viewE release];
    [viewF release];
    
    
//    UIView *aView = [[UIView alloc] initWithFrame:self.frame];
//    aView.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
//    [self addSubview:aView];
//    [aView release];
//    
//    UIView *bView = [[UIView alloc] initWithFrame:CGRectMake(30, 30, kWeight - 60, kHeight - 450)];
//    bView.backgroundColor = [UIColor grayColor];
//    [self addSubview:bView];
//    [bView release];
//    
//    
//    UIView *cView = [[UIView alloc] initWithFrame:CGRectMake(30, 350, kWeight - 60, kHeight - 400)];
//    cView.backgroundColor = [UIColor orangeColor];
//    [self addSubview:cView];
//    [cView release];
//    
//    
//    UIView *dView = [[UIView alloc] initWithFrame:CGRectMake(30, 30, 290, 130)];
//    dView.backgroundColor = [UIColor whiteColor];
//    [cView addSubview:dView];
//    [dView release];
//    
//    UIView *eView = [[UIView alloc] initWithFrame:CGRectMake(30, 180, 290, 130)];
//    eView.backgroundColor = [UIColor magentaColor];
//    eView.userInteractionEnabled = NO;
//    [cView addSubview:eView];
//    [eView release];
//    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(30, 30, 230, 70);
    btn.backgroundColor = [UIColor magentaColor];
//响应者链查询过程  屏幕（硬件）UIApplication  UIWindow MainViewController self.view (ManggoView) a  c  e  button
    //当响应者链关闭时 其子视图的用户交互不可用
    
    btn.userInteractionEnabled = YES;
    [btn setTitle:@"Touch" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(touch) forControlEvents:UIControlEventTouchUpInside];
    [viewE addSubview:btn];
}
- (void)touch{
    NSLog(@"sada");
}

@end
