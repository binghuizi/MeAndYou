//
//  NSArray+EasyLog.m
//  OC-LessionSeven
//
//  Created by scjy on 15/11/11.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "NSArray+EasyLog.h"

@implementation NSArray (EasyLog)

-(NSString *)descriptionWithLocale:(id)locale{   //self.count数组个数   字符串无符号长整型unsigned long
    NSMutableString *str = [NSMutableString stringWithFormat:@"%lu(\n",(unsigned long)self.count];
    for (id obj in self) {
        [str appendFormat:@"\t %@,\n",obj];// \t 前进四格
    }
    [str appendFormat:@")"];
    return str;
}
-(void)PrintArrayCount{
    NSLog(@"当前数组元素个数：%lu",self.count);
}
@end
