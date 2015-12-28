//
//  DataBaseManger.m
//  UILession15DataBase
//
//  Created by scjy on 15/12/18.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "DataBaseManger.h"
#import <sqlite3.h>
@implementation DataBaseManger
//创建一个静态 单利对象 初始值为空
static DataBaseManger *dbManger =  nil;
//
+ (DataBaseManger *)sharedInstance{
    //如果单利对象为空创建一个
    if (dbManger == nil) {
        dbManger = [[DataBaseManger alloc]init];
    }
    return dbManger;
}
//创建一个静态数据库
static sqlite3 *database = nil;
//获取应用  沙盒路径

//创建 1.引入数据库头文件
- (void)createDataBase{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    dataBasePath = [documentPath stringByAppendingPathComponent:@"Mango.sqlite"];
    //1.dataBasePath数据库文件的路径，UTF8String编码格式
    //2.database数据库对象的地址
    //3.数据库存在打开操作  不存在重新创建
    
    
   
}
//打开数据库
- (void)openDataBase{
    if (database != nil) {
        return;
    }else {
        [self createDataBase];//创建数据库
    }
    
    sqlite3_open([dataBasePath UTF8String], &database);
    NSLog(@"%@",dataBasePath);
    int result = sqlite3_open([dataBasePath UTF8String], &database);
    if (result == SQLITE_OK) {
        NSLog(@"打开数据库成功");
        [self createDataBaseTable];
    }else{
        NSLog(@"打开数据库失败");
    }
}
//创建表
- (void)createDataBaseTable{
    NSString *sql = @"create table LinkMans(number integer primary key autoincrement, name text not null,gender text not null,age integer default 18,phoneNumber text not null,remarks text)";
    //执行SQL语句 1.database数据库 2.SQL语句UTF8编码格式 3.函数回调 当这条语句执行完 会调用你提供的函数，可以是null 4.是你提供的指针变量 会最终传到你回调函数中去5.是错误信息 是指针类型 接收执行sqlite3错误信息 也可以null
    char *error = nil;
    sqlite3_exec(database, [sql UTF8String], NULL, NULL, &error);
}

//关闭
- (void)closeDataBase{
    if (sqlite3_close(database) == SQLITE_OK) {
        NSLog(@"关闭数据库成功");
        database = nil;
    }else{
        NSLog(@"关闭数据库失败");
    }
    
    
}

