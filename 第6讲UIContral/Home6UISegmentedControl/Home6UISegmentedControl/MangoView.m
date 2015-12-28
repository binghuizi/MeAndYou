//
//  MangoView.m
//  Home6UISegmentedControl
//
//  Created by scjy on 15/11/26.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//
#define kWidth   self.frame.size.width
#define kHeight   self.frame.size.height
#import "MangoView.h"
@interface MangoView ()
@property(nonatomic, retain) UISegmentedControl *segment;
@property(nonatomic, retain) UILabel *label;
@property(nonatomic, retain) UITextField *textField;
//@property(nonatomic, retain) UIView *newView;
@end
@implementation MangoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadingCustomView];
    }
    return self;
}
-(void)dealloc{
    [_segment release];
    
    [super dealloc];
    
}

-(void)loadingCustomView{
    
 //   NSMutableArray *segmentArray = [NSMutableArray array];
    self.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    self.segment = [[UISegmentedControl alloc]initWithItems:@[@"登陆",@"注册",@"找回密码" ]];
    
    self.segment.frame = CGRectMake(10, 60, self.frame.size.width, 40);
    
   //点击可以收回
    self.segment.momentary = YES;
    [self.segment addTarget:self action:@selector(viewNew:) forControlEvents:UIControlEventValueChanged];
    
    [self addSubview:self.segment];
    [self.segment release];
    
}

-(void)viewNew:(UISegmentedControl *)segment{
    switch ([self.segment selectedSegmentIndex]) {
        case 0:
            [self loginView];
            break;
        case 1:
            [self registView];
            break;
        case 2:
            [self lookForView];
            break;
        default:
            break;
    }
    
}
- (void)loginView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 100 , kWidth, kHeight)];
    view.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    [self addSubview:view];
        UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(30, 100, 200, 100)];
        name.text = @"用户名:";
        name.font = [UIFont systemFontOfSize:20];
    
        UILabel *password = [[UILabel alloc]initWithFrame:CGRectMake(30, 190, 200, 100)];
        password.text = @"密   码:";
        password.font = [UIFont systemFontOfSize:20];
    //UITextField 文本框 输入文字
        UITextField *filedUser = [[UITextField alloc]initWithFrame:CGRectMake(130, 120, 200, 50)];
    
        filedUser.backgroundColor = [UIColor colorWithRed:254.0f/255 green:216.0f/255 blue:1.0 alpha:1.0];
    
        UITextField *filedPassword = [[UITextField alloc]initWithFrame:CGRectMake(130, 210, 200, 50)];
    
        filedPassword.backgroundColor = [UIColor colorWithRed:254.0f/255 green:216.0f/255 blue:1.0 alpha:1.0];
    //是否以密文显示  设置输入时yes显示的圆点  no不显示圆点
        filedPassword.secureTextEntry = YES;
    //边框样式 UITextBorderStyle是一个枚举
        filedUser.borderStyle = UITextBorderStyleRoundedRect;//圆角样式
        filedPassword.borderStyle = UITextBorderStyleRoundedRect;//圆角样式
    //占位字符串 删除文字显示
       filedUser.placeholder = @"请输入QQ/邮箱/手机号";
        filedPassword.placeholder = @"请输入密码";
    //设置输入框外观的属性 清除按钮 显示时机模式
        filedUser.clearButtonMode = UITextFieldViewModeAlways;
        filedPassword.clearButtonMode = UITextFieldViewModeAlways;
    //添加显示视图
        [view addSubview:name];
        [view addSubview:password];
        [view addSubview:filedUser];
        [view addSubview:filedPassword];
    
    //UIButton登陆按钮
        UIButton *dengButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
        dengButton.frame = CGRectMake(120, 300, 150, 80);
        [dengButton setTitle:@"登陆" forState:
         UIControlStateNormal];
        dengButton.backgroundColor = [UIColor colorWithRed:253.0f/255 green:141.0f/255 blue:170.0f/255 alpha:1.0];
    [view addSubview:dengButton];
}

