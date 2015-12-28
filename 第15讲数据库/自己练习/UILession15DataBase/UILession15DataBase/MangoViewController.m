//
//  MangoViewController.m
//  UILession15DataBase
//
//  Created by scjy on 15/12/18.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "MangoViewController.h"
#import "DataBaseManger.h"
#import "LinkMan.h"
@interface MangoViewController ()

@end

@implementation MangoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"数据库";
    DataBaseManger *dbManger = [DataBaseManger sharedInstance];
    [dbManger openDataBase];
//1.添加
    UIButton *addNewLikMan = [UIButton buttonWithType:UIButtonTypeCustom];
    addNewLikMan.frame = CGRectMake(100, 100, 100, 44);
    addNewLikMan.backgroundColor = [UIColor brownColor];
    [addNewLikMan setTitle:@"添加联系人" forState:UIControlStateNormal];
    [addNewLikMan addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    addNewLikMan.tag = 1;
    [self.view addSubview:addNewLikMan];
    [addNewLikMan release];
//2.删除
    UIButton *deleteNewLikMan = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteNewLikMan.frame = CGRectMake(100, 200, 100, 44);
    deleteNewLikMan.backgroundColor = [UIColor brownColor];
    [deleteNewLikMan setTitle:@"删除联系人" forState:UIControlStateNormal];
    [deleteNewLikMan addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    deleteNewLikMan.tag = 2;
    [self.view addSubview:deleteNewLikMan];
    [deleteNewLikMan release];
   
//3.更新
    UIButton *updataNewLikMan = [UIButton buttonWithType:UIButtonTypeCustom];
    updataNewLikMan.frame = CGRectMake(100, 300, 100, 44);
    updataNewLikMan.backgroundColor = [UIColor brownColor];
    [updataNewLikMan setTitle:@"更新联系人" forState:UIControlStateNormal];
    [updataNewLikMan addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    updataNewLikMan.tag = 3;
    [self.view addSubview:updataNewLikMan];
    [updataNewLikMan release];
   
//4.查询所有联系人
    UIButton *selectNewLikMan = [UIButton buttonWithType:UIButtonTypeCustom];
    selectNewLikMan.frame = CGRectMake(100, 400, 300, 44);
    selectNewLikMan.backgroundColor = [UIColor brownColor];
    [selectNewLikMan setTitle:@"查询所有联系人" forState:UIControlStateNormal];
    [selectNewLikMan addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    selectNewLikMan.tag = 4;
    [self.view addSubview:selectNewLikMan];
    [selectNewLikMan release];
//5.根据性别查询所有联系人
    UIButton *genderNewLikMan = [UIButton buttonWithType:UIButtonTypeCustom];
    genderNewLikMan.frame = CGRectMake(100, 500, 300, 44);
    genderNewLikMan.backgroundColor = [UIColor brownColor];
    [genderNewLikMan setTitle:@"有性别查询联系人" forState:UIControlStateNormal];
    [genderNewLikMan addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    genderNewLikMan.tag = 5;
    [self.view addSubview:genderNewLikMan];
    [genderNewLikMan release];
}
- (void)action:(UIButton *)btn{
    if (btn.tag == 1) {
         DataBaseManger *dbManger = [DataBaseManger sharedInstance];
        LinkMan *linkman1 = [LinkMan linkManWithName:@"玛莎拉蒂" phoneNumber:@"133565" gender:@"女" age:18 remarks:@"一枝花"];
        LinkMan *linkman2 = [LinkMan linkManWithName:@"凯迪拉克" phoneNumber:@"6663" gender:@"男" age:20 remarks:@"贱男"];
       
            [dbManger insertIntoNewLinkMan:linkman1];
            [dbManger insertIntoNewLinkMan:linkman2];
    }else if (btn.tag == 2){
        DataBaseManger *dbManger = [DataBaseManger sharedInstance];
        //[dbManger deleteLinkManWithPhoneNUmber:@"6663"];//根据手机号
        [dbManger deleteLinkManWithName:@"凯迪拉克"];//根据姓名
    }else if (btn.tag == 3){
        DataBaseManger *dbManger = [DataBaseManger sharedInstance];
       
        [dbManger updateLinkManWithPhoneNUmber:@"000" withName:@"凯迪拉克"];
    }else if (btn.tag == 4){
        DataBaseManger *dbManger = [DataBaseManger sharedInstance];
        NSMutableArray *array = [[NSMutableArray alloc]init];
        array  = [dbManger seleatAllLinkMans];
        for (LinkMan *lm in array) {
            NSLog(@"%@ %@",lm.name,lm.gender);
        }
        
       // NSLog(@"%@",array);
    }else if (btn.tag == 5){
        DataBaseManger *dbManger = [DataBaseManger sharedInstance];
        NSMutableArray *array = [[NSMutableArray alloc]init];
        array  = [dbManger seleatAllLinkMansWithGender:@"女"];
        for (LinkMan *lm in array) {
            NSLog(@"%@ %@",lm.name,lm.gender);
        }
       
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
