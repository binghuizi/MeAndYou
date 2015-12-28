//
//  DataBaseManger.h
//  AddressBook12
//
//  Created by scjy on 15/12/21.
//  Copyright © 2015年 赵佳慧iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "AddressBookModel.h"

@interface DataBaseManger : NSObject
{
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

- (BOOL)insertIntoNewAddressBook:(AddressBookModel *)addrBook;//增

-(NSMutableArray *)selectAllAddrBook;//查询所有不联系人




@end
