//
//  NJWeibo.m
//  WeiBoTabBar13
//
//  Created by scjy on 15/12/14.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "NJWeibo.h"

@implementation NJWeibo
-(id)initWithDic:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(id)weiboWithDic:(NSDictionary *)dict{
    return [[self alloc]initWithDic:dict];
}
@end
