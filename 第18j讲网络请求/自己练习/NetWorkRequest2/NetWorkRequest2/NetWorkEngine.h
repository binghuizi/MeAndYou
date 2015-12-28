//
//  NetWorkEngine.h
//  NetWorkRequest2
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
- (void)netWorkStartLoading:(NetWorkEngine *)netWorkEngine;
- (void)networkFinshLoading:(NetWorkEngine *)netWorkEngine withResponserObject:(id)responserObject;

@end
@interface NetWorkEngine : NSObject
+(instancetype)netWorkEngineWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters requeseDelegate:(id<NetWorkEngineDelegate>)delegate httpMethodType:(NetWorkEngineType)netWorkType;
-(void)startRequestNetWork;//开始网络请求
@end
