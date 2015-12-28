//
//  TangModel.h
//  TangShi13Bloack
//
//  Created by scjy on 15/12/7.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TangModel : NSObject
@property(nonatomic,retain) NSDictionary *content;
@property(nonatomic,retain) NSDictionary *index;
@property(nonatomic,retain) NSArray *section;
-(instancetype)initWithDic:(NSDictionary *)dic;
+(instancetype)tangShiWithDic:(NSDictionary *)dic;
+(TangModel *)allInfors;
+(NSMutableArray *)allInfo;

@end
