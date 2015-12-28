//
//  LinkMan.h
//  UILession15DataBase
//
//  Created by scjy on 15/12/18.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkMan : NSObject
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *phoneNumber;
@property(nonatomic,copy) NSString *gender;
@property(nonatomic,assign) NSInteger age;
@property(nonatomic,copy) NSString *remarks;//备注
+ (instancetype) linkManWithName:(NSString *)name
                     phoneNumber:(NSString *)phoneNumber
                          gender:(NSString *)gender
                             age:(NSInteger)age
                         remarks:(NSString *)remarks;
- (id)initWithName:(NSString *)name
       phoneNumber:(NSString *)phoneNumber
            gender:(NSString *)gender
               age:(NSInteger)age
           remarks:(NSString *)remarks;
@end
