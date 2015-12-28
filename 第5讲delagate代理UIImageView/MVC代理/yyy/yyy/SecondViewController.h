//
//  SecondViewController.h
//  UILessonDelegate
//
//  Created by 张茫原 on 15/11/24.
//  Copyright © 2015年 芒果科技. All rights reserved.
//

#import <UIKit/UIKit.h>

//定义协议
@protocol SecondVCDelegate <NSObject>

@required
//没有关键字，协议里的方法默认是必须实现的
- (void)getTextFiledInputText:(NSString *)text;

//@optional
//可选择实现

@end


@interface SecondViewController : UIViewController

//声明代理协议的属性，关键字一定要用assign！！！！！！！！！！！！！！
@property(nonatomic, assign) id<SecondVCDelegate>delegate;

@end





