//
//  MangoView.m
//  UIlessionControl6
//
//  Created by scjy on 15/11/25.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "MangoView.h"
@interface MangoView()
@property(nonatomic,retain) UISegmentedControl *segmentControl;
@property(nonatomic,retain) UISlider *slider;
@property(nonatomic,retain) UILabel *label;
@end
@implementation MangoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadingCustonView];
    }
    return self;
}
-(void)dealloc{
    [_segmentControl release];
    [super dealloc];
}
- (void)loadingCustonView{
 
//    //初始化segment 需要制定一个数组
//    self.segmentControl = [[UISegmentedControl alloc]initWithItems:@[@"宝马",@"奥迪",@"大众",@"兰博基尼"]];
//    //
//    self.segmentControl.frame = CGRectMake(10, 30, self.frame.size.width, 40);
//    //按下选中效果 不会继续保持 会马上消失 no 按下一直保留 直到悬着其它选项
//    NSLog(@"%lu",self.segmentControl.numberOfSegments);//分段个数numberOfSegments
//    [self.segmentControl setTitle:@"本田" forSegmentAtIndex:3];//覆盖 在哪个位置修改
//    [self.segmentControl insertSegmentWithTitle:@"车" atIndex:0 animated:YES];//添加选项 在哪个位置  YES是有动画 no 没有动画效果
//    self.segmentControl.tintColor = [UIColor blueColor];//设置segment主题 边框和文字颜色
//    //给某一段设置图片
//    UIImage *image = [UIImage imageNamed:@"1.jpg"];
//    [self.segmentControl insertSegmentWithImage:image atIndex:2 animated:YES];
//    [self.segmentControl setImage:[UIImage imageNamed:@"2.png"] forSegmentAtIndex:0];
//    //设置某一段 是否可用 不可用就是灰色  no是不可用  也是是可用
//    [self.segmentControl setEnabled:YES forSegmentAtIndex:3];
//    
//    
//    self.segmentControl.momentary = YES;
//    //给segment设施方法 点击触发
//    [self.segmentControl addTarget:self action:@selector(segmentTapAction:)forControlEvents:UIControlEventValueChanged];//给segment设施方法
//    
//    [self addSubview:self.segmentControl];
//    [self.segmentControl release];
    
    
    self.slider = [[UISlider alloc]initWithFrame:CGRectMake(20, 200, self.frame.size.width - 40, 30)];
//滑块左侧最小值
    self.slider.maximumValue = 100;
    self.slider.minimumValue = 20;
    //划过之后 显示颜色玫红  最小值区域颜色
    self.slider.minimumTrackTintColor = [UIColor magentaColor];
    self.slider.maximumTrackTintColor = [UIColor redColor];//为划过红色
//添加方法 UIControlEventValueChanged当值改变之后
    [self.slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:self.slider];
    [self.slider release];
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(50, 100, 100, 100)];
    //self.label.textAlignment = UITextAlignmentCenter;
    [self addSubview:self.label];
    
}
-(void)sliderAction:(UISlider *)slider{
    NSLog(@"%f",slider.value);
   
    //stringWithFormat 数字转化成字符串
    self.label.text = [NSString stringWithFormat:@"%f",self.slider.value];
 
}
//点击触发  抓取分段显示 segment.selectedSegmentIndex每一段位置
- (void)segmentTapAction:(UISegmentedControl *)segment{
    switch (segment.selectedSegmentIndex) {
        case 0:
            [self segmentOne];
            break;
        case 1:
            [self segmentTwo];
            break;
        case 2:
            [self segmentThree];
            break;
        case 3:
            [self segmentFore];
            break;
        default:
            break;
    }
}
- (void)segmentOne{
    NSLog(@"1");
}

- (void)segmentTwo{
    NSLog(@"2");
}
- (void)segmentThree{
    NSLog(@"3");
}
- (void)segmentFore{
    NSLog(@"4");
}

@end
