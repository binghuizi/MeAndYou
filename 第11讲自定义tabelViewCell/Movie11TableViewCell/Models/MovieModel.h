//
//  MovieModel.h
//  Movie11TableViewCell
//
//  Created by scjy on 15/12/3.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MovieModel : NSObject
@property(nonatomic,retain) NSString *movieImage;
@property(nonatomic,retain) NSString *movieName;
@property(nonatomic,retain) NSString *movieIntroduce;
@property(nonatomic,retain) NSString *movieTime;
@property(nonatomic,retain) NSString *movieLookNum;
@property(nonatomic,retain) NSString *movieButtonTitton;
@property(nonatomic,retain) NSString *showIntroduce;
@property(nonatomic,retain) NSString *leaderModel;
@property(nonatomic,retain) NSString *directorModel;
@property(nonatomic,retain) NSString *areaModel;
@property(nonatomic,retain) NSString *typeModel;
- (instancetype) initWithDictionary:(NSDictionary *)dict;
@end
