//
//  MainView.m
//  Home7UIPageControUIScrollView
//
//  Created by scjy on 15/11/30.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//
#define  kWidth   self.frame.size.width
#define  kHeight  self.frame.size.height
#import "MainView.h"
@interface MainView ()
@property(nonatomic, retain) UIScrollView *scollView;
@property(nonatomic, retain) UIPageControl *pageControl;

@end
@implementation MainView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self lodingAction];
    }
    return self;
}
-(void)dealloc{
    [_scollView release];
    
    [super dealloc];
}
- (void)lodingAction{
    self.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    self.scollView = [[UIScrollView alloc]initWithFrame:self.frame];
    //可以放7张图片
    self.scollView.contentSize = CGSizeMake(kWidth * 7, kHeight);
    //整屏显示
    self.scollView.pagingEnabled = YES;
    self.scollView.delegate  = self;
    [self addSubview:self.scollView];
    //for循环
    for (int i = 0; i <7; i++) {
        UIScrollView *scoll = [[UIScrollView alloc]initWithFrame:CGRectMake(kWidth * i, 0, kWidth, kHeight)];
        [self.scollView addSubview:scoll];
        //设置扩大 缩小
        scoll.minimumZoomScale = 0.2;
        scoll.maximumZoomScale = 2.0;
        scoll.delegate = self;
        
        UIImageView  *imageView = [[UIImageView alloc]initWithFrame:
               CGRectMake(0, 0, kWidth, kHeight)];
        //设置tag
        imageView.tag = 1;
        NSString *imageName = [NSString stringWithFormat:@"%d.jpg",i + 1];
        imageView.image = [UIImage imageNamed:imageName];
        [scoll addSubview:imageView];
        [imageView release];
    }
    [self.scollView release];
//pageControl
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, kHeight -90, kWidth,30)];
    self.pageControl.numberOfPages = 7;
//未显示圆点的颜色
    self.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
//圆点方法
    [self.pageControl addTarget:self action:@selector(pageSelectAction:) forControlEvents:UIControlEventValueChanged];
    
    
    [self addSubview:self.pageControl];
    
    
    
    
    
    
    
}
//扩大缩小
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return [scrollView  viewWithTag:1];
}
//页面跟随圆点移动
- (void)pageSelectAction:(UIPageControl *)pageControl{
    //获取当前圆点的   在第几页 current当前的
    NSInteger pageNumber = pageControl.currentPage;
    //屏幕宽度
    CGFloat pageWidth = self.scollView.frame.size.width;
    //页面的偏移量  页面跟随圆点移动  移动的距离
    self.scollView.contentOffset = CGPointMake(pageNumber * pageWidth, 0);
    
}
//圆点跟随页面移动
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //获取页面的宽度
    CGFloat pageWidth = self.scollView.frame.size.width;
    //获取偏移量
    CGPoint offSet = self.scollView.contentOffset;
    //当前圆点  圆点位置
    self.pageControl.currentPage = offSet.x/pageWidth;
}


@end
