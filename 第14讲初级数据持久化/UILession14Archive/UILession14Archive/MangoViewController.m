//
//  MangoViewController.m
//  UILession14Archive
//
//  Created by scjy on 15/12/17.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "MangoViewController.h"
#import "Animal.h"
@interface MangoViewController ()

@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    //归档按钮
    UIButton *archiveBtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    archiveBtn1.frame = CGRectMake(30, 100, [UIScreen mainScreen].bounds.size.width - 60, 44);
    
    [archiveBtn1 setTitle:@"归档" forState:UIControlStateNormal];
    
    archiveBtn1.backgroundColor = [UIColor brownColor];
    
    [archiveBtn1 addTarget:self action:@selector(dicarchAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    archiveBtn1.tag = 1;
    
    [self.view addSubview: archiveBtn1];

    
    UIButton *unArchiveBtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    unArchiveBtn2.frame = CGRectMake(30, 200, [UIScreen mainScreen].bounds.size.width - 60, 44);
    
    [unArchiveBtn2 setTitle:@"反归档" forState:UIControlStateNormal];
    unArchiveBtn2.backgroundColor = [UIColor brownColor];
    [unArchiveBtn2 addTarget:self action:@selector(dicarchAction:) forControlEvents:UIControlEventTouchUpInside];
    
    unArchiveBtn2.tag = 2;
    
    [self.view addSubview: unArchiveBtn2];
    
    
    
    
    
}
//两个按钮实现同一个方法   区分哪一个按钮触发该方法   通过tag值来区分
//归档序列化类十余压缩文件
//2.把符合条件的对象转化成nsdata对象
//3.能进行归档的对象必须遵循NSCoding协议 对象的属性  如若是对象类型也必须遵循NSCoding协议

- (void)dicarchAction:(UIButton *)btn{
    switch (btn.tag) {
        case 1:
            NSLog(@"归档");
            break;
        case 2:
            NSLog(@"反归档");
            break;
        default:
            break;
    
   
            
    
    }
    if (btn.tag == 1) {
        //复杂对象归档  创建Animal对象
        Animal *mango = [[Animal alloc]init];
        mango.name = @"a";
        mango.gender = @"dv";
        mango.age = @"11";
        //2.创建归档工具对象
        NSMutableData *data = [NSMutableData data];
        NSKeyedArchiver *archive = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
        //3.对Anial对象归档操作
        [archive encodeObject:mango forKey:@"mango"];
        //4.结束归档
        [archive finishEncoding];
        NSLog(@"%@",data);
        //5.将归档得到的对象存储到沙河   Documents路径
        NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
        //6. 构造NSData文件的存储路径
        NSString *strPath = [documentPath stringByAppendingPathComponent:@"mang.da"];
        NSLog(@"%@",strPath);
        [data writeToFile:strPath atomically:YES ];
        [mango release];
    }else{
    
    //1.从沙盒中读取归档data数据
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
   //2.获取NSData文件的存储路径
    NSString *strPath = [documentPath stringByAppendingPathComponent:@"mang.da"];
    //3.通过文件路径 转换成NSData类型数据
    NSData *data = [NSData dataWithContentsOfFile:strPath];
    //4.创建反归档对象
    NSKeyedUnarchiver *un = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    Animal *animal = [un decodeObjectForKey:@"mango"];
    //4.结束
        [un finishDecoding];
        NSLog(@"%@ %@",animal.name,animal.gender);
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
