//
//  MangoViewController.m
//  UILession15DataBase
//
//  Created by scjy on 15/12/18.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "MangoViewController.h"
#import "DataBaseManger.h"
@interface MangoViewController ()

@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"数据库";
    DataBaseManger *dbManger = [DataBaseManger sharedInstance];
    [dbManger openDataBase];
    [dbManger createDataBase];
    LinkMan *linkMan1 = [LinkMan linkManWithName:@"玛莎拉蒂" phoneNumber:@"123456789" gender:@"女" age:20 remarks:@"一枝花"];
    
    LinkMan *linkMan2 = [LinkMan linkManWithName:@"凯迪拉克" phoneNumber:@"987654321" gender:@"男" age:20 remarks:@"贱男"];
    LinkMan *linkMan3 = [LinkMan linkManWithName:@"福特" phoneNumber:@"456" gender:@"男" age:20 remarks:@"闪电侠"];
//    [dbManger insertLinkMan:linkMan1];
//    [dbManger insertLinkMan:linkMan2];
 //   [dbManger insertLinkMan:linkMan3];
    [dbManger upDateLinkMan:linkMan3];
  //  [dbManger deleteLinkMan:linkMan3];
    
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
