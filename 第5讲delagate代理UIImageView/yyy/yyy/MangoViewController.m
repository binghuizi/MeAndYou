//
//  MangoViewController.m
//  UILessonDelegate
//
//  Created by 张茫原 on 15/11/24.
//  Copyright © 2015年 芒果科技. All rights reserved.
//

#import "MangoViewController.h"
#import "MangoView.h"
//引入头文件，让MangoViewController知道有SecondViewController这个类以及他的接口
#import "SecondViewController.h"

@interface MangoViewController ()

@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //把mangoView添加到self.view上
    self.mangoView = [[MangoView alloc] initWithFrame:self.view.frame];
    self.mangoView.backgroundColor = [UIColor yellowColor];
    //给mangoView的按钮属性添加方法
    [self.mangoView.btn addTarget:self action:@selector(goToNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.mangoView];
    [self.mangoView release];

}

- (void)goToNext{
    //创建一个SecondViewController的实例对象
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    //把MangoViewController当secondVC代理
    secondVC.delegate = self;
    
    //视图控制器之间的切换
    //模态视图
    //self是当前的视图控制器
    //presentViewController:是将要切换的试图控制器的对象
    //animated是否需要过度动画
    //completion视图切换完成之后是否需要执行操作
    [self presentViewController:secondVC animated:YES completion:nil];
}
//协议里面必须实现的方法
- (void)getTextFiledInputText:(NSString *)text{
    //当tf输入文字赋值给mangoView的Label
    self.mangoView.nameLabel.text = text;
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
