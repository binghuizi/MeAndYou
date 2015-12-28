//
//  TangModel.m
//  TangShi11
//
//  Created by scjy on 15/12/5.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "TangModel.h"

@implementation TangModel
-(instancetype)initWithString:(NSString *)str{
    self = [super init];
    if (self) {
        self.oneTitleModel = str;
        self.twoNameModel = str;
    }
    return self;
}
@end
