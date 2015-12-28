//
//  MangoSingleTon.m
//  UILession11SingleTon
//
//  Created by scjy on 15/12/3.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "MangoSingleTon.h"

@implementation MangoSingleTon
//2.静态单利类的实例 并初始化设置为nil
static MangoSingleTon *mango = nil;
//3.实例构造 检查静态实例对象是否为空
+ (MangoSingleTon *)sharedInstance{
    //4.若为空 创建一个新的对象
    if (mango == nil) {
        mango = [[MangoSingleTon alloc]init];
    }
    return mango;
}
@end
