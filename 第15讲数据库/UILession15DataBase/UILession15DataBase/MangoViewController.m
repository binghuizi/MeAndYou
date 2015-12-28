//
//  MangoViewController.m
//  UILession15DataBase
//
//  Created by scjy on 15/12/18.
//  Copyright © 2015年 scjy. All rights reserved.
//
#define kWideth  [UIScreen mainScreen].bounds.size.width
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
    addNewLikMan.frame = CGRectMake(30, 100, kWideth - 60, 44);
    addNewLikMan.backgroundColor = [UIColor brownColor];
    [addNewLikMan setTitle:@"添加联系人" forState:UIControlStateNormal];
    [addNewLikMan addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    addNewLikMan.tag = 1;
    [self.view addSubview:addNewLikMan];
    [addNewLikMan release];
//2.删除
    UIButton *deleteNameLikMan = [UIButton buttonWithType:UIButtonTypeCustom];
    deleteNameLikMan.frame = CGRectMake(30, 200, kWideth - 60, 44);
    deleteNameLikMan.backgroundColor = [UIColor brownColor];
    [deleteNameLikMan setTitle:@"有姓名删除联系人" forState:UIControlStateNormal];
    [deleteNameLikMan addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    deleteNameLikMan.tag = 2;
    [self.view addSubview:deleteNameLikMan];
    [deleteNameLikMan release];
//3.修改
    UIButton *updateLikMan = [UIButton buttonWithType:UIButtonTypeCustom];
    updateLikMan.frame = CGRectMake(30, 300, kWideth - 60, 44);
    updateLikMan.backgroundColor = [UIColor brownColor];
    [updateLikMan setTitle:@"修改联系人" forState:UIControlStateNormal];
    [updateLikMan addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    updateLikMan.tag = 3;
    [self.view addSubview:updateLikMan];
    [updateLikMan release];
//4.查询所有联系人
    UIButton *selectAllLikMan = [UIButton buttonWithType:UIButtonTypeCustom];
    selectAllLikMan.frame = CGRectMake(30, 400, kWideth - 60, 44);
    selectAllLikMan.backgroundColor = [UIColor brownColor];
    [selectAllLikMan setTitle:@"查询所有联系人" forState:UIControlStateNormal];
    [selectAllLikMan addTarget:self action:@selector(action:) forControlEvents:UIControlEventTouchUpInside];
    selectAllLikMan.tag = 4;
    [self.view addSubview:selectAllLikMan];
    [selectAllLikMan release];
    
    
}
- (void)action:(UIButton *)btn{
    DataBaseManger *dbManger = [DataBaseManger sharedInstance];
    if (btn.tag == 1) {
        
        LinkMan *linkman1 = [LinkMan linkManWithName:@"玛莎拉蒂" phoneNumber:@"133565" gender:@"女" age:18 remarks:@"一枝花"];
        LinkMan *linkman2 = [LinkMan linkManWithName:@"凯迪拉克" phoneNumber:@"6663" gender:@"男" age:20 remarks:@"贱男"];
        LinkMan *linkman3 = [LinkMan linkManWithName:@"法拉利" phoneNumber:@"555" gender:@"男" age:20 remarks:@"闷骚"];
        LinkMan *linkman4 = [LinkMan linkManWithName:@"福特" phoneNumber:@"8888" gender:@"男" age:20 remarks:@"哎呦不错"];
        [dbManger insertIntoNewLinkMan:linkman1];
        [dbManger insertIntoNewLinkMan:linkman2];
        [dbManger insertIntoNewLinkMan:linkman3];
        [dbManger insertIntoNewLinkMan:linkman4];
    }else if (btn.tag == 2){

        [dbManger deleteLinkManWithName:@"法拉利"];
    }else if (btn.tag == 3){
        
        [dbManger updateLinkManWithPhoneNUmber:@"0000000000000" withName:@"福特"];
    }
    else if (btn.tag == 4){
       // [dbManger seleatAllLinkMansWithGender:@"女"];
        NSMutableArray *array = [dbManger seleatAllLinkMansWithGender:@"女"];
        NSLog(@"%@",array);
        for (LinkMan *lm in array) {
            NSLog(@"%@ %lu %@ %@",lm.name,lm.age,lm.phoneNumber,lm.remarks);
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
