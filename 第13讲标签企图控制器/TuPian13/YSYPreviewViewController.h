//
//  YSYPreviewViewController.h
//  TuPian13
//
//  Created by scjy on 15/12/10.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UMSocial.h"
#import "YSYPreviewViewController.h"

@interface PostTableViewController : UITableViewController<UITextViewDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UMSocialUIDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *photosCollectionView;
@property (weak, nonatomic) IBOutlet UISwitch *WeiboSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *RenrenSwitch;
- (IBAction)DoubanSwitched:(id)sender;
- (IBAction)RenrenSwitched:(id)sender;
- (IBAction)WeiboSwitched:(id)sender;

+(void) deleteSelectedImage:(NSInteger) index;
+(void) deleteSelectedImageWithImage:(UIImage*)image;
@end
