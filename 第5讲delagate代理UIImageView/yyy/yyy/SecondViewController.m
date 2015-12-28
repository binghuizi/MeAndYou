//
//  SecondViewController.m
//  UILessonDelegate
//
//  Created by 张茫原 on 15/11/24.
//  Copyright © 2015年 芒果科技. All rights reserved.
//

#import "SecondViewController.h"
//引入secondView头文件
#import "SecondView.h"

//把方法和实例变量、属性定义到这里边属于私有方法
@interface SecondViewController ()
{
    //把_secondView定义成全局变量
    SecondView *_secondView;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化一个SecondView对象
    _secondView = [[SecondView alloc] initWithFrame:self.view.frame];
    //设置secondView背景颜色
    _secondView.backgroundColor = [UIColor grayColor];
    //secondView的按钮属性添加方法
    [_secondView.btn addTarget:self action:@selector(goback) forControlEvents:UIControlEventTouchUpInside];
    //添加
    [self.view addSubview:_secondView];
    //释放
    [_secondView release];
}

- (void)goback{
 //self.delegate判断代理类是否存在  并且这个代理类响应里面的这个协议方法
    if (self.delegate && [self.delegate respondsToSelector:@selector(getTextFiledInputText:)]) {
        [self.delegate getTextFiledInputText:_secondView.tf.text];
    }
    
    
    

    //Animated视图是否需要过度动画
    //completion完成之后需要执行的操作
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"我已经被干了");
    }];
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
