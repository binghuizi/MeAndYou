//
//  DataBaseManger.m
//  AddressBook12
//
//  Created by scjy on 15/12/21.
//  Copyright © 2015年 赵佳慧iOS. All rights reserved.
//

#import "DataBaseManger.h"
#import <sqlite3.h>
@implementation DataBaseManger
static DataBaseManger *dbManger = nil;

+(DataBaseManger *)sharedInstance{
    if (dbManger == nil) {
        dbManger = [[DataBaseManger alloc]init];
    }
    return dbManger;
}
static sqlite3 *database = nil;
//1.创建数据库文件
- (void)createDataBase{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    dataBasePath = [documentPath stringByAppendingPathComponent:@"addrBook.sqlite"];
    
}
//2.打开数据库
-(void)openDataBase{
    if (database != nil) {
        return;
    }else{
        [self createDataBase];
    }
    sqlite3_open([dataBasePath UTF8String], &database);
    NSLog(@"%@",dataBasePath);
    if (sqlite3_open([dataBasePath UTF8String], &database) == SQLITE_OK) {
        NSLog(@"打开数据库成功");
        [self createDataBaseTable];
    }else{
        NSLog(@"打开数据库失败");
    }
}
//创建表
-(void)createDataBaseTable{
    NSString *sql = @"create table addrBook(number integer primary key autoincrement,imagename text,name text not null,gender text not null,age integer default 18,phoneNumber text not null,hobby text)";
    char *error = nil;
    sqlite3_exec(database, [sql UTF8String], NULL, NULL, &error);
    
}
//关闭数据库
-(void)closeDataBase{
    if (sqlite3_close(database) == SQLITE_OK) {
        NSLog(@"关闭数据库成功");
        database = nil;
    }else{
        NSLog(@"关闭数据库失败");
    }
}
#pragma mark ---数据库常用操作 
//添加
-(BOOL)insertIntoNewAddressBook:(AddressBookModel *)addrBook{
    //1.打开数据库
    [self openDataBase];
    sqlite3_stmt *stmt = nil;
    NSString *sql = @"insert into addrBook(imagename,name,gender,age,phoneNumber,hobby) values(?,?,?,?,?,?)";
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &stmt, NULL) == SQLITE_OK) {
        NSLog(@"添加语句没问题");
        sqlite3_bind_text(stmt, 1, [addrBook.imageModel UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 2, [addrBook.nameModel UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 3, [addrBook.genderModel UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 4, [addrBook.ageGender UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 5, [addrBook.phoneModel UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 6, [addrBook.hobbyModel UTF8String], -1, NULL);
        //执行
        sqlite3_step(stmt);
        return YES;
    }else {
        NSLog(@"添加语句有问题");
        
    }
    //删除释放
    sqlite3_finalize(stmt);
    return NO;
}
//查询所有联系人
-(NSMutableArray *)selectAllAddrBook{
    [self openDataBase];
    NSString *sql = @"select *from addrBook";
    sqlite3_stmt *stmt = nil;
    NSMutableArray *addrBookArray = [NSMutableArray new];
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &stmt, nil) == SQLITE_OK) {
        NSLog(@"查询所有人成功");
//遍历每一行数据
        while (sqlite3_step(stmt) == SQLITE_ROW) {
//每一列数据
            const unsigned char *imageName   = sqlite3_column_text(stmt, 1);
            const unsigned char *name        = sqlite3_column_text(stmt, 2);
            const unsigned char *gender      = sqlite3_column_text(stmt, 3);
            const unsigned char *age         = sqlite3_column_text(stmt, 4);
            const unsigned char *phoneNumber = sqlite3_column_text(stmt, 5);
            const unsigned char *hobby       = sqlite3_column_text(stmt, 6);
//每一行数据进行转换
            NSString *addImageName   = [NSString stringWithUTF8String:(const char *)imageName];
            NSString *addName        = [NSString stringWithUTF8String:(const char *)name];
            NSString *addGender      = [NSString stringWithUTF8String:(const char *)gender];
            NSString *addAge         = [NSString stringWithUTF8String:(const char *)age];
            NSString *addPhoneNumber = [NSString stringWithUTF8String:(const char *)phoneNumber];
            NSString *addHobby       = [NSString stringWithUTF8String:(const char *)hobby];
 //给对象进行赋值，将对象放到数组里
            AddressBookModel *abm = [[AddressBookModel alloc]init];
            abm.imageModel  = addImageName;
            abm.nameModel   = addName;
            abm.genderModel = addGender;
            abm.ageGender   = addAge;
            abm.phoneModel  = addPhoneNumber;
            abm.hobbyModel  = addHobby;
            [addrBookArray addObject:abm];
            [abm release];
        
        }

    }else{
        NSLog(@"查询所有人语句有错误");
    }
    sqlite3_finalize(stmt);
    return addrBookArray;
}

@end
