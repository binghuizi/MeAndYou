//
//  MangoViewController.m
//  UILession14SimpleData
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

    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    self.title = @"初级数据持久化";
//沙盒路径 NSString *path = NSHomeDirectory();
//    NSString *homePath = NSHomeDirectory();
//    NSLog(@"%@",NSHomeDirectory());
#pragma mark ------获取沙河中子文件夹方式 拼接路径
////获取沙河中子文件夹方式 拼接路径
//    NSString *documents = [homePath stringByAppendingString:@"/Documents"];
//    NSLog(@"%@",documents);
//
// //  Library
//    NSString *library = [homePath stringByAppendingString:@"/Library"];
//   NSLog(@"%@",library);
    
 //
#pragma mark----通过函数获取路径
//获取Documents路径
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
//
//    NSLog(@"documentPath = %@",documentPath);
////获取Library
//    NSString *libraryPath = [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)lastObject];
//    NSLog(@"libraryPath = %@",libraryPath);
////Caches
    NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)lastObject];
//    NSLog(@"cachesPath = %@",cachesPath);
////tmp
//    NSString *tmpPath = NSTemporaryDirectory();
//    NSLog(@"tmpPath = %@",tmpPath);
// //应用程序路径
//    NSString *bundlePath = [[NSBundle mainBundle]resourcePath];
//    NSLog(@"%@",bundlePath);
#pragma mark --------简单文件的写入/读取
   /*简单数据对象 字典 字符串 数组 nsdata nsset集合
    简单数据写入文件中在村道沙盒文件夹里 
    NSdata 用于存储二进制数据
    */
#pragma mark  字符串对象读取/写入
//1.创建字符串对象
    NSString *shi = @"水调歌头·丙辰中秋 \n明月几时有？把酒问青天。\n不知天上宫阙，今夕是何年。\n我欲乘风归去，又恐琼楼玉宇，\n高处不胜寒。\n起舞弄清影，何似在人间？\n转朱阁，低绮户，照无眠。\n不应有恨，何事长向别时圆？\n人有悲欢离合，月有阴晴圆缺，\n此事古难全。\n但愿人长久，千里共婵娟。";
//2.字符串存储路径
    NSString *strPath = [documentPath stringByAppendingString:@"/text.txt"];
//3.将文件写入指定路径
    [shi writeToFile:strPath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    NSLog(@" %@",strPath);
//读取txt stringWithContentsOfFile:
    NSString *readText = [NSString stringWithContentsOfFile:strPath encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"%@",readText);

#pragma mark ----数组写入/读取
//1.构造数组对象
    NSMutableArray *starArray = [NSMutableArray arrayWithObjects:@"宝马",@"凯迪拉克",@"宝马",@"凯迪拉克", nil];
    NSString *arrayPath = [documentPath stringByAppendingPathComponent:@"/array.plist"];
//2.写入数组
    //
    NSLog(@"%@",arrayPath);
//数组添加新元素
    [starArray addObject:@"保时捷"];
//写入数组
    [starArray writeToFile:arrayPath atomically:YES];
    
//读取arrayWithContentsOfFile
    NSArray *readArray = [NSArray arrayWithContentsOfFile:arrayPath];
    NSLog(@"%@",readArray);
 #pragma mark ----字典写入/读取 
//1.构造字典对象
    NSDictionary *dic = @{@"name":@"小花",@"age":@"18",@"sex":@"女",@"hoppy":@[@"旅游",@"玩儿"]};
//2.保存数组
    NSString *dicPath = [documentPath stringByAppendingPathComponent:@"dic.plist"];
//3.写入
    [dic writeToFile:dicPath atomically:YES];
    NSLog(@"%@",dicPath);
    
//读取
    NSDictionary *readDic = [NSDictionary dictionaryWithContentsOfFile:dicPath];
    NSLog(@"%@",readDic);
    
 #pragma mark ----二进制写入/读取  
    //1.创建图片
    UIImage *image =[UIImage imageNamed:@"1.jpg"];
    //2.图片转化成二进制
    NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
    //3.构造NSData文件的存储路径
    NSString *imagePath = [documentPath stringByAppendingPathComponent:@"/data.da"];
    //4.写入
    [imageData writeToFile:imagePath atomically:YES];
    NSLog(@"%@",imagePath);
    //5.读取
    UIImage *readImage = [UIImage imageWithContentsOfFile:imagePath];
    NSLog(@"%@",readImage);
    //练习四
    NSString *downImagePath = [cachesPath stringByAppendingPathComponent:@"/DownLoadImagees"];
    NSLog(@"%@",downImagePath);
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
