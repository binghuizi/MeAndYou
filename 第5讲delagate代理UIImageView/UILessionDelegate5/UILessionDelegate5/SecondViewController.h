//
//  SecondViewController.h
//  UILessionDelegate5
//
//  Created by scjy on 15/11/25.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
//定义协议
@protocol SecondVCDelegate <NSObject>

@required
-(void)getTextFieldInputText:(NSString *)text;

@end
@interface SecondViewController : UIViewController
//声明代理属性
@property(nonatomic,assign) id<SecondVCDelegate>delegate;
@end
