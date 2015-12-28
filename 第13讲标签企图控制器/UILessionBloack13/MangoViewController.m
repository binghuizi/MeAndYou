//
//  MangoViewController.m
//  UILessionBloack13
//
//  Created by scjy on 15/12/7.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "MangoViewController.h"
#import "ColorModel.h"
@interface MangoViewController ()

@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
//1.有参 有返回值
    int(^myFirstBlock)(int number1) = ^int(int number1) {
        return  number1 *number1;
    };
    NSLog(@"myFirstBlock = %d",myFirstBlock(3));
//2.有参无返回值
    void(^myTwoBlock) (int num2) = ^void(int num2){
        NSLog(@"%d",num2);
    };
    myTwoBlock(2);
//3.无惨有返回值
    int (^myThreeBlock)(void) = ^int(void){
        return 3;
    };
    NSLog(@"%d",myThreeBlock());
//4.无惨无返回值
    void(^myFourBlock)(void) = ^void(void){
        NSLog(@"mayFourBlock");
    };
    myFourBlock();

    UIButton *chageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    chageButton.frame = CGRectMake(100, 200, 100, 50);
    chageButton.backgroundColor = [UIColor purpleColor];
    [chageButton setTitle:@"点击" forState:UIControlStateNormal];
    [chageButton addTarget:self action:@selector(chageAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chageButton];

}
- (void)chageAction{
    ColorModel *model = [[ColorModel alloc]init];
    //在block内部不能直接使用实例变量 self调用属性 因为block调用引用计数会+1 导致循环引用
    __block UIViewController *weakSelf = self;
    [ model getViewColorWithColorBlock:^(UIColor *wellSetColor) {
        weakSelf.view.backgroundColor = wellSetColor;
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
