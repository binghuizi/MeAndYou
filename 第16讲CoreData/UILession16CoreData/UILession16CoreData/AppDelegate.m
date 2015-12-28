//
//  AppDelegate.m
//  UILession16CoreData
//
//  Created by scjy on 15/12/21.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "AppDelegate.h"
#import "MangoViewController.h"
#import "LinkMans.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
   
    MangoViewController *mangVc = [[MangoViewController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:mangVc];
    self.window.rootViewController = nav;

    //应用程序的 Documents路径
    NSURL *url = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
  //  NSString *st = [[NSString alloc]initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    
    NSLog(@"%@",url);
//调用数据管理器工具类
   [self managedObjectContext];
//Bundle 路径下的.App 应用程序安装包的路径
//  NSLog(@"%@",[NSBundle mainBundle].resourcePath);
    
  //1.创建实体类描述信息
    NSEntityDescription *linkManEntityDes = [NSEntityDescription entityForName:@"LinkMans" inManagedObjectContext:self.managedObjectContext];
    
  // 通过 实体类描述信息 和数据管理器 生成实体类
    LinkMans *sameDesktop = [[LinkMans alloc]initWithEntity:linkManEntityDes insertIntoManagedObjectContext:self.managedObjectContext];
   
    sameDesktop.name = @"张鹏飞";
    sameDesktop.gender = @"男";
    sameDesktop.age = @(22);
    sameDesktop.phoneNumber = @"1824567852";
    sameDesktop.remarks = @"火星大咖";
    
    LinkMans *sameDesktop2 = [[LinkMans alloc]initWithEntity:linkManEntityDes insertIntoManagedObjectContext:self.managedObjectContext];
    
    sameDesktop2.name = @"乔自朋";
    sameDesktop2.gender = @"男";
    sameDesktop2.age = @(20);
    sameDesktop2.phoneNumber = @"1824567852";
    sameDesktop2.remarks = @"水星";
//保存数据库
    [self saveContext];
//查询
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"LinkMans"];
//通过数据管理器 请求需要查询的数据
    NSArray *entityArray = [self.managedObjectContext executeFetchRequest:request error:nil];
    NSLog(@"%@",entityArray.lastObject);
//删除
    LinkMans *linkMan =entityArray[0];
    
    [self.managedObjectContext deleteObject:linkMan];
    
   // [self saveContext];
    
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
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "iOS.huI.UILession16CoreData" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
  //如果数据模型 为空就创建一个  反之返回当前数据模型
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    //在Bundle  路径下创建了一个 根工程名字相同的  后缀.momd类型文件
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"UILession16CoreData" withExtension:@"momd"];
    //通过路径初始化 数据模型工具类
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
   //如果数据持久化为空 就创建一个 反之就返回当前数据持久化存储助理
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
   //使用数据模型 工具类 创建一个数据持久化数据存储助理
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    //在Document 路径下创建的一个和工程名字相同的 数据库文件
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"UILession16CoreData.sqlite"];
   //
    NSError *error = nil;
    
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    //1.addPersistentStoreWithType是选择数据持久化类型2.configuration 默认使用的是 关于配置的信息 3.URL数据库的路径
    //4.options 可选项 5.error错误信息
    
    //如果数据库创建失败 终止程序
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();//应用程序退出 终止 慎用
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    //如果数据管理类存在就返回 数据管理器 工具类的实例对象 反之 则创建一个新的数据管理工具类
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
 //创建一个数据持久化助理 连接器
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    //如果数据持久化助理 为空 返回空
    if (!coordinator) {
        return nil;
    }
//当数据持久化不为空 才去创建数据管理器 工具类
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
   //给数据管理器工具类设置了 数据持久化存储助理
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    //创建一个新的数据管理器工具类 并把当前的数据工具类赋值给新的类
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
   //如果数据管理器 工具类不为空 进入此方法
    if (managedObjectContext != nil) {
        NSError *error = nil;
        //如果数据改变 并且保存失败的时候终止程序
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
