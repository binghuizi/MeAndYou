//
//  NetWorkEngine.h
//  UILession18NetWorkRequest
//
//  Created by scjy on 15/12/23.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <Foundation/Foundation.h>
//3.创建网络请求类型的枚举
typedef enum {
     NetWorkEngineTypeGET,
     NetWorkEngineTypePOST,
     NetWorkEngineTypePUT,
     NetWorkEngineTypeDELETE
}NetWorkEngineType;

@class NetWorkEngine;//有这样的类 不需要编译 import会编译
//1.创建网络请求代理
@protocol NetWorkEngineDelegate <NSObject>
//1.网络请求开始
- (void)netWorkStartLoading:(NetWorkEngine *)netWorkEngine;
//网络请求结束
-(void)netWorkFinishLoading:(NetWorkEngine *)netWorkEngine withResponserObject:(id)responserObject;
@end
@interface NetWorkEngine : NSObject
//2.创建初始化方法传入网络请求必要条件 1参数网络请求的网址 2参数post的类型需要传入的参数列表 3参数遵循网络请求协议的类 4参数网络请求的类型
+ (instancetype)netWorkEngineWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters requestDelegate:(id<NetWorkEngineDelegate>)delegate httpMethodType:(NetWorkEngineType)netWokEngineType;

//4.开始网络请求
-(void)startRequestNetWork;


@end
