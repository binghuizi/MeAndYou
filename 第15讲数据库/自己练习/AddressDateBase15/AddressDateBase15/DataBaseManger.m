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
    NSString *sql = @"create table lianxi(number integer primary key autoincrement, name text not null,gender text not null,age integer default 18,phoneNumber text not null,remarks text)";
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
//添加
- (BOOL)insertIntoNewLinkMan:(LinkMan *)linkman{
    //1.打开数据库
    [self openDataBase];
  //sqlite3_stmt SQL语句
    sqlite3_stmt *stmt = nil;
    //正在sql 语句
    NSString *sql = @"insert into lianxi(name,gender,age,phoneNumber,remarks) values(?,?,?,?,?)";
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
        return YES;
    }

  //删除释放
    sqlite3_finalize(stmt);
    return NO;
}
//根据手机号删除
- (void)deleteLinkManWithPhoneNUmber:(NSString *)phoneNumber{
//1.打开数据库
    [self openDataBase];
//sqlite3_stmt SQL语句
    sqlite3_stmt *stmt = nil;
//正真的SQL语句
    static char *sql = "delete from  LinkMans where phoneNumber = ?";
    int flag=sqlite3_prepare_v2(database,sql, -1, &stmt, NULL);//调用预处理函数将sql语句赋值给stmt对象
    
    //执行

    if (flag == SQLITE_OK)
    {
        NSLog(@"删除语句没有错误");
        sqlite3_bind_text(stmt, 4, [phoneNumber UTF8String] , -1, SQLITE_TRANSIENT);//给问号占位符赋值  1.语句2.占位符的序号3.给占位符赋得值
                if ( sqlite3_step(stmt) == SQLITE_ERROR) {
            NSLog(@"错误");
        }
       
    }else{
        NSLog(@"删除了第%@",phoneNumber);
    }
    sqlite3_finalize(stmt);
}
//根据姓名删除
- (BOOL)deleteLinkManWithName:(NSString *)name{
    [self openDataBase];
//                 delete from  LinkMans where name= '%@'",name
    NSString * sql = [NSString stringWithFormat:@"delete from lianxi where name = '%@'",name];
//    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &stmt, nil) == SQLITE_OK) {
//        NSLog(@"语句正确");
//        
//        sqlite3_step(stmt);
//    }
//    //删除释放
//    sqlite3_finalize(stmt);
    if (sqlite3_exec(database, [sql UTF8String], NULL, NULL, NULL) == SQLITE_OK) {
        NSLog(@"根据姓名删除成功");
        return 1;
    }else{
        NSLog(@"根据姓名删除失败");
        return 0;
    }
}
//根据姓名修改手机号
-(BOOL)updateLinkManWithPhoneNUmber:(NSString *)phoneNumber withName:(NSString *)name{
    [self openDataBase];
    NSString *sql = [NSString stringWithFormat:@"update lianxi set phoneNumber = '%@' where name = '%@'",phoneNumber,name];
    if (sqlite3_exec(database, [sql UTF8String], NULL, NULL, NULL) == SQLITE_OK) {
        NSLog(@"根据姓名更新手机号成功");
        return 1;
    }else{
        NSLog(@"根据姓名更新手机号失败");
        return 0;
    }

}
//查询所有人
-(NSMutableArray *)seleatAllLinkMans{
    [self openDataBase];
    NSString *sql = @"select *from lianxi";
    sqlite3_stmt *stmt = nil;
    NSMutableArray *linkMansArray = [NSMutableArray array];
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &stmt, nil) == SQLITE_OK) {
        NSLog(@"查询所有人成功");
//遍历数据库中每一行数据
        
        while (sqlite3_step(stmt) == SQLITE_ROW) {
//每一列数据
            const unsigned char *name = sqlite3_column_text(stmt, 1);
            const unsigned char *gender = sqlite3_column_text(stmt, 2);
            int age = sqlite3_column_int(stmt, 3);
            const unsigned char *phoneNumber = sqlite3_column_text(stmt, 4);
            const unsigned char *remarks = sqlite3_column_text(stmt, 5);
//将每一列数据进行转换
            NSString *linkName = [NSString stringWithUTF8String:(const char *)name];
            NSString *linkGender = [NSString stringWithUTF8String:(const char *)gender];
            NSInteger linkAge = age;
            NSString *linkPhoneNumber = [NSString stringWithUTF8String:(const char *)phoneNumber];
            NSString *linkRemarks = [NSString stringWithUTF8String:(const char *)remarks];
//给对象赋值 ，将对象放到数据里
            LinkMan *lM = [[LinkMan alloc]init];
            lM.name = linkName;
            lM.gender = linkGender;
            lM.age = linkAge;
            lM.phoneNumber = linkPhoneNumber;
            lM.remarks = linkRemarks;
            
            [linkMansArray addObject:lM];
           // NSLog(@"%@",linkMansArray);
           
            [lM release];
        }
        
    }else{
        NSLog(@"查询所有人失败");
    }
//    for (id k in linkMansArray) {
//        NSLog(@"%@",k);
//    }
    sqlite3_finalize(stmt);
    return linkMansArray;
}
//根据性别查询所有联系人
- (NSMutableArray *)seleatAllLinkMansWithGender:(NSString *)gender{
    [self openDataBase];
    sqlite3_stmt *stmt = nil;
    NSString *sql = @"select *from LinkMans where gender = ?";
    NSMutableArray *arrayLinkMans = [NSMutableArray array];
    if (sqlite3_prepare_v2(database, [sql UTF8String], -1, &stmt, nil) == SQLITE_OK) {
        NSLog(@"根据性别查询所有联系人成功");

        sqlite3_bind_text(stmt, 2, [gender UTF8String] , -1, NULL);
//遍历数据库中每一行数据
        while (sqlite3_step(stmt) == SQLITE_ROW) {
//每一列数据
            const unsigned char *name = sqlite3_column_text(stmt, 1);
            const unsigned char *gender = sqlite3_column_text(stmt, 2);
            int age = sqlite3_column_int(stmt, 3);
            const unsigned char *phoneNumber = sqlite3_column_text(stmt, 4);
            const unsigned char *remarks = sqlite3_column_text(stmt, 5);
//将每一列数据进行转换
            NSString *linkName = [NSString stringWithUTF8String:(const char *)name];
            NSString *linkGender = [NSString stringWithUTF8String:(const char *)gender];
            NSInteger linkAge = age;
            NSString *linkPhoneNumber = [NSString stringWithUTF8String:(const char *)phoneNumber];
            NSString *linkRemarks = [NSString stringWithUTF8String:(const char *)remarks];
//给对象赋值 ，将对象放到数据里
            LinkMan *lM = [[LinkMan alloc]init];
            lM.name = linkName;
            lM.gender = linkGender;
            lM.age = linkAge;
            lM.phoneNumber = linkPhoneNumber;
            lM.remarks = linkRemarks;
            
            [arrayLinkMans addObject:lM];
            [lM release];
        }
    }else{
        NSLog(@"根据性别查询失败");
    }
    return arrayLinkMans;
}
    











@end
