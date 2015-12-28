//
//  MovieModel.m
//  Movie11TableViewCell
//
//  Created by scjy on 15/12/3.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "MovieModel.h"

@implementation MovieModel
- (instancetype)initWithDictionary:(NSDictionary *)dict{
    self =  [super init];
    if (self) {
        self.movieImage = dict[@"image"];
        self.movieName = dict[@"movieName"];
        self.movieIntroduce = dict[@"introduce"];
        self.movieTime = dict[@"time"];
        self.movieLookNum = dict[@"lookNumber"];
        self.movieButtonTitton = dict[@"button"];
        self.showIntroduce = dict[@"showIntroduce"];
        self.leaderModel = dict[@"lead"];
        self.directorModel = dict[@"director"];
        self.areaModel = dict[@"area"];
        self.typeModel = dict[@"type"];
    }
    return self;
}
- (void)dealloc{
    [_movieImage release];
    [_movieName release];
    [_movieIntroduce release];
    [_movieTime release];
    [_movieLookNum release];
    [_movieButtonTitton release];
    [super dealloc];
    
}
@end
