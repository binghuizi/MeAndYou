//
//  MangoView.m
//  LianXi7UIScrollView
//
//  Created by scjy on 15/11/26.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//
#define kWidth   self.frame.size.width
#define kHeight  self.frame.size.height
#import "MangoView.h"
@interface MangoView ()
@property(nonatomic, retain) UIScrollView *scrollView;
@property(nonatomic,retain) UIPageControl *pageControl;
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
-(void)dealloc{
    [_scrollView release];
    [super dealloc];
}

- (void)loadingCustomView{
    self.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.frame];
    self.scrollView.contentSize = CGSizeMake(kWidth * 7, kHeight);
    //整屏显示
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    [self addSubview:self.scrollView];
    
//for循环 显示6张图片
    for (int i = 0; i < 6; i++) {
        UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(kWidth * i, 0, kWidth,kHeight )];
        [self.scrollView addSubview:scroll];//将新的scoll添加到ScrollView
   //设置缩小 扩大 倍数
        scroll.minimumZoomScale = 0.2;
        scroll.maximumZoomScale = 2.0;
        scroll.delegate = self;//设置代理
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWidth,kHeight )];//每张图片都添加到一个scroll（ScrollView）
        imageView.tag = 1;//设置tag值
    NSString *imageName = [NSString stringWithFormat:@"%d.jpg",i + 1];
    imageView.image = [UIImage imageNamed:imageName];
    
        [scroll addSubview:imageView];//将图片添加到新的scoll上
        [imageView release];
    }
    [self.scrollView release];
//pageControl
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, kHeight - 90, kWidth, 30)];
    self.pageControl.numberOfPages = 7;//设置小圆点个数
    //未显示的圆点颜色黑色
    self.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor blueColor];//显示的当前 为蓝色
   //给圆点添加方法
    [self.pageControl addTarget:self action:@selector(pageSelectAction:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:self.pageControl];
    
    
    
   
}
#pragma markt ------------多张图片 每张都可以缩小 放大代理方法
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
  //  UIImageView *imageView = [(UIImageView *)[scrollView viewWithTag:1]];
    return [scrollView viewWithTag:1];//返回一个视图
}
//这两种方法都需要 代理
#pragma  mark -------- 添加UIPageControl 视图随着圆点移动而移动
- (void)pageSelectAction:(UIPageControl *)pageControl{
    //获取当前圆点 在第几页
    NSInteger pageNUmber = pageControl.currentPage;
    //获取页面的宽度
    CGFloat pageWidth = self.scrollView.frame.size.width;
    //页面的偏移量 页面跟随圆点移动  圆点位置 乘以 视图的宽度  就是移动的距离
    self.scrollView.contentOffset = CGPointMake(pageNUmber * pageWidth, 0);
}
#pragma mark ------ 圆点随着视图的移动 而移动 视图动 圆点也动
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //获取页面的宽度
    CGFloat pageWidth = self.scrollView.frame.size.width;
    //获取偏移量
    CGPoint offSet = self.scrollView.contentOffset;
    //圆点的位置  偏移量除以页面宽度 就是圆点的数目；
    self.pageControl.currentPage = offSet.x/pageWidth;
}


@end
