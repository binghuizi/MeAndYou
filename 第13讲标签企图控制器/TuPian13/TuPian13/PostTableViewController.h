//
//  PostTableViewController.h
//  TuPian13
//
//  Created by scjy on 15/12/10.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "PostTableViewController.h"
#import "NineShareService.h"
static NSMutableArray *currentImages;
@interface PostTableViewController ()
@property (weak, nonatomic) IBOutlet UITextView *shareContent;
- (IBAction)postStatus:(id)sender;
- (IBAction)cancelPost:(id)sender;
-(void) loadSNSStatus;
@property (weak, nonatomic) IBOutlet UISwitch *DoubanSwitch;
@property (weak, nonatomic) IBOutlet UITextView *backgroundTextView;
@property NSMutableArray *snsArray;
//@property NSMutableArray *photos;
@property NineShareService *dataContext;
@property NSMutableDictionary *tempDict;
-(void) openCamera;
-(void) openLibary;
@end
@implementation PostTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    if(currentImages ==nil)
    {
        currentImages=[[NSMutableArray alloc] init];
    }
