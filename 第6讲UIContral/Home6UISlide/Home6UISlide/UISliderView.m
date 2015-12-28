//
//  UISliderView.m
//  Home6UISlide
//
//  Created by scjy on 15/11/25.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "UISliderView.h"
@interface UISliderView ()
@property(nonatomic,retain) UISlider *slider1;
@property(nonatomic,retain) UISlider *slider2;
@property(nonatomic,retain) UISlider *slider3;
@end
@implementation UISliderView
/*
创建3个UISlider对象。用这3个UISlider对象控制self.view.backgroundColor的变化。
3个UISlider对象分别控制UIColor的red，green，blue。
滑动任何一个UISlider都会引起背景颜色变化。
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadingCustmView];
    }
    return self;
}

-(void)loadingCustmView{
    //self.backgroundColor = [UIColor colorWithRed:(-45)/255.0f green:80/255.0f blue:95/255.0f alpha:56/255.0f];
    self.backgroundColor = [UIColor colorWithRed:177/255.0f green:24/255.0f blue:21/255.0f alpha:47/255.0f];
    
    self.slider1 = [[UISlider alloc]initWithFrame:CGRectMake(20, 200, self.frame.size.width - 50, 30)];
    self.slider1.maximumValue = 235;
    self.slider1.minimumValue = 0;
    self.slider1.minimumTrackTintColor = [UIColor redColor];
    self.slider1.maximumTrackTintColor = [UIColor brownColor];
   // [self.slider1 addTarget:self action:@selector(controlViewColor1:) forControlEvents:UIControlEventValueChanged];
    [self.slider1 addTarget:self action:@selector(controlViewColor) forControlEvents:UIControlEventValueChanged];
    
    
    
    self.slider2 = [[UISlider alloc]initWithFrame:CGRectMake(20, 250, self.frame.size.width - 50, 30)];
    self.slider2.maximumValue = 164;
    self.slider2.minimumValue = 0;
    self.slider2.minimumTrackTintColor = [UIColor greenColor];
    self.slider2.maximumTrackTintColor = [UIColor brownColor];
    //[self.slider2 addTarget:self action:@selector(controlViewColor2:) forControlEvents:UIControlEventValueChanged];
    
    [self.slider2 addTarget:self action:@selector(controlViewColor) forControlEvents:UIControlEventValueChanged];
    
    
    
    self.slider3 = [[UISlider alloc]initWithFrame:CGRectMake(20, 300, self.frame.size.width - 50, 30)];
    self.slider3.maximumValue = 236;
    self.slider3.minimumValue = 0;
    self.slider3.minimumTrackTintColor = [UIColor blueColor];
    self.slider3.maximumTrackTintColor = [UIColor brownColor];
   // [self.slider3 addTarget:self action:@selector(controlViewColor3:) forControlEvents:UIControlEventValueChanged];
    [self.slider3 addTarget:self action:@selector(controlViewColor) forControlEvents:UIControlEventValueChanged];
    
    
    [self addSubview:self.slider3];
    [self addSubview:self.slider2];
    [self addSubview:self.slider1];
    [self.slider1 release];
    [self.slider2 release];
    [self.slider3 release];
}

//-(void)controlViewColor1:(UISlider *)slider{
//    float f1 = slider.value;
//    
//    self.backgroundColor = [UIColor colorWithRed:(224-f1)/255.0f green:(71-f1)/255.0f blue:(68-f1)/255.0f alpha:f1/255.0f];
//    NSLog(@"controlViewColor1 = %f",slider.value);
//    
//    
//}
//
//-(void)controlViewColor2:(UISlider *)slider{
//   
//    float f2 = slider.value;
//    self.backgroundColor = [UIColor colorWithRed:(130-f2)/255.0f green:(192-f2)/255.0f blue:(87-f2)/255.0f alpha:f2/255.0f];
//    
//}
//-(void)controlViewColor3:(UISlider *)slider{
//    
//    float f3 = slider.value;
//    self.backgroundColor = [UIColor colorWithRed:(11-f3)/255.0f green:(136-f3)/255.0f blue:(251-f3)/255.0f alpha:f3/255.0f];
//    NSLog(@"controlViewColor3 = %f",slider.value);
//    
//}

-(void)controlViewColor{
    float f1 = self.slider1.value;
    float f2 = self.slider2.value;
    float f3 = self.slider3.value;
    self.backgroundColor = [UIColor colorWithRed:f1/255.0f green:f2/255.0f blue:f3/255.0f alpha:1.0];
}

@end
