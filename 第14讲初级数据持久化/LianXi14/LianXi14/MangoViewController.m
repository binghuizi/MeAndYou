//
//  MangoViewController.m
//  LianXi14
//
//  Created by scjy on 15/12/8.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "MangoViewController.h"

@interface MangoViewController ()

@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"初级数据持久化";
//沙盒路径  字符串形式
    NSString *homePath = NSHomeDirectory();
#pragma mark ---获取沙盒中子文件夹方式   拼接路径
//Documents
    NSString *documents = [homePath stringByAppendingString:@"/Documents"];
//
    NSString *library = [homePath stringByAppendingString:@"/Library"];
#pragma mark -------通过函数获取路径
//Documents路径
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES)lastObject];
//Library路径
    NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)lastObject];
//Caches路径
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
//temPath路径
    NSString *temPath = NSTemporaryDirectory();
//应用程序路径
    NSString *bundlePath = [[NSBundle mainBundle]resourcePath];
#pragma mark -------简单文件的写入/读取
//1.创建字符串
    NSString *shi = @"但愿人长久，千里共婵娟";
//2.字符串存储路径
    NSString *strPath = [documentPath stringByAppendingString:@"/text.txt"];
//3.将文件写入指定路径
    [shi writeToFile:strPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
//读取txt
    NSString *readText = [NSString stringWithContentsOfFile:strPath encoding:NSUTF8StringEncoding error:nil];
#pragma mark ------ 数组的写入/读取
//1.构造数组对象
    NSMutableArray *starArray = [NSMutableArray arrayWithObjects:@"宝马",@"保时捷",@"凯迪拉克", nil];
    NSString *arrayPath = [documentPath stringByAppendingPathComponent:@"/array.plist"];
//添加新元素
    [starArray addObject:@"东风日产"];
//2.写入数组
    [starArray writeToFile:arrayPath atomically:YES];
//读取数组
    NSArray *readArray = [NSArray arrayWithContentsOfFile:arrayPath];
#pragma mark -----字典写入/读取
//1.构造字典
    NSDictionary *dic = @{@"姓名":@"小花",@"age":@"18",@"sex":@"女",@"hoppy":@[@"旅游",@"玩儿",@"溜冰"]};
//2.保存数组
    NSString *dicPath = [documentPath stringByAppendingPathComponent:@"dic.plist"];
//3.写入
    [dic writeToFile:dicPath atomically:YES];
//读取
    NSDictionary *readdic = [NSDictionary dictionaryWithContentsOfFile:dicPath];
#pragma mark ----图片转化成二进制 写入/读取
//1.创建图片
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
//2.图片转化成二进制
    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
//3.构造NSData文件的存储路径
    NSString *imagePath = [documentPath stringByAppendingPathComponent:@"/data.da"];
//4.写入
    [imageData writeToFile:imagePath atomically:YES];
//5.读取
    UIImage *readImage = [UIImage imageWithContentsOfFile:imagePath];
//练习四
    NSString *downImagePath = [cachesPath stringByAppendingPathComponent:@"/DownLoadImages"];
    

    
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
