//
//  Animal.h
//  UILession14Archive
//
//  Created by scjy on 15/12/17.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject<NSCoding>

@property(nonatomic,copy) NSString *name;     //名字
@property(nonatomic,copy) NSString *gender;  //性别
@property(nonatomic,copy) NSString *age;    //年龄

@end
