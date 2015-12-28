//
//  ColorModel.m
//  UILessionBloack13
//
//  Created by scjy on 15/12/7.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "ColorModel.h"

@implementation ColorModel
- (void)getViewColorWithColorBlock:(void(^)(UIColor *wellSetColor))colorBlock{
    UIColor *wellSetCollor = [UIColor colorWithRed:arc4random()%256/255.0f green:arc4random()%256/255.0f blue:arc4random()%256/255.0f alpha:arc4random()%256/255.0f];
    //Block调用
    colorBlock(wellSetCollor);
}
//- (void)getViewColorWithColorBlock:(responseColor)colorBlock{
//    UIColor *wellSetCollor = [UIColor colorWithRed:arc4random()%256/255.0f green:arc4random()%256/255.0f blue:arc4random()%256/255.0f alpha:arc4random()%256/255.0f];
//    //Block调用
//    colorBlock(wellSetCollor);
//}
@end
