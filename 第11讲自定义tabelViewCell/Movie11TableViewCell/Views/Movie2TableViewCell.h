//
//  Movie2TableViewCell.h
//  Movie11TableViewCell
//
//  Created by scjy on 15/12/4.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
@interface Movie2TableViewCell : UITableViewCell
@property(nonatomic,retain) MovieModel *model;

+ (CGFloat) getCellHeightWithMovieModel:(MovieModel *)movieModel;
+ (CGFloat) getTextHeightWithText:(NSString *)movieIntroduce;
@end
