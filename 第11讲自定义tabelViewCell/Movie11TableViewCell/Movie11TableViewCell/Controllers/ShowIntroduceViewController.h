//
//  ShowIntroduceViewController.h
//  Movie11TableViewCell
//
//  Created by scjy on 15/12/4.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
@interface ShowIntroduceViewController : UIViewController
@property(nonatomic,retain) NSString *showImageName;
@property(nonatomic,retain) NSString *showMovieName;
@property(nonatomic,retain) NSString *showIntroduce;
@property(nonatomic,retain) NSString *showTime;
@property(nonatomic,retain) NSString *showLeader;
@property(nonatomic,retain) NSString *showDirector;
@property(nonatomic,retain) NSString *showAreay;
@property(nonatomic,retain) NSString *showType;
@property(nonatomic,retain) MovieModel *model;
@end
