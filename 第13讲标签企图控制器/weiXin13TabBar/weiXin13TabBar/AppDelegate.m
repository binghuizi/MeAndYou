//
//  AppDelegate.m
//  weiXin13TabBar
//
//  Created by scjy on 15/12/9.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "AppDelegate.h"
#import "WeChatViewController.h"
#import "AddressBookViewController.h"
#import "DiscoverViewController.h"
#import "MeViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
//创建根视图UITabBarController
    UITabBarController *tabBarVc = [[UITabBarController alloc]init];
//微信 通讯录  发现 我
    WeChatViewController *weChatVc       = [[WeChatViewController alloc]init];
    AddressBookViewController *addBookVc = [[AddressBookViewController alloc]init];
    DiscoverViewController *discoverVc   = [[DiscoverViewController alloc]init];
    MeViewController *meVc               = [[MeViewController alloc]init];
    
    weChatVc.tabBarItem.title   = @"微信";
    addBookVc.tabBarItem.title  = @"通讯录";
    discoverVc.tabBarItem.title = @"发现";
    meVc.tabBarItem.title       = @"我";
    
    weChatVc.tabBarItem.image   = [UIImage imageNamed:@"09-chat2.png"];
    addBookVc.tabBarItem.image  = [UIImage imageNamed:@"75-phone.png"];
    discoverVc.tabBarItem.image = [UIImage imageNamed:@"12-eye.png"];
    meVc.tabBarItem.image       = [UIImage imageNamed:@"29-heart.png"];
    
    UINavigationController *weChatNav   = [[UINavigationController alloc]initWithRootViewController:weChatVc];
    UINavigationController *addBookNav  = [[UINavigationController alloc]initWithRootViewController:addBookVc];
    UINavigationController *discoverNav = [[UINavigationController alloc]initWithRootViewController:discoverVc];
    UINavigationController *meNav       = [[UINavigationController alloc]initWithRootViewController:meVc];
    
    weChatVc.navigationItem.title   = @"微信";
    addBookVc.navigationItem.title  = @"通讯录";
    discoverVc.navigationItem.title = @"发现";
    meVc.navigationItem.title       = @"我";
    
    tabBarVc.viewControllers = @[weChatNav,addBookNav,discoverNav,meNav];
    tabBarVc.tabBar.tintColor = [UIColor colorWithRed:0.5 green:0.9 blue:0.5 alpha:1.0];
//

    
    self.window.rootViewController = tabBarVc;
    [tabBarVc release];
    
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
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
