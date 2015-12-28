//
//  AppDelegate.h
//  UILession--UIviewUILable
//
//  Created by scjy on 15/11/18.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
//window是应用程序的窗口，每一个APP都需要借借助UIWindow对象将内容呈献给用户
//通常一个应用程序只有一个窗口（也就是只创建一个UIWindow对象）
//Window作用：呈献给用户UI界面，Window只负责承载，但是我们并不会对Window做太多的操作界面
@property (strong, nonatomic) UIWindow *window;


@end

