//
//  AppDelegate.m
//  UILession13UITabBarController
//
//  Created by scjy on 15/12/7.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "AppDelegate.h"
#import "WeChatViewController.h"
#import "AddressBookViewController.h"
#import "DiscoverViewController.h"
#import "MeViewController.h"
#import "SettingViewController.h"
#import "LoginViewController.h"
@interface AppDelegate ()
@property(nonatomic,retain)DiscoverViewController *discoverVc;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
   
    
    //window的根视图需要设置为UITabBarController
    //UITabBarController管理多个视图控制器  被管理的视图控制器是平级关系  通过TabBar标签切换显示被管理的controller页面
//创建一个UITabBarController
    UITabBarController *tabBarVc = [[UITabBarController alloc]init];
//创建tabBarVc 管理的视图控制器
//微信
    WeChatViewController *weChatVc = [[WeChatViewController alloc]init];
//标签标题
    weChatVc.tabBarItem.title = @"微信";
//标签图片
    weChatVc.tabBarItem.image = [UIImage imageNamed:@"09-chat2.png"];
//标签标记
    weChatVc.tabBarItem.badgeValue = @"10";
//导航视图控制器 管理微信
UINavigationController *weChatNav = [[UINavigationController alloc]initWithRootViewController:weChatVc];
weChatVc.navigationItem.title = @"微信";

//通讯录
    AddressBookViewController *addresVc = [[AddressBookViewController alloc]init];
    addresVc.navigationItem.title = @"通讯录";
    addresVc.tabBarItem.title = @"通讯录";
    addresVc.tabBarItem.image = [UIImage imageNamed:@"75-phone.png"];
UINavigationController *addressNav = [[UINavigationController alloc]initWithRootViewController:addresVc];
    addresVc.navigationItem.title = @"通讯录";

//发现
    self.discoverVc = [[DiscoverViewController alloc]init];
    UINavigationController *discoverNav = [[UINavigationController alloc]initWithRootViewController:self.discoverVc];
    self.discoverVc.navigationItem.title = @"发现";
    self.discoverVc.tabBarItem.title = @"发现";
    self.discoverVc.tabBarItem.badgeValue = @"6";
    self.discoverVc.tabBarItem.image = [UIImage imageNamed:@"12-eye.png"];
    
//我
    MeViewController *meVc = [[MeViewController alloc]init];
    UINavigationController *meNav = [[UINavigationController alloc]initWithRootViewController:meVc];
    meVc.navigationItem.title = @"我i";
    meVc.tabBarItem.title = @"我";
    meVc.tabBarItem.image = [UIImage imageNamed:@"29-heart.png"];
    
//设置
    SettingViewController *settingVc = [[SettingViewController alloc]init];
    settingVc.tabBarItem.title = @"设置";
    settingVc.tabBarItem.image = [UIImage imageNamed:@"53-house.png"];
    UINavigationController *setNav = [[UINavigationController alloc]initWithRootViewController:settingVc];
     settingVc.navigationItem.title = @"设置";

//登陆
    LoginViewController *loginVc = [[LoginViewController alloc]init];
    loginVc.tabBarItem.title = @"登陆";
    loginVc.tabBarItem.image = [UIImage imageNamed:@"63-runner.png"];
    UINavigationController *loginNav = [[UINavigationController alloc]initWithRootViewController:loginVc];
     loginVc.navigationItem.title = @"登陆";
//需要设置被tabBarVc管理显示的controller   当  管理啊五个视图控制器会显示 系统会自动增加一个move按钮标签管理第五个和五个以上视图控制器 没有出现在底部的控制器 会以列表的形式 通过点击move按钮显示出来
//tabBarVc.viewControllers = @[weChatVc,addresVc,self.discoverVc ,meVc,settingVc,loginVc];

//导航控制器加到tabBarVc
tabBarVc.viewControllers = @[weChatNav,addressNav,discoverNav ,meNav,setNav,loginNav];
    tabBarVc.delegate = self;

//标签背景图片
//  [tabBarVc.tabBar  setBackgroundImage:[UIImage imageNamed:@"tabBar.png"]];
//点击选中时候的 显示颜色
    tabBarVc.tabBar.tintColor = [UIColor yellowColor];
//标签栏背景颜色
    tabBarVc.tabBar.barTintColor = [UIColor colorWithRed:0.8 green:0.9 blue:0.8 alpha:1.0];
    
    
    
    self.window.rootViewController = tabBarVc;
    [weChatVc release];
    [addresVc release];
    [self.discoverVc release];
    [meVc release];
    [tabBarVc release];
    
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}
#pragma mark UITabBarController
//将要点击选择的controller
-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
//    NSLog(@"%@",viewController);
//    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
    return YES;
}
//点击视图controller
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    //点击取消标记
    if (viewController == self.discoverVc) {
        self.discoverVc.tabBarItem.badgeValue = nil;
    }
    
    
//    NSLog(@"%@",viewController);
//    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
}
//自定义
-(void)tabBarController:(UITabBarController *)tabBarController willBeginCustomizingViewControllers:(NSArray *)viewControllers{
    NSLog(@"%s,%d",__FUNCTION__,__LINE__);
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
