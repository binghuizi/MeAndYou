//
//  AppDelegate.m
//  UILession--UIviewUILable
//
//  Created by scjy on 15/11/18.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"//引入自定义的ViewController头文件
//延展
@interface AppDelegate ()

@end

@implementation AppDelegate

//应用程序启动之后进入此方法
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//初始化化UIWindow对象并且设置Window大小
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //应用程序启动之后书写自定义代码的位置（咱们自己需要写的代码）
    // Override point for customization after application launch.
    
    //UIViewController创建默认颜色透明的
    //在设置根试图之前，需要先实例化（初始化）出来RootViewController对象
    RootViewController *rootViewController = [[RootViewController alloc]init];
   //把rootViewController作为window设置根试图
    self.window.rootViewController = rootViewController;
    //释放
    [rootViewController release];//rootViewController引用计数为2
    //创建视图的步骤：
   // 1.分配内存空间，并且初始化设置试图大小
    UIView *v_one = [[UIView alloc]initWithFrame:CGRectMake(0.0, 0.0, 375, 100)];
   //2.试图的基本设置设置本经颜色
    v_one.backgroundColor = [UIColor yellowColor];
   // 3.将视图添加到widow上取显示
    [self.window addSubview:v_one];
   //4.释放内存空间
    [v_one release];
    
    UIView *v_two = [[UIView alloc]initWithFrame:CGRectMake(0, 200, 320, 100)];
    v_two.backgroundColor = [UIColor brownColor];
    v_two.center = CGPointMake(188, 250);
    [self.window addSubview:v_two];
    
    UIView *v_three = [[UIView alloc]initWithFrame:CGRectMake(10,10 , 100, 80)];
    v_three.backgroundColor = [UIColor orangeColor];
    //将v_three视图添加到v_two视图  讲一个视图添加到另一个视图上 子视图跟着父视图
    v_three.center = CGPointMake(160, 50);
    v_two.bounds =CGRectMake(40, 50, 320, 100);//修改父类的bounds 子类坐标会改变
    [v_two addSubview:v_three];
    // NSLog(@"v_two.fram",)
    [v_two release];
    [v_three release];
//center中心点是基于父视图来说的，当中心点改变之后，在父视图上找到新的中心点 然后把子视图平移过去
//    
//    UIView *bule = [[UIView alloc]initWithFrame:CGRectMake(50, 400, 200, 200)];
//    bule.backgroundColor = [UIColor purpleColor];
//    [self.window addSubview:bule];
//    
//    UIView *grry = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 180, 180)];
//    grry.backgroundColor = [UIColor grayColor];
//    grry.center = CGPointMake(100, 100);
//    [bule addSubview:grry];
//    
//    UIView *read = [[UIView alloc]initWithFrame:CGRectMake(40, 40, 160, 160)];
//    read.backgroundColor = [UIColor redColor];
//    read.center = CGPointMake(90, 90);
//    [grry addSubview:read];
//
//    UIView *bul2 = [[UIView alloc]initWithFrame:CGRectMake(60, 60, 140, 140)];
//    bul2.backgroundColor = [UIColor blueColor];
//    bul2.center = CGPointMake(80, 80);
//    [read addSubview:bul2];
//
//    UIView *bro = [[UIView alloc]initWithFrame:CGRectMake(80, 80, 120, 120)];
//    bro.backgroundColor = [UIColor brownColor];
//    bro.center = CGPointMake(70, 70);
//    [bul2 addSubview:bro];
//    
//    UIView *ora = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    ora.backgroundColor = [UIColor orangeColor];
//    ora.center = CGPointMake(60, 60);
//    [bro addSubview:ora];
//    
//    UIView *yearlo = [[UIView alloc]initWithFrame:CGRectMake(120, 120, 80, 80)];
//    yearlo.backgroundColor = [UIColor blackColor];
//    yearlo.center = CGPointMake(50, 50);
//    [ora addSubview:yearlo];
//    
//    UIView *cy = [[UIView alloc]initWithFrame:CGRectMake(140, 140, 60, 60)];
//    cy.backgroundColor = [UIColor cyanColor];
//    cy.center = CGPointMake(40, 40);
//    [yearlo addSubview:cy];
//    
//    [cy release];
//    [yearlo release];
//    [ora release];
//    [bro release];
//    [bul2 release];
//    [read release];
//    [grry release];
//    [bule release];
    //隐藏显示 当视图隐藏起该子类视图也会隐藏
 //   v_two.hidden = YES;
    //透明度 颜色改变  1是完全不透明
    v_one.alpha = 0.5;
    //superView
   
    NSLog(@"%@", v_three.superview);//输出当前视图父视图
    
    NSArray *sub = v_two.subviews;//输出当前视图的所有子视图
    NSLog(@"%@",sub);
    
//给视图（子视图）添加标记  通过父视图找子视图  通过tag需找view 用父视图调用viewWithTag 并且添加tag值
    v_three.tag = 10;
    UIView *newView = [v_two viewWithTag:10];
    NSLog(@"%@",v_three);
    NSLog(@"%@",newView);
    
    
    UILabel *nameLable = [[UILabel alloc]initWithFrame:CGRectMake(100, 320, 200, 100)];
    nameLable.backgroundColor = [UIColor purpleColor];
    nameLable.text = @"挣钱挣钱，买车买衣服";
    [self.window addSubview:nameLable];
    //文字对齐方式
    nameLable.textAlignment = NSTextAlignmentCenter;
    //字体变大
    nameLable.font = [UIFont systemFontOfSize:15.0f];
    //字体颜色
    nameLable.textColor = [UIColor whiteColor];
    //设置文字阴影颜色
    nameLable.shadowColor = [UIColor yellowColor];
    //文本显示行数 默认显示一行 当是0时 自动换行
    nameLable.numberOfLines = 0;
    //阴影偏移位置面积
    nameLable.shadowOffset = CGSizeMake(5, 5);
    
    [nameLable release];
    
    
    
    //frame
/*                  坐标系              分辨率
    3.50 寸屏幕   320  * 480         640  * 960
    4.00 寸屏幕   320  * 568         640  * 1136
    4.70 寸屏幕   375  * 667         750  * 1334
    5.50 寸屏幕   414  * 736         1242 * 2208
    7.90 寸屏幕   384  * 512         1024 * 768
    9.70 寸屏幕   768  * 1024        1536 * 2048
    12.9 寸屏幕   1366 * 1024        2732 * 2048
*/
    //把window颜色设置白色
    self.window.backgroundColor = [UIColor blackColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)addImage{
    UIImage *image = [UIImage imageNamed:@"2"];
    
    [self.window addSubview:image];
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
