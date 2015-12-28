//
//  MangoViewController.m
//  AddressDateBase15
//
//  Created by scjy on 15/12/20.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "MangoViewController.h"
#import "InsertViewController.h"
#import "SelectViewController.h"
@interface MangoViewController ()

@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title  = @"通讯录连接数据库";
//1.添加
    UIButton *addNewLikMan = [UIButton buttonWithType:UIButtonTypeCustom];
    addNewLikMan.frame = CGRectMake(100, 100, 200, 44);
    addNewLikMan.backgroundColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.5 alpha:1.0];
    [addNewLikMan setTitle:@"添加联系人" forState:UIControlStateNormal];
    [addNewLikMan setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [addNewLikMan addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    addNewLikMan.tag = 1;
    [self.view addSubview:addNewLikMan];
    [addNewLikMan release];
//1.显示所有联系人
    UIButton *selectAllLikMan = [UIButton buttonWithType:UIButtonTypeCustom];
    selectAllLikMan.frame = CGRectMake(100, 200, 200, 44);
    selectAllLikMan.backgroundColor = [UIColor colorWithRed:1.0 green:0.5 blue:0.5 alpha:1.0];
    [selectAllLikMan setTitle:@"显示所有联系人" forState:UIControlStateNormal];
    [selectAllLikMan setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [selectAllLikMan addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    selectAllLikMan.tag = 2;
    [self.view addSubview:selectAllLikMan];
    [selectAllLikMan release];
}
- (void)action:(UIButton *)btn{
    if (btn.tag == 1 ) {
        InsertViewController *insertView = [[InsertViewController alloc]init];
        [self.navigationController pushViewController:insertView animated:YES];
    }else if (btn.tag == 2){
        SelectViewController *selectView = [[SelectViewController alloc]init];
        [self.navigationController pushViewController:selectView animated:YES];
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
