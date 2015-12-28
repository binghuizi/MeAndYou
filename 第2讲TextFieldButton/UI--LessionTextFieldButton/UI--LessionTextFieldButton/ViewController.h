//
//  ViewController.h
//  UI--LessionTextFieldButton
//
//  Created by scjy on 15/11/19.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
//添加输入框协议
@interface ViewController : UIViewController<UITextFieldDelegate>
//把输入框定义成属性
@property(nonatomic,readwrite,retain)UITextField *firstTextField;

@end

