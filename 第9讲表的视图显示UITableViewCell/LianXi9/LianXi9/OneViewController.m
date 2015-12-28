//
//  OneViewController.m
//  LianXi9
//
//  Created by scjy on 15/12/1.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()
@property(nonatomic,retain) UITableView *tabelView;
@property(nonatomic,retain) UITableViewCell *cell;
@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.tabelView = [[UITableView alloc]initWithFrame:self.view.frame ];
    self.tabelView.backgroundColor = [UIColor colorWithRed:1.0 green:0.9 blue:0.8 alpha:1.0];
    //分割线
    self.tabelView.separatorColor = [UIColor magentaColor];
    self.tabelView.rowHeight = 60;
    //设置代理
    self.tabelView.dataSource = self;
    [self.view addSubview:self.tabelView];
    [self.tabelView release];
}
//几行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  static NSString *string = @"CycelCell";
    
    self.cell = [tableView dequeueReusableCellWithIdentifier:string];
    if (self.cell == nil) {
        self.cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];
    }
    for (int i = 0; i < 100; i++)
    {
        if (indexPath.row == i) {
            NSString *num = [NSString stringWithFormat:@"%d",i + 1];
            self.cell.textLabel.text = num;
        }
        
    }
    return self.cell;

}

//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    for (int i = 0; i < 99; i++) {
//        section = i;
//        NSString *num = [NSString stringWithFormat:@"%d",i];
//        return num;
//    }
//    return @"100";
//}


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
