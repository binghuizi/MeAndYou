//
//  MangoViewController.h
//  DataBase
//
//  Created by scjy on 15/12/17.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
@interface MangoViewController : UIViewController
{  //用来保存数据库对象的地址
    sqlite3 *db;
}
@end
