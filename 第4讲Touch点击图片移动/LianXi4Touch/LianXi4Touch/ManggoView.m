//
//  ManggoView.m
//  LianXi4Touch
//
//  Created by scjy on 15/11/23.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "ManggoView.h"
@interface ManggoView () <UIScrollViewDelegate>{
    UIScrollView  *scrollView;
    UIImageView *imageView;
}
@end
@implementation ManggoView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //[self viewDidLoad];
        [self panAction1];
        
    }
    return self;
}
//添加   设置UIScrollView 的位置与屏幕大小相同
-(void)panAction1{
    self.backgroundColor = [UIColor whiteColor];
    scrollView = [[UIScrollView alloc]initWithFrame:self.bounds];
    [self addSubview:scrollView];
//添加图片方法
    //一般方法
    UIImageView *imageView1 = [[UIImageView alloc]init];
    UIImage *image = [UIImage imageNamed:@"3.jpg"];
    imageView1.image =image;
    imageView1.frame = CGRectMake(0, 0, image.size.width, image.size.height);
//使用构造方法
//    UIImage *image = [UIImage imageNamed:@"3.jpg"];
//    imageView = [[UIImageView alloc]initWithImage:image];//调用initWithImage 宽高和图片一样高
    [scrollView addSubview:imageView1];
    
    scrollView.contentSize = image.size;//设置UIScrollView滚动范围和图片的真实尺寸一致
    
    //设置实现缩放
    //设置代理scrollView的代理对象
    scrollView.delegate = self;
    //设置伸缩比例
    scrollView.maximumZoomScale = 2.0;
    scrollView.minimumZoomScale = 0.5;
    
}
//告诉scrollView要缩放的是哪个子控件
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return imageView;
}

//pan拖动手势
//-(void)panAction{
//    self.backgroundColor = [UIColor whiteColor];
//    UIImageView *snakeImageView = [[UIImageView alloc]init];
//    UIImage *image = [UIImage imageNamed:@"3.jpg"];
//    snakeImageView.image = image;
//    snakeImageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
//    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePan:)];
//    
//    [snakeImageView addGestureRecognizer:panGestureRecognizer];
//    
//    [self addSubview:snakeImageView];
//
//}
//
//-(void)handlePan:(UIPanGestureRecognizer *)recognizer{
//    CGPoint translation = [recognizer translationInView:self];
//    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x, recognizer.view.center.y + translation.y);
//    [recognizer setTranslation:CGPointZero inView:self];
//    
//}

@end
