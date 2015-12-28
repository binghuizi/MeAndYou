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


//打开数据库
- (void)openDataBase{
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
    NSString *dataBasePath = [documentPath stringByAppendingPathComponent:@"Mango.sqlite"];
    //1.dataBasePath数据库文件的路径，UTF8String编码格式
    //2.database数据库对象的地址
    //3.数据库存在打开操作  不存在重新创建
    sqlite3_open([dataBasePath UTF8String], &database);
    NSLog(@"%@",dataBasePath);
}
//执行SQL语句
- (void)execSql:(NSString *)sql result:(NSString *)result{
    if (sqlite3_exec(database, [sql UTF8String], NULL, NULL, NULL) !=SQLITE_OK) {
        
        NSLog(@"%@失败",result);
    }else{
        NSLog(@"%@成功",result);
        
    }
}
//创建表 1.引入数据库头文件
- (void)createDataBase{
    NSString *sqlStr = @"create table if not exists linkMan(name text,phoneNumber text,gender text,age integer,remarks text)";
 //只进行SQL语句
    [self execSql:sqlStr result:@"表创建"];

}
//添加数据
- (void)insertLinkMan:(LinkMan *)man{
    NSString *sqlStr = [NSString stringWithFormat:@"insert into linkMan(name,phoneNumber,gender,age,remarks) values('%@ ','%@ ','%@ ','%ld','%@ ')",man.name,man.phoneNumber,man.gender,man.age,man.remarks];
    //执行SQL语句

    [self execSql:sqlStr result:@"添加联系人"];
    
}
//更新数据
- (void)upDateLinkMan:(LinkMan *)man{
    NSString *sqlStr = [NSString stringWithFormat:@"update linkMan set phoneNumber = '%@',remarks = '%@ ' where name = '%@'",man.phoneNumber,man.remarks,man.name];
    [self execSql:sqlStr result:@"更新联系人"];
    NSLog(@"%d",sqlite3_exec(database, [sqlStr UTF8String], NULL, NULL, NULL));
    NSLog(@"%@",man.phoneNumber);
}
//删除操作
-(void)deleteLinkMan:(LinkMan *)man{
    NSString *sqlStr = [NSString stringWithFormat:@"delete from linkMan where name = '%@ '",man.name];
    [self execSql:sqlStr result:@"删除"];
    
}

//关闭
- (void)closeDataBase{
    
}




@end
