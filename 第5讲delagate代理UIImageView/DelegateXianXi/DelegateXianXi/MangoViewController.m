//
//  MangoViewController.m
//  DelegateXianXi
//
//  Created by scjy on 15/11/26.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "MangoViewController.h"

@interface MangoViewController ()
@property(nonatomic,retain) UILabel *label;
@property(nonatomic,retain) UITextField *textField;
@property(nonatomic,retain) UILabel *label2;
@property(nonatomic,retain) UITextField *textField2;
@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   //self.view.backgroundColor = [UIColor yellowColor];
    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
   self.label = [[UILabel alloc]initWithFrame:CGRectMake(30, 100, 100, 50)];
    
    self.label.text = @"用户名";
   
    
    self.textField = [[UITextField alloc]initWithFrame:CGRectMake(100, 100, 200, 30)];
    
    
    self.label2 = [[UILabel alloc]initWithFrame:CGRectMake(30, 200, 100, 50)];
    
    self.label2.text = @"密码";
    
    
   self.textField2 = [[UITextField alloc]initWithFrame:CGRectMake(100, 200, 200, 30)];
    
    
    
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.backgroundColor = [UIColor lightGrayColor];
    self.textField2.borderStyle = UITextBorderStyleRoundedRect;
    self.textField2.backgroundColor = [UIColor lightGrayColor];
    self.textField.placeholder = @"请输入用户名";
    self.textField2.placeholder = @"请输入密码";
    self.textField.textAlignment = NSTextAlignmentCenter;
    self.textField2.textAlignment = NSTextAlignmentCenter;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 280, 100, 50);
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTitle:@"注册" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.label];
    
    [self.view addSubview:self.textField2];
    [self.view addSubview:self.label2];



}
//6.实现协议方法
-(void)back{
    //注册视图对象
    ResignViewController *resignVc = [[ResignViewController alloc]init];
//5.设置代理
    resignVc.delegate = self;
    //导航控制方法 推出视图方法  把mangVc 当做resignVc代理
    [self.navigationController pushViewController:resignVc animated:YES];
}
//5.实现协议里面的方法
-(void)makeMoney:(NSString *)job{
    NSLog(@"没money了，，，%@",job);
}
- (void) getTextFieldName:(NSString *)name passWord:(NSString *)password{
    self.textField.text = name;
    self.textField2.text = password;
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
