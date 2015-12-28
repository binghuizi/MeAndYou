//
//  NetWorkEngine.m
//  UILession18NetWorkRequest
//
//  Created by scjy on 15/12/23.
//  Copyright © 2015年 scjy. All rights reserved.
//
//5.定义私有属性 用于保护用户传递过来的数据  网络请求需要的参数都初始化方法  都通过方法传递过来这些属性没必要隔开防止误操作修改属性

#import "NetWorkEngine.h"
@interface NetWorkEngine ()
@property(nonatomic,copy) NSString *urlString;//网址
@property(nonatomic,retain) NSDictionary *parameters;//参数
@property(nonatomic,assign) id<NetWorkEngineDelegate>delegate;//代理
@property(nonatomic,assign) NetWorkEngineType netWorkType;//类型

@end
@implementation NetWorkEngine
//6.完成初始化方法
+(instancetype)netWorkEngineWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters requestDelegate:(id<NetWorkEngineDelegate>)delegate httpMethodType:(NetWorkEngineType)netWokEngineType{
    
    NetWorkEngine *netWorkEngine = [[[NetWorkEngine alloc]intWithUrlString:urlString parameters:parameters requestDelegate:delegate httpMethodType:netWokEngineType ]autorelease];
    return netWorkEngine;
}
- (instancetype)intWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters requestDelegate:(id<NetWorkEngineDelegate>)delegate httpMethodType:(NetWorkEngineType)netWokEngineType{
    
    self = [super init];
    if (self) {
        _urlString = urlString;
        _parameters = parameters;
        _delegate = delegate;
        _netWorkType = netWokEngineType;
    }
    return self;
}
//7.开始网络请求
-(void)startRequestNetWork{
    //把网址字符串转换成nsurl
    NSURL *url = [NSURL URLWithString:self.urlString];
    //创建一个网络请求对象是
    NSMutableURLRequest *request = nil;//初值nil
    //判断网络类型
    if (self.netWorkType == NetWorkEngineTypeGET) {
        //gest请求
        //请求网址
        request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"GET"];//请求类型
    }else if(self.netWorkType == NetWorkEngineTypePOST){
       //10.post请求
        request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"POST"];//设置请求方式
        //配置post请求参数
        if (self.parameters) {
            [request setHTTPBody:[self parametersTransformToHTTPBody]];
        }
    }
//12.设置超时时间 超过15秒则返回请求失败  http://c.m.163.com/nc/article/AQETUMR200014OMD/full.html
    
    [request setTimeoutInterval:15.0];
    
    
    //9.在请求开始 把网络请求开始方法传给代理对象
    if (self.delegate &&[self.delegate respondsToSelector:@selector(netWorkStartLoading:)]) {
        [self.delegate netWorkStartLoading:self];
    }
    
    
    //8.异步连接实现网络请求（block）
    __block NetWorkEngine *weakEngine  = self;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //1.error存在请求失败
        if (connectionError) {
            NSLog(@"解析失败");
        }else{
          //2.
        //判断代理是否存在 并执行
        if (self.delegate && [self.delegate respondsToSelector:@selector(netWorkFinishLoading:withResponserObject:)]) {
            //3.JSON解析
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            //4.数据传给代理
            [self.delegate netWorkFinishLoading:weakEngine withResponserObject:dic];
        }
        }
    }];
    
}

 //11.把用户传递过来的post请求转换为nsdata类型
- (NSData *)parametersTransformToHTTPBody{
    NSArray *keyArry = self.parameters.allKeys;//获取字典中所有的key
    //可变数组存放所有值
    NSMutableArray *keyValueArray = [NSMutableArray new];
    for (NSString *key in keyArry) {
        NSString *pqrm = [NSString stringWithFormat:@"%@=%@",key,self.parameters[key]];
        [keyValueArray addObject:pqrm];
    }
    //拼接&
    NSString *paramster = [keyValueArray componentsJoinedByString:@"&"];
    //把字符串转nadata
    NSData *httpBodyData = [paramster dataUsingEncoding:NSUTF8StringEncoding];
    return httpBodyData;

}



@end
