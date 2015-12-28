//
//  MangoSingleTon.h
//  UILession11SingleTon
//
//  Created by scjy on 15/12/3.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MangoSingleTon : NSObject
@property(nonatomic,retain) NSString *inputText;
//1.定义单利方法  单利方法必须是类方法 返回值是这个类本身  保证程序只有一个对象存在

+ (MangoSingleTon *)sharedInstance;

@end