- (void)registView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 100, kWidth, kHeight)];
    view.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    [self addSubview:view];
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(30, 100, 200, 100)];
            name.text = @"用户名:";
            name.font = [UIFont systemFontOfSize:18];
    
            UILabel *password = [[UILabel alloc]initWithFrame:CGRectMake(30, 160, 200, 100)];
            password.text = @"密   码:";
            password.font = [UIFont systemFontOfSize:18];
    
        UILabel *confirmPassword = [[UILabel alloc]initWithFrame:CGRectMake(30, 220, 200, 100)];
        confirmPassword.text = @"确认密码:";
        confirmPassword.font = [UIFont systemFontOfSize:18];
    
        UILabel *phoneNumber = [[UILabel alloc]initWithFrame:CGRectMake(30, 280, 200, 100)];
        phoneNumber.text = @"手机号:";
        phoneNumber.font = [UIFont systemFontOfSize:18];
    
        UILabel *email = [[UILabel alloc]initWithFrame:CGRectMake(30, 330, 200, 100)];
        email.text = @"邮箱:";
        email.font = [UIFont systemFontOfSize:18];
    
        [view addSubview:name];
        [view addSubview:password];
        [view addSubview:confirmPassword];
        [view addSubview:phoneNumber];
        [view addSubview:email];
    
    //文本框
        UITextField *nameKuang = [[UITextField alloc]initWithFrame:CGRectMake(130, 130, 200, 30 )];
        nameKuang.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8];
        //文本框样式
        nameKuang.borderStyle = UITextBorderStyleRoundedRect;
    //占用符
        nameKuang.placeholder = @"请输入用户名";
    
        UITextField *passKuang = [[UITextField alloc]initWithFrame:CGRectMake(130, 190, 200, 30)];
        passKuang.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8];
        passKuang.borderStyle = UITextBorderStyleRoundedRect;
    //占用符
        passKuang.placeholder = @"请输入密码";
        UITextField *comfimPassKuang = [[UITextField alloc]initWithFrame:CGRectMake(130, 250, 200, 30)];
        comfimPassKuang.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8];
        comfimPassKuang.borderStyle = UITextBorderStyleRoundedRect;
    //占用符
        comfimPassKuang.placeholder = @"再次输入密码";
        UITextField *phoneNumKuang = [[UITextField alloc]initWithFrame:CGRectMake(130, 310, 200, 30)];
        phoneNumKuang.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8];
        phoneNumKuang.borderStyle = UITextBorderStyleRoundedRect;
    //占用符
        phoneNumKuang.placeholder = @"请输入联系方式";
        UITextField *emailKuang = [[UITextField alloc]initWithFrame:CGRectMake(130, 370, 200, 30)];
        emailKuang.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8];
        emailKuang.borderStyle = UITextBorderStyleRoundedRect;
    //占用符
        emailKuang.placeholder = @"请输入邮箱";
        [view addSubview:emailKuang];
        [view addSubview:phoneNumKuang];
        [view addSubview:comfimPassKuang];
        [view addSubview:passKuang];
        [view addSubview:nameKuang];
    
        UIButton *resgisZhu = [UIButton buttonWithType:UIButtonTypeCustom];
        resgisZhu.frame = CGRectMake(90, 430, 50, 50);
        [resgisZhu setTitle:@"注册" forState:UIControlStateNormal];
        [resgisZhu setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        UIButton *cancelXiao = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelXiao.frame = CGRectMake(260, 430, 50, 50);
        [cancelXiao setTitle:@"取消" forState:UIControlStateNormal];
        [cancelXiao setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [view addSubview:cancelXiao];
        [view addSubview:resgisZhu];
    
}

- (void)lookForView{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 100, kWidth, kHeight)];
    view.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    [self addSubview:view];
    UITextField *email = [[UITextField alloc]initWithFrame:CGRectMake(60, 110, 260, 50)];
    
        email.placeholder = @"请输入邮箱";
        email.font = [UIFont systemFontOfSize:25];
        email.backgroundColor = [UIColor colorWithRed:254.0f/255 green:242.0f/255 blue:233.0f/255 alpha:1.0];
        email.textAlignment = NSTextAlignmentCenter;
        email.borderStyle = UITextBorderStyleRoundedRect;
        UIButton *zhaoHui = [[UIButton alloc]initWithFrame:CGRectMake(45, 190, 100, 50)];
    
        [zhaoHui setTitle:@"找回" forState:UIControlStateNormal];
        [zhaoHui setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        UIButton *cancel = [[UIButton alloc]initWithFrame:CGRectMake(230, 190, 100, 50)];
        [cancel setTitle:@"取消" forState:UIControlStateNormal];
        [cancel setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [view addSubview:cancel];
    
    
        [view addSubview:email];
        [view addSubview:zhaoHui];

}
@end

