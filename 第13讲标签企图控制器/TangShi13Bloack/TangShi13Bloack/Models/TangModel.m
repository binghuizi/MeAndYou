//
//  TangModel.m
//  TangShi13Bloack
//
//  Created by scjy on 15/12/7.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "TangModel.h"

@implementation TangModel
-(instancetype)initWithDic:(NSDictionary *)dic{
    [self setValuesForKeysWithDictionary:dic];
    return self;
}
+(instancetype)tangShiWithDic:(NSDictionary *)dic{
    return [[self alloc]initWithDic:dic];
}

+(TangModel *)allInfors{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"tangshi" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    TangModel *model = [self tangShiWithDic:dic];
    return model;
}
+(NSMutableArray *)allInfo{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"tangshi" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    TangModel *model = [self tangShiWithDic:dic];
    NSMutableArray *array = [NSMutableArray new];
    for (NSString *str in model.index) {
        NSMutableArray *array2 = [NSMutableArray new];
        array2 = model.index[str];
        [array addObject:array2];
    }
    return array;
}
    









@end
