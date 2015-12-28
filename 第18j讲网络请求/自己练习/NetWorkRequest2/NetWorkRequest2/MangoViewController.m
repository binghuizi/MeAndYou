
//
//  MangoViewController.m
//  NetWorkRequest2
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
    
//        NetWorkEngine *netWorkEngine = [NetWorkEngine netWorkEngineWithUrlString:@"http://c.m.163.com/nc/article/AQETUMR200014OMD/full.html" parameters:nil requestDelegate:self httpMethodType:NetWorkEngineTypeGET];
//        [netWorkEngine startRequestNetWork];
    
    NetWorkEngine *netWorkEngine = [NetWorkEngine netWorkEngineWithUrlString:@"http://c.m.163.com/nc/article/AQETUMR200014OMD/full.html" parameters:nil requeseDelegate:self httpMethodType:NetWorkEngineTypeGET];
    [netWorkEngine startRequestNetWork];
}
-(void)netWorkStartLoading:(NetWorkEngine *)netWorkEngine{
    NSLog(@"开始");
}
-(void)networkFinshLoading:(NetWorkEngine *)netWorkEngine withResponserObject:(id)responserObject{
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
