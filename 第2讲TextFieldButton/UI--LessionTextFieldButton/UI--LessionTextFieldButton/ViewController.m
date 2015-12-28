//
//  ViewController.m
//  UI--LessionTextFieldButton
//
//  Created by scjy on 15/11/19.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//Controller的视图已经加载完成，我们在Controller的视图加载完成之后写代码
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//使用RGB色值去设置颜色 每个RGB的颜色色值是0~1；
    self.view.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
//
  //self.view.backgroundColor = [UIColor colorWithRed:236.0f/255 green:73.0f/255 blue:73.0f/255 alpha:1.0];
   //创建一个文字输入框的步骤
  //1.开辟内存空间并且初始化（设置frame）
    UITextField *firstText = [[UITextField alloc]initWithFrame:CGRectMake(50, 100, 300, 50)];
    //设置输入框文字
    firstText.text = @"第一个文本框";
    //字体颜色
    firstText.textColor = [UIColor purpleColor];
    //字体大小
    firstText.font = [UIFont systemFontOfSize:26];
    //文字对齐方式
   // firstText.textAlignment = NSTextAlignmentRight;
    firstText.textAlignment = NSTextAlignmentCenter;
    //设置输入框颜色
    firstText.backgroundColor = [UIColor colorWithRed:254.0f/255 green:216.0f/255 blue:1.0 alpha:1.0];
    //边框样式 UITextBorderStyle是一个枚举
    firstText.borderStyle = UITextBorderStyleRoundedRect;//圆角样式
    //占位字符串 删除文字显示
    firstText.placeholder = @"请输入文字";
    //是否以密文显示  设置输入时yes显示的圆点  no不显示圆点
    firstText.secureTextEntry = NO;
    //是否让输入  yes 允许输入 no不允许输入(键盘也不弹出)
    firstText.enabled = YES;
    //当开始输入的时候是否清空之前的内容 输入之前YES清空 NO不清空（默认no）
    firstText.clearsOnBeginEditing = YES;
//    firstText.adjustsFontSizeToFitWidth = YES;
//    firstText.enablesReturnKeyAutomatically = YES;
    //弹出键盘类型
    firstText.keyboardType = UIKeyboardTypeASCIICapable;
    
    //设置输入框外观的属性
    //清除按钮 显示时机模式
/* UITextFieldViewModeNever,  从来不显示
    UITextFieldViewModeWhileEditing, 当编辑时显示
    UITextFieldViewModeUnlessEditing, 不编辑时显示
    UITextFieldViewModeAlways  一直显示
 */
    firstText.clearButtonMode = UITextFieldViewModeAlways;
    
    //输入框左视图 右视图  显示视图  和显示时机一样的
   /* UITextFieldViewModeNever,从来不显示
    UITextFieldViewModeWhileEditing,当编辑时显示
    UITextFieldViewModeUnlessEditing,不编辑时显示
    UITextFieldViewModeAlways  一直显示
    */
    UIView *oran = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)]   ;
    oran.backgroundColor = [UIColor orangeColor];
    firstText.leftView = oran;
    firstText.leftViewMode = UITextFieldViewModeAlways;
//    firstText.rightView = oran;
//    firstText.rightViewMode = UITextFieldViewModeAlways;
        //firstText.borderStyle = uite
  //设置textField的代理，self指当前的ViewController 把self赋值给等号左边的delegate的属性
    firstText.delegate = self;
  
   //右下角return键显示的内容
    /*
     UIReturnKeyDefault,
     UIReturnKeyGo,
     UIReturnKeyGoogle,
     UIReturnKeyJoin,
     UIReturnKeyNext,
     UIReturnKeyRoute,
     UIReturnKeySearch,
     UIReturnKeySend,
     UIReturnKeyYahoo,
     UIReturnKeyDone,
     UIReturnKeyEmergencyCall,
     */
    firstText.returnKeyType = UIReturnKeyYahoo;
    
    
    //添加视图
    [self.view addSubview:firstText];
    [firstText release];
    
    //2.button便利构造器
    UIButton *twoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    twoButton.frame = CGRectMake(180, 300, 180, 90);
    //设置按钮标题 此方法有两个参数  setTitle:标题字符串  forState:按钮状态  StateNormal正常状态下显示的
    [twoButton setTitle:@"按钮2" forState:UIControlStateNormal];
    //[firstButton setti]
    twoButton.backgroundColor = [UIColor colorWithRed:253.0f/255 green:141.0f/255 blue:170.0f/255 alpha:1.0];
    [twoButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    UIButton *firstButton = [UIButton buttonWithType:UIButtonTypeCustom];
    firstButton.frame = CGRectMake(10, 200, 180, 90);
    //设置按钮标题 此方法有两个参数  setTitle:标题字符串  forState:按钮状态  StateNormal正常状态下显示的
    [firstButton setTitle:@"按钮1" forState:UIControlStateNormal];
    //[firstButton setti]
    firstButton.backgroundColor = [UIColor colorWithRed:253.0f/255 green:141.0f/255 blue:170.0f/255 alpha:1.0];
    [firstButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    //点击时效果UIControlStateHighlighted
    [firstButton setTitle:@"hlight点击时效果" forState:UIControlStateHighlighted];
    //给按钮添加点击事件 Target把按钮的点击事件添加到哪里self当前的ViewController action需要执行的点击方法  forControlEvents:按钮响应事件的事件，什么时候响应用户的交互事件
    //UIControlEventTouchUpInside点击按钮响应
    [firstButton addTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    //设置按钮前景图
    
    [firstButton setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
    
//     //设置按钮背景图
//    [firstButton setBackgroundImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
    //设置按钮背景图
        [twoButton setBackgroundImage:[UIImage imageNamed:@"1.jpg"] forState:UIControlStateNormal];
    //button是遍历构造器编写的不需要释放
    [self.view addSubview:firstButton];
   [self.view addSubview:twoButton];
}
//按钮响应方法 参数btn跟上边的firstButton指向同一个内存
-(void)loginAction:(UIButton *)btn{
    NSLog(@"登陆成功");
    
    
    
//移除响应事件
//    [btn removeTarget:self action:@selector(loginAction:) forControlEvents:UIControlEventTouchUpInside];
    

}
//输入框点击右下方return按钮时响应的代理方法
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //将键盘作为立即响应者（回收键盘）
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
