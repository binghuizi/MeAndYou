//
//  LinkMan.m
//  UILession15DataBase
//
//  Created by scjy on 15/12/18.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "LinkMan.h"

@implementation LinkMan
- (id)initWithName:(NSString *)name phoneNumber:(NSString *)phoneNumber gender:(NSString *)gender age:(NSInteger)age remarks:(NSString *)remarks{
    self = [super init];
    if (self) {
        _name        = name;
        _phoneNumber = phoneNumber;
        _gender      = gender;
        _age         = age;
        _remarks     = remarks;
    }
    return self;
}
+ (instancetype) linkManWithName:(NSString *)name
                     phoneNumber:(NSString *)phoneNumber
                          gender:(NSString *)gender
                             age:(NSInteger)age
                         remarks:(NSString *)remarks{
    LinkMan *linkMan = [[[LinkMan alloc]initWithName:name phoneNumber:phoneNumber gender:gender age:age remarks:remarks ]autorelease];
    return linkMan;
}
- (void)dealloc{
    [_name release],              _name = nil;
    [_phoneNumber release],_phoneNumber = nil;
    [_gender release],          _gender = nil;
    [_remarks release],        _remarks = nil;
    [super dealloc];
}
@end
