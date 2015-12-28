//
//  MangoViewController.m
//  ArchiveLianXi
//
//  Created by scjy on 15/12/17.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "MangoViewController.h"
#import "People.h"
@interface MangoViewController ()

@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
//归档按钮
    UIButton *archiveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    archiveBtn.frame = CGRectMake(30, 100, [UIScreen mainScreen].bounds.size.width - 60, 50);
    archiveBtn.backgroundColor = [UIColor brownColor];
    [archiveBtn setTitle:@"归档" forState:UIControlStateNormal];
    [archiveBtn addTarget:self action:@selector(didAcvtion:) forControlEvents:UIControlEventTouchUpInside];
    archiveBtn.tag  = 1;
    [self.view addSubview:archiveBtn];
//反归档按钮
    UIButton *unArchiveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    unArchiveBtn .frame = CGRectMake(30, 200, [UIScreen mainScreen].bounds.size.width - 60, 50);
    unArchiveBtn .backgroundColor = [UIColor brownColor];
    [unArchiveBtn  setTitle:@"反归档" forState:UIControlStateNormal];
    [unArchiveBtn addTarget:self action:@selector(didAcvtion:) forControlEvents:UIControlEventTouchUpInside];
    unArchiveBtn.tag = 2;
    [self.view addSubview:unArchiveBtn ];



}
- (void)didAcvtion:(UIButton *)btn{
    if (btn.tag == 1) {
//复杂对象归档
//1.创建对象
        People *people = [[People alloc]init];
        people.name = @"凯迪拉克";
        people.gender = @"男";
        people.age = @"18";
//2.创建归档工具对象
        NSMutableData *data = [NSMutableData data];
        NSKeyedArchiver *archive = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
//对people进行归档操作
        [archive encodeObject:people forKey:@"people"];
//4.结束归档
        [archive finishEncoding];
//5.将归档得到的对象存储的沙盒
  //document路径
        NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
        
//构造nsdata文件存储路径
        NSString *dataPath = [documentPath stringByAppendingPathComponent:@"people.da"];
        NSLog(@"%@",dataPath);
        NSLog(@"data = %@",data);
//将创建的文件 写入创建的data
        [data writeToFile:dataPath atomically:YES];
        [people release];
        [archive release];
        
    }else{
        //反归档  相当于取数据 nsdata转换成对象
//1.找document路径
        NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
//2.创建nadada路径
        NSString *dataPath = [documentPath stringByAppendingPathComponent:@"people.da"];
//3.通过文件的路径 转换成nsdata型
        NSData *data = [NSData dataWithContentsOfFile:dataPath];
//创建反归档对象
        NSKeyedUnarchiver *unArchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        People *people = [unArchiver decodeObjectForKey:@"people"];
//4.结束
        [unArchiver finishDecoding];
        NSLog(@"%@",people.name);
    }
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
