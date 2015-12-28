//
//  MangoViewController.m
//  UILession17XMLParser
//
//  Created by scjy on 15/12/22.
//  Copyright © 2015年 scjy. All rights reserved.
//
#define kWidth self.view.frame.size.width
#import "MangoViewController.h"
#import "GDataXMLNode.h"
@interface MangoViewController ()
@property(nonatomic,retain) UIButton *saxXMLParserbtn;
@property(nonatomic,retain) UIButton *domXMLParserbtn;
@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.view.backgroundColor= [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    self.title = @"XML数据解析";
    
    [self.view addSubview:self.saxXMLParserbtn];
    [self.view addSubview:self.domXMLParserbtn];
}
-(UIButton *)saxXMLParserbtn{
    if (_saxXMLParserbtn == nil) {
        self.saxXMLParserbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.saxXMLParserbtn.frame = CGRectMake(30, 100, self.view.frame.size.width - 60, 44);
        self.saxXMLParserbtn.backgroundColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.5 alpha:1.0];
        [self.saxXMLParserbtn setTitle:@"saxXMLParserbtn" forState:UIControlStateNormal];
       
        self.saxXMLParserbtn.tag = 100;
        
        
        [self.saxXMLParserbtn addTarget:self action:@selector(didAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _saxXMLParserbtn;
}


-(UIButton *)domXMLParserbtn{
    if (_domXMLParserbtn == nil) {
        self.domXMLParserbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.domXMLParserbtn.frame = CGRectMake(30, 200, self.view.frame.size.width - 60, 44);
        self.domXMLParserbtn.backgroundColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.5 alpha:1.0];
        [self.domXMLParserbtn setTitle:@"domXMLParserbtn" forState:UIControlStateNormal];
        self.domXMLParserbtn.tag = 200;
        
        
        [self.domXMLParserbtn addTarget:self action:@selector(didAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _domXMLParserbtn;
    }


- (void)didAction:(UIButton *)btn{
    //1.查找XML文件
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"Students" ofType:@".xml"];
    //2.nsdata读取
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    if (btn.tag == 100) {
        //sax方式解析XML格式  NSXMLParser ios自带的类
        //3.创建XML解析类
        NSXMLParser *xmlPareser = [[NSXMLParser alloc]initWithData:data];
       //4.代理
        xmlPareser.delegate = self;
        //解析
      BOOL result = [xmlPareser parse];
        if (result) {
            NSLog(@"解析成功");
        }else{
            NSLog(@"解析失败");
        }
    }else if (btn.tag == 200){
      
        //dom解析 1.将XML文档读取 在内存中形成wanzhengde树形结构 基于C语言库实现的因此在过程中引入libxml.tdb的文件库
        //2.在bulid setting的header search中 添加/usr/include/libxml2路径
        //3.读取XML格式的字符串
        GDataXMLDocument *xmlDocument = [[GDataXMLDocument alloc]initWithData:data options:0 error:nil];
        //4.找到根节点 需要
        GDataXMLElement *rootElement = [xmlDocument rootElement];//
       // NSLog(@"%@",rootElement);
        //5.找到根节点下边的所有的子节点 elementsForName
     NSArray *studentArray = [rootElement elementsForName:@"student"];
        NSLog(@"%@",studentArray);
       
        NSMutableArray *allStudentArray = [NSMutableArray new];//
        //6.遍历出每个节点 for循环
        for (int i = 0; i < studentArray.count; i++) {
            GDataXMLElement *stuElement = studentArray[i];
            NSLog(@"%@",stuElement);
            //7.取出student节点下的子节点 包括number name sex phone
//1.取student下所有节点number
            NSArray *numberArray = [stuElement elementsForName:@"number"];
            //2.
            GDataXMLElement *numberElement = numberArray[0];//number节点在student节点下只有一个
            //3.把number节点的数据转换成字符串
            NSString *number = [numberElement stringValue];
            NSLog(@"%@",number);
//取出student下所有name节点
            NSArray *nameArray = [stuElement elementsForName:@"name"];
            GDataXMLElement *nameElement = nameArray[0];
            NSString *name = [nameElement stringValue];
            NSLog(@"%@",name);
//取出student下所有sex节点
            NSArray *sexArray = [stuElement elementsForName:@"sex"];
            GDataXMLElement *sexElement = sexArray[0];
            NSString *sex = [sexElement stringValue];
            NSLog(@"%@",sex);
        
//取出student下所有phone节点
            NSArray *phoneArray = [stuElement elementsForName:@"phone"];
            GDataXMLElement *phoneElement = phoneArray[0];
            NSString *phone = [phoneElement stringValue];
            NSLog(@"%@",phone);
            NSDictionary *stuDic = @{@"number":number,@"name":name,@"sex":sex,@"phone":phone};
            
            [allStudentArray addObject:stuDic];
            NSLog(@"%@",allStudentArray);
        
        
        
        }
        
        
        
    }
    
    
    
    
    
}
#pragma mark ----xml 代理方法

- (void)parserDidStartDocument:(NSXMLParser *)parser{
    NSLog(@"文件开始解析调用");
    NSLog(@"%s",__FUNCTION__);
}
//解析玩完之后运行
- (void)parserDidEndDocument:(NSXMLParser *)parser{
    NSLog(@"解析玩完之后运行");
    NSLog(@"%s",__FUNCTION__);
}
//系统解析
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    NSLog(@"%@ %@",elementName,attributeDict);
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    NSLog(@"%@",qName);
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    NSLog(@"%@",string);
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