#pragma mark ---数据库常用操作
- (void)insertIntoNewLinkMan:(LinkMan *)linkman{
    //1.打开数据库
    [self openDataBase];
  //sqlite3_stmt SQL语句
    sqlite3_stmt *stmt = nil;
    //正在sql 语句
    NSString *sql = @"insert into LinkMans(name,gender,age,phoneNumber,remarks) values(?,?,?,?,?)";
    //验证SQL语句 1.数据库 2.SQL语句 3. 4.指针
    int result = sqlite3_prepare_v2(database, [sql UTF8String], -1, &stmt, NULL);
    if (result == SQLITE_OK) {
        NSLog(@"添加SQL语句没有问题成功");
        //绑定数据 1.绑定的是上边SQL语句里面的？(问号) 将？替换为应该存储的值 2.绑定？时标记从1开始不是0
        //绑定 1.name gender age  phoneNumber remarks
        sqlite3_bind_text(stmt, 1, [linkman.name UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 2, [linkman.gender UTF8String], -1, NULL);
        sqlite3_bind_int64(stmt, 3, linkman.age );
        sqlite3_bind_text(stmt, 4, [linkman.phoneNumber UTF8String], -1, NULL);
        sqlite3_bind_text(stmt, 5, [linkman.remarks UTF8String], -1, NULL);
        
    //执行
        sqlite3_step(stmt);
    }else{
        NSLog(@"sql语句有问题");
    }
  //删除释放
    sqlite3_finalize(stmt);
}
//根据联系人姓名删除
- (void)deleteLinkManWithName:(NSString *)name{
    [self openDataBase];//打开数据库
    sqlite3_stmt *stmt = nil;//存储数据库的变量
    NSString *sql = @"delete from LinkMans where name = ?";
    //验证SQL
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &stmt, NULL) == SQLITE_OK) {
        NSLog(@"删除语句正确");
        sqlite3_bind_text(stmt, 1, [name UTF8String], -1, NULL);//绑定
        //执行
        sqlite3_step(stmt);
    }else{
        NSLog(@"删除语句有问题");
    }
    //释放
    sqlite3_finalize(stmt);
    
}
- (void)updateLinkManWithPhoneNUmber:(NSString *)phoneNumber withName:(NSString *)name{
    [self openDataBase];
    sqlite3_stmt *stmt = nil;//创建SQL语句的指针
    NSString *sql = @"update LinkMans set phoneNumber = ? where name = ?";
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &stmt, NULL) == SQLITE_OK) {
        NSLog(@"修改语句成功");
        sqlite3_bind_text(stmt, 1, [phoneNumber UTF8String], -1, NULL); //绑定第一个？的值
        sqlite3_bind_text(stmt, 2, [name UTF8String], -1, NULL);//绑定第二个？的值
        //执行
        sqlite3_step(stmt);
    }else{
       NSLog(@"修改语句错误");
    }
    //释放
    sqlite3_finalize(stmt);
}
- (NSMutableArray *)seleatAllLinkMansWithGender:(NSString *)gender{
    [self openDataBase];
     sqlite3_stmt *stem = nil;
    NSMutableArray *linkManArray = [NSMutableArray array];//创建数组 取出值 放进去
    NSString *sql = @"select name,age,phoneNumber,remarks from LinkMans where gender = ?";
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &stem, NULL) == SQLITE_OK) {
        NSLog(@"查询语句成功");
        sqlite3_bind_text(stem, 1, [gender UTF8String], -1, NULL);//绑定
        //循环添加  查询出来的数据
        while (sqlite3_step(stem) == SQLITE_ROW) {// sqlite3_step(stem)数据库语句 单步执行
//每一行数据
            const unsigned  char *name       = sqlite3_column_text(stem, 0);
            NSInteger age = sqlite3_column_int64(stem,1);
            const unsigned char *phoneNumber = sqlite3_column_text(stem, 2);
            const unsigned char *remorks     = sqlite3_column_text(stem, 3);
            NSLog(@"%lu",age);
//每一行数据进行转换
            NSString *linkName        = [NSString stringWithUTF8String:(const char *)name];
            NSInteger linkAge         = age;
            NSString *linkPhoneNumber = [NSString stringWithUTF8String:(const char *)phoneNumber];
            NSString *linkRemarks     = [NSString stringWithUTF8String:(const char *)remorks];
 //取出的数据放到linkman对象   将对象放到数组
        LinkMan *lm = [[LinkMan alloc]initWithName:linkName phoneNumber:linkPhoneNumber gender:gender age:linkAge remarks:linkRemarks];
            
            
            [linkManArray addObject:lm];
        }
        //执行
        sqlite3_step(stem);
    }else {
        NSLog(@"查询语句错误");
    }
    return linkManArray;
}
//查询所有联系人
//- (NSMutableArray *)seleatAllLinkMans{
//    [self openDataBase];
//    sqlite3_stmt *stem = nil;
//    NSString *sql = @"select *from LinkMans";
//    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &stem, NULL) == SQLITE_OK) {
//        
//    }
//}
//根据手机号删除
- (void)deleteLinkManWithPhoneNUmber:(NSString *)phoneNumber{
    [self openDataBase];
    sqlite3_stmt *stmt = nil;
    NSString *sql = @"delate from LinkMans where phoneNumber = ?";
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &stmt, NULL) == SQLITE_OK) {
        NSLog(@"根据手机号删除语句成功");
        sqlite3_bind_text(stmt, 4, [phoneNumber UTF8String], -1,NULL);
    //执行
        sqlite3_finalize(stmt);
    }else{
        NSLog(@"根据手机号删除语句不成功");
    }
    //释放
    sqlite3_finalize(stmt);
}

@end
