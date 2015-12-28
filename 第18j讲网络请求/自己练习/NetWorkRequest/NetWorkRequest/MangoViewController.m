//
//  MangoViewController.m
//  NetWorkRequest
//
//  Created by scjy on 15/12/23.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "MangoViewController.h"
#import "NetWorkEngine.h"
@interface MangoViewController ()<NetWorkEngineDelegate>

@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NetWorkEngine *netWorkEngine = [NetWorkEngine netWorkEngineWithUrlString:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx?" parameters:@{@"date":@"20131129",@"startRecord":@"1",@"len":@"5",@"udid":@"1234567890",@"terminalType":@"Iphone",@"cid":@"213"} requestDelegate:self httpMethodType:NetWorkEngineTypePOST];
    [netWorkEngine startRequestNetWork];
    
    
    
    
}
-(void)netWorkStartLoading:(NetWorkEngine *)netWorkEngine{
    NSLog(@"网络请求开始");
}
-(void)netWorkFinishLoading:(NetWorkEngine *)netWorkEngine withResponeserObject:(id)responeserObject{
    NSLog(@"%@",responeserObject);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
