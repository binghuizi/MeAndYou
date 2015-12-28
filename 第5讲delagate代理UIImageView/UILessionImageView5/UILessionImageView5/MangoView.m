//
//  MangoView.m
//  UILessionImageView5
//
//  Created by scjy on 15/11/25.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//
#define kWidth     self.frame.size.width
#define  kHeight          self.frame.size.height
#import "MangoView.h"

@implementation MangoView
//重写init方法  因为本类初始化的时候如果子类重写init 就会执行子类的init初始化方法 方法
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadingCustomView];
    }
    return self;
}
- (void)loadingCustomView{
//第一种方式添加图片 创建一个UIImage 相当于相片
    //UIImage *image = [UIImage imageNamed:@"3.jpg"];
  
//第二种方式添加图片 Bundle 路径  mainBundle当前应用程序的主路径
    //在当前应用程序的主路径下 pathForResource需找资源的名字位置
    NSString *path = [[NSBundle mainBundle]pathForResource:@"1" ofType:@".jpg"];
//    NSLog(@"\npath = %@",path);//图片的路径
    UIImage *image1 = [[UIImage alloc]initWithContentsOfFile:path];
    
//创建 UIImageView  相当于相框
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image1];
//设置UIImageView大小 image.size.width  原来的大小
//设置图片之后如果不做任何设置默认图片会缩放到和image1的fram一样大小
//    imageView.frame = CGRectMake(0, 0,image1.size.width,image1.size.height);
   // imageView.frame = self.frame;
  
    imageView.frame = CGRectMake(30, 30,kWidth - 30,300);
//1.UIViewContentModeScaleToFill 默认压缩图片 让图片充满ImageView 图片会变形
//    imageView.contentMode = UIViewContentModeScaleToFill;
// 
////2.UIViewContentModeScaleAspectFill 按图片原来的比例填充整个ImageView显示 ，可能有些部分不能现实
//    imageView.contentMode = UIViewContentModeScaleAspectFill;
   
//3.UIViewContentModeScaleAspectFit 按着图片原来的比例压缩
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
//4.UIViewContentModeTop 从上部显示
    // imageView.contentMode = UIViewContentModeTop;
   //5.UIViewContentModeTopLeft 从顶部 左部显示
   // imageView.contentMode = UIViewContentModeTopLeft;
    //6.UIViewContentModeBottom 从底部开始显示
    //imageView.contentMode = UIViewContentModeBottom;
    //UIViewContentModeCenter从中间开始显示
    imageView.contentMode = UIViewContentModeCenter;
    [self addSubview:imageView];
    [imageView release];
    //图片的用户默认交互是关闭状态 如果想让imageView以及他上边的子视图响应用户交互 需要把imageView的userInteractionEnabled属性设置位Yes
    NSLog(@"%d",imageView.userInteractionEnabled);//打印0 默认No
//    
//    //使用UIImageView播放一组图片动画
//    NSMutableArray *imageArray = [NSMutableArray array];
//    for (int i = 1; i < 5; i++) {
//        //%04输出四位，如果不足四位的用0补全
//        //通过for循环获取图片的名字
//        NSString *imageString = [NSString stringWithFormat:@"%d.jpg",i];
//        //通过图片过名字创建UIImage对象
//        UIImage *image = [UIImage imageNamed:imageString];
//        //通过图片对象添加数组中
//        [imageArray addObject:image];
//    }
//    
//    //设置将要播放图片的数组
//    imageView.animationImages = imageArray;
//    //设置动画播放时间
//    imageView.animationDuration = 3.0;
//    //设置动画重复次数
//    imageView.animationDuration = 3;
//    //播放
//    [imageView startAnimating];
    
}
@end
