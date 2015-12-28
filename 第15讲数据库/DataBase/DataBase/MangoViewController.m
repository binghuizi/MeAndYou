//
//  MangoViewController.m
//  DataBase
//
//  Created by scjy on 15/12/17.
//  Copyright © 2015年 scjy. All rights reserved.
//
#define DBNAME    @"personinfo.sqlite"
#define NAME      @"name"
#define AGE       @"age"
#define ADDRESS   @"address"
#define TABLENAME @"PERSONINFO"

#import "MangoViewController.h"

@interface MangoViewController ()

@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//获取沙盒目录    数据库文件也保存在沙盒的documents文件里,所以先找沙盒路径
    NSArray *paths          = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *document      = [paths objectAtIndex:0];
    NSString *database_path = [document stringByAppendingPathComponent:DBNAME];
    NSLog(@"%@",database_path);
//sqlite3_open打开数据库  没有数据库的时候创建
    if (sqlite3_open([database_path UTF8String], &db) != SQLITE_OK) {
        sqlite3_close(db);
        NSLog(@"数据库打开失败");
    }
    
//创建数据表
    NSString *sqlCreateTable = @"CREATE TABLE IF NOT EXISTS PERSONINFO (ID INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, age INTEGER, address TEXT)";
    [self execSql:sqlCreateTable];//创建好数据表 执行数据SQL语句
//插入数据  直接把数据写在要执行的sql语句后面
    NSString *sql1 = [NSString stringWithFormat:@"INSERT INTO '%@' ('%@', '%@', '%@') VALUES ('%@', '%@', '%@')", TABLENAME, NAME, AGE, ADDRESS, @"张三", @"23", @"西城区"];
    NSString *sql2 = [NSString stringWithFormat:
                      @"INSERT INTO '%@' ('%@', '%@', '%@') VALUES ('%@', '%@', '%@')",
                      TABLENAME, NAME, AGE, ADDRESS, @"老六", @"20", @"东城区"];
    [self execSql:sql1];
    [self execSql:sql2];
    
//查询数据库 并打印数据
    NSString *sqlQuery = @"SELECT * FROM PERSONINFO";
    
    sqlite3_stmt *statement;
//sqlite3_prepare_v2执行查询的方法  当查询成功使用sqlite3_step 当游标（statement）指向每一行SQLITE_ROW开始读取数据  sqlite3_column_text读取字符串类型的数据 sqlite3_column_int读取int类型数据
    if (sqlite3_prepare_v2(db, [sqlQuery UTF8String], -1, &statement, nil) == SQLITE_OK) {

//当查询成功使用sqlite3_step 当游标（statement）指向每一行SQLITE_ROW开始读取数据
        while (sqlite3_step(statement) == SQLITE_ROW) {
            char *name    = (char*)sqlite3_column_text(statement, 1);//读取字符串 类型
            char *address = (char*)sqlite3_column_text(statement, 3);
            int age       = sqlite3_column_int(statement, 2);//读取整型数据类型
            
            NSString *nsNameStr    = [[NSString alloc]initWithUTF8String:name];
            NSString *nsAddressStr = [[NSString alloc]initWithUTF8String:address];
           NSLog(@"name:%@  age:%d  address:%@",nsNameStr,age, nsAddressStr);
        }
    }
     sqlite3_close(db);//关闭数据库
    
    
}
//创建独立执行SQL语句的方法 传入SQL语句 就执行SQL语句 execSql执行数据库
- (void)execSql:(NSString *)sql{
    char *err;
    if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &err) !=SQLITE_OK) {
        sqlite3_close(db);
        NSLog(@"数据库操作数据失败");
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
