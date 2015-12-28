//
//  MangoView.m
//  UILessionUIScrollViewPageControl7
//
//  Created by scjy on 15/11/26.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//
#define kWidth self.frame.size.width
#define kheight  self.frame.size.height
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
    [_scrollView  release];
    [_pageControl release];
    [super dealloc];
}
- (void)loadingCustomView{
    /*1.scrollView的frame  能够显示的大小
     2.contentSize是scrollView里内容大小
     3.frame大小决定你看到内容的大小
     
     
     
     */
    self.backgroundColor = [UIColor colorWithRed:177/255.0f green:24/255.0f blue:21/255.0f alpha:47/255.0f];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:self.frame];
    
    self.scrollView.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    //当contentSize大于scrollView的frame是就可以滑动 如果只有宽度大于scrollView的宽度 只有左右滑动  只有高度大于  只能上下滑动
    self.scrollView.contentSize = CGSizeMake(kWidth *8 , kheight);
    
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kheight)];
    imageView1.image = [UIImage imageNamed:@"8.jpg"];
    
    imageView1.tag = 1;
    //设置代理
   self.scrollView.delegate = self;
//    UIImageView *imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(kWidth, 0, kWidth, kheight)];
//    imageView2.image = [UIImage imageNamed:@"3.jpg"];
    
 //  for循环添加图片
    /*1.图片如果想要滚动 需要把图片添加到ScrollView
     2.ScrollView本身自带缩放功能 图片放大缩小需要依赖于ScrollView的放大缩小
     3.把所有图片都添加到ScrollView  ScrollView放大缩小是整个大的ScrollView 而不是每张图片都放大缩小 不满足要求
     4.每一张图片都添加到ScrollView  每张图片都实现了放大缩小    如何让放大缩小的图片来回移动
     5
     加载每张图片的ScrollView添加到一个大的ScrollView  就能实现滑动
     
     */
    for (int i = 0; i < 6; i++) {
        UIScrollView *scro = [[UIScrollView alloc]initWithFrame:CGRectMake(kWidth * i, 0, kWidth,kheight )];
        
        scro.minimumZoomScale = 0.5;
        scro.maximumZoomScale = 2.0;
         scro.delegate = self;
        [self.scrollView addSubview:scro];
        //代理 每一张图片
       UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0 , kWidth, kheight)];
      //获取图片的名字
        NSString *string = [NSString stringWithFormat:@"%d.jpg",i + 1];
        imageView.image = [UIImage imageNamed:string];
        
         imageView.tag = 1;
       
        [scro addSubview:imageView];
       
        //下边的ScrollView添加到的scrollView
        
        
    }
   
    //scrollsToTop滑动到顶部  点击顶部  会回到顶部 上下滑动后效果
    self.scrollView.scrollsToTop = YES;
    //pagingEnabled整屏滑动yes显示整个 默认no
    self.scrollView.pagingEnabled = YES;
//    //bounces遇到边界是否可以滑回 默认yes边界可以滑动   no是边界不可滑动
//    self.scrollView.bounces = NO;
    //是否可以滑动、NO不可滑动  默认yes（可滑动）
    //self.scrollView.scrollEnabled = NO;
    
    //水平方向是否显示滚动条 YES默认显示
    self.scrollView.showsHorizontalScrollIndicator = YES;
    //垂直方向是否显示滚动条NO 不显示
    self.scrollView.showsVerticalScrollIndicator = NO;
//边界弹回alwaysBounceHorizontal 水平方向内容大小等于scrollView的大小仍然可以左右滑动  no不可拖动
    self.scrollView.alwaysBounceHorizontal = YES;
    //alwaysBounceVertical垂直方向 yes 可以拖动  no不可拖动
 //   self.scrollView.alwaysBounceVertical = YES;
    
    //缩小比例 最小缩小比例  两根手指
//    self.scrollView.minimumZoomScale = 0.5;
//    self.scrollView.maximumZoomScale = 2.0;
    
    
//    [self.scrollView addSubview:imageView2];
//    [self.scrollView addSubview:imageView1];
 //   [imageView1 release];
//    [imageView2 release];
    [self addSubview:self.scrollView];
    [self.scrollView release];
    
    //pageControl
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, kWidth - 80, kWidth, 30)];
    self.pageControl.backgroundColor = [UIColor blueColor];
    self.pageControl.numberOfPages = 6;//设置pageControl个数
    //blackColor未选中颜色
    self.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    //当前颜色
    self.pageControl.currentPageIndicatorTintColor =[UIColor whiteColor];
    //给小圆点添加方法
    [self.pageControl addTarget:self action:@selector(pageSelectAction:) forControlEvents:UIControlEventValueChanged];
    
    
    [self addSubview:self.pageControl];
    [self.pageControl release];
    
}
-(void)pageSelectAction:(UIPageControl *)pageControl{
    //第一步获取pageControl点击的页面  在第几页
    NSInteger pageNUmber =  pageControl.currentPage;
    
    //第二步 获取页面的宽度
    CGFloat pageWidth = self.scrollView.frame.size.width;
    //pageControl滚动到第几页  让scrollView页面跟随圆点移动 contentOffset偏移
    self.scrollView.contentOffset = CGPointMake(pageNUmber *pageWidth, 0);
    
}
//书签
#pragma mark --------------   scrollViewDidEndDecelerating
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //1.获取scrollView页面的宽度
    CGFloat pageWidth = self.scrollView.frame.size.width;
    //2.获取偏移量
    CGPoint offSet = self.scrollView.contentOffset;
     //3.通过偏移量 和页面宽度  计算当前页数
    NSInteger pageNUm = offSet.x /pageWidth;
    //4.修改pageControl的
    self.pageControl.currentPage = pageNUm;
}

//缩小 扩大
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    //在scrollView上通过tag值找到imageView
    
    UIImageView *zoomView = (UIImageView *)[scrollView viewWithTag:1];
    return zoomView;
}

//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSLog(@"%s %d",__FUNCTION__,__LINE__);
//    
//}
//-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
//    NSLog(@"%s %d",__FUNCTION__,__LINE__);
//}

@end
