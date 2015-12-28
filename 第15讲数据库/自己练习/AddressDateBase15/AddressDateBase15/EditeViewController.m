
//
//  EditeViewController.m
//  AddressDateBase15
//
//  Created by scjy on 15/12/20.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "EditeViewController.h"
#import "XiangXiViewController.h"
#import "DataBaseManger.h"
#import "SelectViewController.h"
@interface EditeViewController ()

@end

@implementation EditeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(30, 50, 200, 100)];
    name.text = @"姓名:";
    name.font = [UIFont systemFontOfSize:18];
    
    UILabel *password = [[UILabel alloc]initWithFrame:CGRectMake(30, 110, 200, 100)];
    password.text = @"性别:";
    password.font = [UIFont systemFontOfSize:18];
    
    UILabel *confirmPassword = [[UILabel alloc]initWithFrame:CGRectMake(30, 170, 200, 100)];
    confirmPassword.text = @"年龄:";
    confirmPassword.font = [UIFont systemFontOfSize:18];
    
    UILabel *phoneNumber = [[UILabel alloc]initWithFrame:CGRectMake(30, 230, 200, 100)];
    phoneNumber.text = @"手机号:";
    phoneNumber.font = [UIFont systemFontOfSize:18];
    
    UILabel *email = [[UILabel alloc]initWithFrame:CGRectMake(30, 280, 200, 100)];
    email.text = @"备注:";
    email.font = [UIFont systemFontOfSize:18];
    [self.view addSubview:name];
    [self.view addSubview:password];
    [self.view addSubview:confirmPassword];
    [self.view addSubview:phoneNumber];
    [self.view addSubview:email];
    
    //文本框
    self.nameKuang = [[UITextField alloc]initWithFrame:CGRectMake(130, 80, 200, 30 )];
    self.nameKuang.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8];
    //文本框样式
    self.nameKuang.borderStyle = UITextBorderStyleRoundedRect;
    //键盘样式
    self.nameKuang.keyboardType= UIKeyboardTypeWebSearch;
    //占用符
    self.nameKuang.placeholder = @"请输入姓名";
    self.nameKuang.text = self.nameString;
    
    self.genderKuang = [[UITextField alloc]initWithFrame:CGRectMake(130, 140, 200, 30)];
    self.genderKuang.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8];
    self.genderKuang.borderStyle = UITextBorderStyleRoundedRect;
    //占用符
    self.genderKuang.placeholder = @"请输入性别";
    self.genderKuang.text = self.genderString;
    
    self.agePassKuang = [[UITextField alloc]initWithFrame:CGRectMake(130, 200, 200, 30)];
    self.agePassKuang.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8];
    self.agePassKuang.borderStyle = UITextBorderStyleRoundedRect;
    NSString *string = [NSString stringWithFormat:@"%lu",self.ageString];
    self.agePassKuang.text = string;
    //占用符
    self.agePassKuang.placeholder = @"请输入年龄";
    
    self.phoneNumKuang = [[UITextField alloc]initWithFrame:CGRectMake(130, 260, 200, 30)];
    self.phoneNumKuang.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8];
    self.phoneNumKuang.borderStyle = UITextBorderStyleRoundedRect;
    self.phoneNumKuang.text = self.phoneNumberString;
    //占用符
    self.phoneNumKuang.placeholder = @"请输入联系方式";
    self.remarksKuang = [[UITextField alloc]initWithFrame:CGRectMake(130, 320, 200, 30)];
    self.remarksKuang.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8];
    self.remarksKuang.borderStyle = UITextBorderStyleRoundedRect;
    self.remarksKuang.text = self.remarkString;
    //占用符
    self.remarksKuang.placeholder = @"请输入备注";
    self.nameKuang.delegate = self;
    self.genderKuang.delegate = self;
    self.agePassKuang.delegate = self;
    self.phoneNumKuang.delegate = self;
    self.remarksKuang.delegate = self;
    [self.view addSubview:self.remarksKuang];
    [self.view addSubview:self.phoneNumKuang];
    [self.view addSubview:self.agePassKuang];
    [self.view addSubview:self.genderKuang];
    [self.view addSubview:self.nameKuang];
    
    UIButton *resgisZhu = [UIButton buttonWithType:UIButtonTypeCustom];
    resgisZhu.frame = CGRectMake(90, 380, 50, 50);
    [resgisZhu setTitle:@"保存" forState:UIControlStateNormal];
    [resgisZhu setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    //点击保存 成功
    [resgisZhu addTarget:self action:@selector(registerSucceedWay) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *cancelXiao = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelXiao.frame = CGRectMake(260, 380, 50, 50);
    [cancelXiao setTitle:@"取消" forState:UIControlStateNormal];
    [cancelXiao setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    //点击取消按钮  触发canselWay事件
    [cancelXiao addTarget:self action:@selector(canselWay) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:cancelXiao];
    [self.view addSubview:resgisZhu];
}
//键盘回收
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self.nameKuang resignFirstResponder];
    [self.genderKuang resignFirstResponder];
    [self.agePassKuang resignFirstResponder];
    [self.phoneNumKuang resignFirstResponder];
    [self.remarksKuang resignFirstResponder];
    return YES;
}
//点击保存触发事件
- (void)registerSucceedWay{
    DataBaseManger *dataBase = [[DataBaseManger alloc]init];
   int a = [dataBase updateLinkManWithPhoneNUmber:self.phoneNumKuang.text withName:self.nameKuang.text];
    if (a == 1) {
        SelectViewController *selectVc = [[SelectViewController alloc]init];
        [self.navigationController pushViewController:selectVc animated:YES];
        
    }else{
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"提示" message:@"删除失败" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alter show];
    }
    
    
    
}
//编辑取消
-(void)canselWay{
   // XiangXiViewController *xiangView = [[XiangXiViewController alloc]init];
    [self.navigationController popViewControllerAnimated:YES];
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
