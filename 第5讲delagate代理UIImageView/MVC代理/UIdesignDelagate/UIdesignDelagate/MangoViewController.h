//
//  MangoViewController.h
//  UIdesignDelagate
//
//  Created by scjy on 15/11/24.
//  Copyright (c) 2015年 张鹏飞. All rights reserved.
//

#import <UIKit/UIKit.h>
//定义协议
@protocol MangoVCDelagate <NSObject>
//没有关键字，协议里的方法是默认必须实现的

@required
-(void)getTextFieldInput:(NSString *)text;


@optional
//可选实现


@end


@interface MangoViewController : UIViewController
//声明代理协议的属性，，，关键字,,,一定要用assign
@property(nonatomic, assign) id<MangoVCDelagate>delegate;



@end
