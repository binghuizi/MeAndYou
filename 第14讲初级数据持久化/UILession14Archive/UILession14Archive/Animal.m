//
//  Animal.m
//  UILession14Archive
//
//  Created by scjy on 15/12/17.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "Animal.h"

@implementation Animal
-(void)dealloc{
    
    [_name   release], _name   = nil;
    [_gender release], _gender = nil;
    [_age    release], _age    = nil;
    [super dealloc];
}
//将Animal进行反归档调用此方法
//反序列化（反归档）   将nsdata类型数据转换成 Animal（对象）是执行该方法
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        //创建一个新的Animal  对象的所有属性都是通过反序列化得到的
        self.name   = [aDecoder decodeObjectForKey:@"name"];
        self.gender = [aDecoder decodeObjectForKey:@"gender"];
        self.age    = [aDecoder decodeObjectForKey:@"age"];
    }
    return self;
}
//将Animal对象归档时调用此方法
//序列方法（归档）  将Animal对象转换成nsdata 执行该方法
-(void)encodeWithCoder:(NSCoder *)aCoder{
    //相对Animal对象属性归档操作 进行编码操作----序列化
    //encodeObject：将要归档的实例对象  forKey:@"name"归档后的名字
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.gender forKey:@"gender"];  //性别归档
    [aCoder encodeObject:self.age forKey:@"age"];       //年龄归档
    
}
@end
