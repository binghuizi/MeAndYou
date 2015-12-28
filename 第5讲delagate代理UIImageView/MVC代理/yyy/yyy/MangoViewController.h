//
//  MangoViewController.h
//  UILessonDelegate
//
//  Created by 张茫原 on 15/11/24.
//  Copyright © 2015年 芒果科技. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
#import "MangoView.h"
//让MangoViewController遵循secondVC的协议
@interface MangoViewController : UIViewController<SecondVCDelegate>
@property(nonatomic,retain)MangoView *mangoView;
@end
