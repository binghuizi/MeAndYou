//
//  RootViewController.m
//  WeiBoSDKFirst
//
//  Created by scjy on 15/12/16.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "RootViewController.h"
#import <Social/Social.h>
@interface RootViewController ()




@end




@implementation RootViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   // self.view.backgroundColor = [UIColor blackColor];
    _resultLabel.textColor = [UIColor redColor];
    _postUrl.text =@"http://www.baidu.com";
    
    _postImage.text =@"meimei.png";
    [self.view addSubview:_resultLabel];
    [self.view addSubview:_postUrl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//发送微博
- (IBAction)WeiboBtn:(UIButton *)sender
{
    //    NSString *str = @"http://www.baidu.com";
    //判断服务器是否可以访问新浪微博
    if([SLComposeViewController isAvailableForServiceType:SLServiceTypeSinaWeibo])
    {
        /*
         此处可以选择 很多种包括facebook  Twitter  但选择发送到facebook或者Twitter 都要先通过VPN翻墙
         具体怎么做 请看这里 http://www.myvpnonly.com/misc/iphone
         
         SOCIAL_EXTERN NSString *const SLServiceTypeTwitter NS_AVAILABLE(10_8, 6_0);
         SOCIAL_EXTERN NSString *const SLServiceTypeFacebook NS_AVAILABLE(10_8, 6_0);
         SOCIAL_EXTERN NSString *const SLServiceTypeSinaWeibo NS_AVAILABLE(10_8, 6_0);
         SOCIAL_EXTERN NSString *const SLServiceTypeTencentWeibo NS_AVAILABLE(10_9, 7_0);
         SOCIAL_EXTERN NSString *const SLServiceTypeLinkedIn NS_AVAILABLE(10_9, NA);
         */
        
        NSLog(@"可以!!");
        //使用SLServiceTypeSinaWeibo创建一个新浪微博view controller
        SLComposeViewController *socialVC = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeSinaWeibo];
        //写一个block用于completionHandler初始化
        //typedef void (^SLComposeViewControllerCompletionHandler)(SLComposeViewControllerResult result); 定义一个范围值为void 参数为SLComposeViewControllerResult的block 句柄保存发送完的信息
        
        SLComposeViewControllerCompletionHandler myblock = ^(SLComposeViewControllerResult result)
        {
            if(result ==SLComposeViewControllerResultCancelled)
            {
                //是取消
                _resultLabel.text =@"分享取消";
            }
            else if(result ==SLComposeViewControllerResultDone)
            {
                _resultLabel.text =@"分享成功";
            }
            else
            {
                _resultLabel.text =@"分享失败";
            }
        };
        //@property (nonatomic, copy) SLComposeViewControllerCompletionHandler completionHandler;
        socialVC.completionHandler = myblock ;//初始化completionHandler为myblock
        UIImage *image = [UIImage imageNamed:_postImage.text];
        //        UIImage *image = [UIImage imageWithContentsOfFile:_postImage.text];
        NSURL *url = [NSURL URLWithString:_postUrl.text];
        [socialVC setInitialText:_postText.text];
        [socialVC addImage:image];
        [socialVC addURL:url];
        
        [self presentViewController:socialVC animated:YES completion:nil];
    }
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
