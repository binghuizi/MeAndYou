//
//  YSYPreviewViewController.m
//  TuPian13
//
//  Created by scjy on 15/12/10.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "YSYPreviewViewController.h"
static UIImage *currentImage;
@interface YSYPreviewViewController ()
- (IBAction)deleteSelectedImage:(id)sender;
@property (weak, nonatomic) IBOutlet UIImageView *previewImageView;
@end
@implementation YSYPreviewViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _previewImageView.image=currentImage;
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
- (IBAction)deleteSelectedImage:(id)sender {
    UIActionSheet *action=[[UIActionSheet alloc] initWithTitle:@"要删除这张照片吗？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"删除" otherButtonTitles: nil];
    [action showInView:self.view];
}
- (IBAction)deleteSelectedImage:(id)sender {
    UIActionSheet *action=[[UIActionSheet alloc] initWithTitle:@"要删除这张照片吗？" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"删除" otherButtonTitles: nil];
    [action showInView:self.view];
}
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex==actionSheet.cancelButtonIndex)
    {
        return;
    }
    else
    {
        [PostTableViewController deleteSelectedImageWithImage:currentImage];
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}
+(void)setPreviewImage:(UIImage *)image{
    currentImage=image;
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
