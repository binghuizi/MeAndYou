//
//  NetWorkEngine.m
//  NetWorkRequest
//
//  Created by scjy on 15/12/23.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "NetWorkEngine.h"
@interface NetWorkEngine()
//5.创建属性
@property(nonatomic,copy) NSString *urlString;//网址
@property(nonatomic,retain) NSDictionary *paramenters;//参数
@property(nonatomic,assign) id<NetWorkEngineDelegate>delegate;//代理
@property(nonatomic,assign) NetWorkEngineType netWorkType;//类型

@end
@implementation NetWorkEngine
//6.完成初始化方法
+(instancetype)netWorkEngineWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters requestDelegate:(id<NetWorkEngineDelegate>)delegate httpMethodType:(NetWorkEngineType)netWorkEngineType{
    NetWorkEngine *netWorkEngine = [[[NetWorkEngine alloc]initWithUrlString:urlString parameters:parameters requestDelegate:delegate httpMethodType:netWorkEngineType ]autorelease];
    return netWorkEngine;
}
-(instancetype)initWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters requestDelegate:(id<NetWorkEngineDelegate>)delegate httpMethodType:(NetWorkEngineType)netWorkEngineType{
    self = [super self];
    if (self) {
        _urlString = urlString;
        _paramenters = parameters;
        _delegate = delegate;
        _netWorkType = netWorkEngineType;
    }
    return self;
}
//7.开始网络请求
-(void)startRequestNetWork{
    //把网址字符串转化成nsURL
    NSURL *url = [NSURL URLWithString:self.urlString];
    //创建一个网络请求对象
    NSMutableURLRequest *request = nil;
    //判断网络类型
    if (self.netWorkType == NetWorkEngineTypeGET) {
        request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"GET"];
    }else if (self.netWorkType == NetWorkEngineTypePOST){
//10.post请求
        request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"POST"];
       //配置post请求参数
        if (self.paramenters) {
            [request setHTTPBody:[self paramentersTransformToHTTPBody]];
        }
    }
    //12.设置超时 超时15秒之后 返回请求失败
    [request setTimeoutInterval:15.0];
    //9.在请求开始 把网络请求开始方法传给代理对象
    if (self.delegate &&[self.delegate respondsToSelector:@selector(netWorkStartLoading:)]) {
        [self.delegate netWorkStartLoading:self];
    }
    
    //8.异步连接网络请求（block）
    __block NetWorkEngine *weakEngine = self;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            NSLog(@"解析失败");
        }else{
            //判断代理
            if (self.delegate && [self.delegate respondsToSelector:@selector(netWorkFinishLoading:withResponeserObject:)]) {
                //json解析
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
               //数据传给代理
                [self.delegate netWorkFinishLoading:weakEngine withResponeserObject:dic];
            }
        }
        
    }];
    
}
//用户传递过来的post请求转换问nsdata类型
-(NSData *)paramentersTransformToHTTPBody{
    NSArray *keyArry = self.paramenters.allKeys;//字典中所有key
    NSMutableArray *keyValueArry = [NSMutableArray new];
    for (NSString *key in keyArry) {
        NSString *pqrm = [NSString stringWithFormat:@"%@=%@",key,self.paramenters[key]];
        [keyValueArry addObject:pqrm];
    }
    //拼接&
    NSString *paramster = [keyValueArry componentsJoinedByString:@"&"];
    //把字符串转换成nsdata
    NSData *httpBodyData = [paramster dataUsingEncoding:NSUTF8StringEncoding];
    return httpBodyData;
}
@end
