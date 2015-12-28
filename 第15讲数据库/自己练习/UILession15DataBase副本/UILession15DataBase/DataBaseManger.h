//
//  DataBaseManger.h
//  UILession15DataBase
//
//  Created by scjy on 15/12/18.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "LinkMan.h"
@interface DataBaseManger : NSObject
//用单利创建数据管理对象
+ (DataBaseManger *)sharedInstance;
#pragma mark 数据库基本操作
- (void)openDataBase;  //打开
- (void)execSql:(NSString *)sql result:(NSString *)result;//执行SQL语句
- (void)createDataBase; //创建
- (void)insertLinkMan:(LinkMan *)man;//添加
- (void)upDateLinkMan:(LinkMan *)man;//更新
- (void)deleteLinkMan:(LinkMan *)man;//删除
- (void)closeDataBase;//关闭







@end
