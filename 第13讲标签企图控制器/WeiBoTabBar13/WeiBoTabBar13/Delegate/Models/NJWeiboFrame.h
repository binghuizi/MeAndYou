//
//  NJWeiboFrame.h
//  WeiBoTabBar13
//
//  Created by scjy on 15/12/14.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class NJWeibo;
@interface NJWeiboFrame : NSObject
//保存每一行数据 计算高度
@property(nonatomic,assign)CGRect iconF;//头像
@property(nonatomic,assign)CGRect nameF;//昵称
@property(nonatomic,assign)CGRect vipF;//VIP
@property(nonatomic,assign)CGRect introF;//文本
@property(nonatomic,assign)CGRect pictrueF;//发表图片
@property(nonatomic,assign)CGFloat cellHeight;//行高
@property(nonatomic,strong)NJWeibo *weibo;//微博
@end
