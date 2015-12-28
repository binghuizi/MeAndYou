//
//  ManggoView.h
//  UILessionTargetAction5
//
//  Created by scjy on 15/11/24.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ManggoView : UIView
@property CGPoint point2;


//向外部公开接口传入目标和动作
-(void)addTarget:(id)traget action:(SEL)action;

-(void)addTarget2:(id)traget2 action2:(SEL)action2;
@end
