//
//  MangoModel.h
//  UILession11UITableViewCell
//
//  Created by scjy on 15/12/2.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MangoModel : NSObject
//数据模型model元素要和将要转化的模型 类型保持一致
@property(nonatomic,retain) NSString *carName;//车名
@property(nonatomic,retain) NSString *carIntruduce;//介绍
@property(nonatomic,retain) NSString *carImage;//车标
//定义一个公开的方法把外部的字典传进来进行加工
- (instancetype) initWithDictionary:(NSDictionary *)dict;

@end
