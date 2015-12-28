//
//  MangoModel.m
//  UILession11UITableViewCell
//
//  Created by scjy on 15/12/2.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "MangoModel.h"

@implementation MangoModel
- (instancetype)initWithDictionary:(NSDictionary *)dict{
    self =  [super init];
    if (self) {
        self.carName = dict[@"carName"];
        self.carIntruduce = dict[@"introduce"];
        self.carImage = dict[@"carImage"];
    }
    return self;
}
- (void)dealloc{
    [_carName release],_carName = nil;
    [_carIntruduce release],_carIntruduce = nil;
    [_carImage release],_carImage = nil;
    [super dealloc];
    
}
@end
