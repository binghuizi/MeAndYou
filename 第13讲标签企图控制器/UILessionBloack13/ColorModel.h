//
//  ColorModel.h
//  UILessionBloack13
//
//  Created by scjy on 15/12/7.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIColor.h>//导入系统用<>
typedef void(^responseColor) (UIColor *willSetColor);// responseColor 相当于 void(^)(UIColor *wellSetColor)
@interface ColorModel : NSObject
//把参数类型定义成block类型  colorBlock是无返回值 有参数  void(^)(UIColor *wellSetColor)
//- (void)getViewColorWithColorBlock:(void(^)(UIColor *wellSetColor))colorBlock;

- (void)getViewColorWithColorBlock:(responseColor)colorBlock;
@end
