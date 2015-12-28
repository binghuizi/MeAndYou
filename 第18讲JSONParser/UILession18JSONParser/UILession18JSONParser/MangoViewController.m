//
//  MangoViewController.m
//  UILession18JSONParser
//
//  Created by scjy on 15/12/23.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "MangoViewController.h"
#import "JSONKit.h"
@interface MangoViewController ()
@property(nonatomic,retain) UIButton *jsonParserbtn;
@property(nonatomic,retain) UIButton *jsonKitParserbtn;
@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor= [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    self.title = @"JSON数据解析";
    
    [self.view addSubview:self.saxXMLParserbtn];
    [self.view addSubview:self.domXMLParserbtn];
}
-(UIButton *)saxXMLParserbtn{
    if (_jsonParserbtn == nil) {
        self.jsonParserbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.jsonParserbtn.frame = CGRectMake(30, 100, self.view.frame.size.width - 60, 44);
        self.jsonParserbtn.backgroundColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.5 alpha:1.0];
        [self.jsonParserbtn setTitle:@"系统json解析" forState:UIControlStateNormal];
        
        self.jsonParserbtn.tag = 100;
        
        
        [self.jsonParserbtn addTarget:self action:@selector(didJSONParserAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jsonParserbtn;
}

-(UIButton *)domXMLParserbtn{
    if (_jsonKitParserbtn == nil) {
        self.jsonKitParserbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.jsonKitParserbtn.frame = CGRectMake(30, 200, self.view.frame.size.width - 60, 44);
        self.jsonKitParserbtn.backgroundColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.5 alpha:1.0];
        [self.jsonKitParserbtn setTitle:@"jsonKIT-JSON解析" forState:UIControlStateNormal];
        self.jsonKitParserbtn.tag = 200;
        
        
        [self.jsonKitParserbtn addTarget:self action:@selector(didJSONParserAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jsonKitParserbtn;
}

- (void)didJSONParserAction:(UIButton *)btn{
   //1.本地读取文件
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"Student" ofType:@".txt"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    //oc数据通过 json解析成 nsdata类型
    NSDictionary *dic1 = @{@"name":@"赵佳慧",@"age":@"23",@"gender":@"女"};
    NSDictionary *dic2 = @{@"name":@"找开放",@"age":@"20",@"gender":@"男"};
    NSDictionary *dic3 = @{@"name":@"赵风顺",@"age":@"16",@"gender":@"男"};
    NSArray *array = @[dic1,dic2,dic3];
    //把json格式 解析成nsdata类型
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:nil];

    if (btn.tag == 100) {
        //使用系统提供的类的进行JSON解析
        //实质JSON格式字符串和oc数据对象的转转换JSON格式字符串和oc中的数据进行相互转化
        //将JSON和格式的字符串-转换为oc数据
        //2.将data类型数据转换成oc的数据
        NSArray *allStudentArry = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
      //  NSLog(@"%@",allStudentArry);
       
        
        
        for (NSDictionary *key in allStudentArry) {
                NSLog(@"%@",key[@"name"]);
        }
        
        
      NSString *jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
       NSLog(@"%@",jsonString);
    
    
    }else if (btn.tag == 200){
        NSArray *studentArray = [data objectFromJSONData];
        NSLog(@"%@",studentArray);
        //通过nadata进行转化为json数据
        //2.通过字符串类型进行json数据转化 通过 把json类型字符串转化为nsstring类型字符串
        NSString *str = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        
        NSArray *stus = [str objectFromJSONString];
        NSLog(@"%@",stus);
   
    //oc数据对象转换json数据格式
        
        NSString *jsonStr = [array JSONString];
        NSLog(@"%@",jsonStr);
    
    
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
