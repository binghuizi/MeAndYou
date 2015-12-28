//
//  NJWeibo.h
//  WeiBoTabBar13
//
//  Created by scjy on 15/12/14.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NJWeibo : NSObject
@property(nonatomic,retain) NSString *text;//内容
@property(nonatomic,retain) NSString *icon;//头像
@property(nonatomic,retain) NSString *name;//昵称
@property(nonatomic,retain) NSString *picture;//配图
@property(nonatomic,assign) BOOL vip;//是否是vip

- (id)initWithDic:(NSDictionary *)dict;
+ (id)weiboWithDic:(NSDictionary *)dict;

@end
