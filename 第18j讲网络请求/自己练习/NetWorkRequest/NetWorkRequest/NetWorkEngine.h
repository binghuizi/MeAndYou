//
//  NetWorkEngine.h
//  NetWorkRequest
//
//  Created by scjy on 15/12/23.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum {
    NetWorkEngineTypeGET,
    NetWorkEngineTypePOST,
    NetWorkEngineTypePUT,
    NetWorkEngineTypeDELETE
}NetWorkEngineType;
@class NetWorkEngine;
@protocol NetWorkEngineDelegate <NSObject>
//1.网络请求开始
- (void)netWorkStartLoading:(NetWorkEngine *)netWorkEngine;
//2.网络请求结束
- (void)netWorkFinishLoading:(NetWorkEngine *)netWorkEngine withResponeserObject:(id)responeserObject;

@end
@interface NetWorkEngine : NSObject
//3.创建初始化方法 闯入网络请求必要条件
+(instancetype)netWorkEngineWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters requestDelegate:(id<NetWorkEngineDelegate>)delegate httpMethodType:(NetWorkEngineType)netWorkEngineType;
//4.开始网络请求
- (void)startRequestNetWork;
@end
