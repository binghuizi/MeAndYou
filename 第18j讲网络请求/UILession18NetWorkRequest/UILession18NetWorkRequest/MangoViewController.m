//
//  MangoViewController.m
//  UILession18NetWorkRequest
//
//  Created by scjy on 15/12/23.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "MangoViewController.h"
#import "NetWorkEngine.h"//1.引入头文件
@interface MangoViewController ()<NetWorkEngineDelegate>//2.遵循协议

@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    self.navigationItem.title = @"网路编程";
    
//    NetWorkEngine *netWorkEngine = [NetWorkEngine netWorkEngineWithUrlString:@"http://c.m.163.com/nc/article/AQETUMR200014OMD/full.html" parameters:nil requestDelegate:self httpMethodType:NetWorkEngineTypeGET];
//    [netWorkEngine startRequestNetWork];
    
    NetWorkEngine *netWorkEngine = [NetWorkEngine netWorkEngineWithUrlString:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx?" parameters:@{@"date":@"20131129",@"startRecord":@"1",@"len":@"5",@"udid":@"1234567890",@"terminalType":@"Iphone",@"cid":@"213"} requestDelegate:self httpMethodType:NetWorkEngineTypePOST];
    [netWorkEngine startRequestNetWork];
    
    
    
    
}
//开始
- (void)netWorkStartLoading:(NetWorkEngine *)netWorkEngine{
    NSLog(@"网络请求开始");
}
//成功
-(void)netWorkFinishLoading:(NetWorkEngine *)netWorkEngine withResponserObject:(id)responserObject{
    NSLog(@"%@",responserObject);
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
