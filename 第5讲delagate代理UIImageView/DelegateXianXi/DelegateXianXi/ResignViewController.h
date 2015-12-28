//
//  ResignViewController.h
//  DelegateXianXi
//
//  Created by scjy on 15/11/26.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
//1.
@protocol ResignDelegate<NSObject>
@required
//协议方法 相当于  必须实现 获取输入框用户名和密码
- (void) getTextFieldName:(NSString *)name passWord:(NSString *)password;

- (void)makeMoney:(NSString *)job;

@end
@interface ResignViewController : UIViewController
//协议属性2.
@property(nonatomic,assign) id<ResignDelegate>delegate;
@end
