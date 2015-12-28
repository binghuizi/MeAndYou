//
//  NetWorkEngine.m
//  NetWorkRequest2
//
//  Created by scjy on 15/12/23.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "NetWorkEngine.h"
@interface NetWorkEngine ()
@property(nonatomic,copy)NSString *urlString;
@property(nonatomic,retain)NSDictionary *paramsters;
@property(nonatomic,assign)id<NetWorkEngineDelegate> delegate;
@property(nonatomic,assign)NetWorkEngineType netWorkType;
@end
@implementation NetWorkEngine
+(instancetype)netWorkEngineWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters requeseDelegate:(id<NetWorkEngineDelegate>)delegate httpMethodType:(NetWorkEngineType)netWorkType{
    NetWorkEngine *netWorkEngine = [[[NetWorkEngine alloc]initWithUrlString:urlString parameters:parameters requeseDelegate:delegate httpMethodType:netWorkType]autorelease];
    return netWorkEngine;
}
-(instancetype)initWithUrlString:(NSString *)urlString parameters:(NSDictionary *)parameters requeseDelegate:(id<NetWorkEngineDelegate>)delegate httpMethodType:(NetWorkEngineType)netWorkType{
    self = [super init];
    if (self) {
        _urlString = urlString;
        _paramsters = parameters;
        _delegate = delegate;
        _netWorkType = netWorkType;
    }
    return self;
}
-(void)startRequestNetWork{
    //字符串转换成nsdata
    NSURL *url = [NSURL URLWithString:self.urlString];
    NSMutableURLRequest *request = nil;
    if (self.netWorkType == NetWorkEngineTypeGET) {
        request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"GET"];
        
    }else if (self.netWorkType == NetWorkEngineTypePOST){
        request = [NSMutableURLRequest requestWithURL:url];
        [request setHTTPMethod:@"POST"];
        if (self.paramsters) {
            [request setHTTPBody:[self parametersTransformToHTTPBody]];
        }
    }
    //12
    [request setTimeoutInterval:15.0];
    //9.
    if (self.delegate && [self.delegate respondsToSelector:@selector(netWorkStartLoading:)]) {
        [self.delegate netWorkStartLoading:self];
    }
    //8.
    __block NetWorkEngine *weakEngine = self;
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (connectionError) {
            NSLog(@"解析失败");
        }else{
            if (self.delegate && [self.delegate respondsToSelector:@selector(networkFinshLoading:withResponserObject:)]) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                [self.delegate networkFinshLoading:weakEngine withResponserObject:dic];
            }
        }
    }];
    
}
- (NSData *)parametersTransformToHTTPBody{
    NSArray *keyArry = self.paramsters.allKeys;
    NSMutableArray *keyValueArray = [NSMutableArray new];
    for (NSString *key in keyArry) {
        NSString *pqrm = [NSString stringWithFormat:@"%@=%@",key,self.paramsters[key]];
        [keyValueArray addObject:pqrm];
        
    }
    NSString *paramster = [keyValueArray componentsJoinedByString:@"&"];
    NSData *httpBodyData = [paramster dataUsingEncoding:NSUTF8StringEncoding];
    return httpBodyData;
}
@end
