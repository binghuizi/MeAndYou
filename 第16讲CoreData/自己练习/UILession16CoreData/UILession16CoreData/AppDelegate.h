//
//  AppDelegate.h
//  UILession16CoreData
//
//  Created by scjy on 15/12/21.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>//coredata框架头文件  引入

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
//1.数据管理器 （工具）类 作用是用来管理数据的： 增 删 改 查
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;

//2.数据模型 （工具）类 只是提供数据模型 并不是数据库
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;

//3.数据化存储助理 数据连接器 （工具）类 数据持久化存储助理 把1.数据管理器和2.数据模型 联系到一起
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

//4.提供对1.数据管理器工具类的保存 将数据管理器工具类 内管理的对象 保存到实体数据库中 存储  把对象保存到数据库中
- (void)saveContext;

//5.返回应用程序的 Documents路径
- (NSURL *)applicationDocumentsDirectory;


@end

