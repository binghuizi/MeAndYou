//
//  ManggoViewController.h
//  UILessionDelegate5
//
//  Created by scjy on 15/11/24.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MangoView.h"
#import "SecondViewController.h"
@interface ManggoViewController : UIViewController<SecondVCDelegate>
@property(nonatomic,retain) MangoView *mangoView;
@end
