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
@interface DataBaseManger : NSObject{
    NSString *dataBasePath;
}
//用单利创建数据管理对象
+ (DataBaseManger *)sharedInstance;
#pragma mark 数据库基本操作
- (void)createDataBase; //创建
- (void)openDataBase;  //打开
- (void)createDataBaseTable;//表
- (void)closeDataBase;//关闭

#pragma mark -----增 删 改c

- (BOOL)insertIntoNewLinkMan:(LinkMan *)linkman;//增

- (void)deleteLinkManWithPhoneNUmber:(NSString *)phoneNumber;//删除 根据编号
- (BOOL)deleteLinkManWithName:(NSString *)name;
- (BOOL)updateLinkManWithPhoneNUmber:(NSString *)phoneNumber withName:(NSString *)name;//根据姓名修改手机号
- (NSMutableArray *)seleatAllLinkMans;// 查
- (NSMutableArray *)seleatAllLinkMansWithGender:(NSString *)gender;
- (NSMutableArray *)seleatAllLinkMansWithPhoneNUmber:(NSString *)PhoneNUmber;
@end
