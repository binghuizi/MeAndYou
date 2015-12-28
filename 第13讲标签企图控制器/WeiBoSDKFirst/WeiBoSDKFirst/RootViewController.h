//
//  RootViewController.h
//  WeiBoSDKFirst
//
//  Created by scjy on 15/12/16.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

@property (nonatomic,weak)  IBOutlet UITextView *postText;
@property (weak, nonatomic) IBOutlet UITextField *postUrl;
@property (weak, nonatomic) IBOutlet UITextField *postImage;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;



- (IBAction)WeiboBtn:(UIButton *)sender;
@end
