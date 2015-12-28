//
//  People.m
//  ArchiveLianXi
//
//  Created by scjy on 15/12/17.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import "People.h"

@implementation People
-(void)dealloc{
    [_name release],_name = nil;
    [_gender release],_gender = nil;
    [_age release],_age = nil;
    [super dealloc];
}
//反序列
-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.name   = [aDecoder decodeObjectForKey:@"name"];
        self.gender = [aDecoder decodeObjectForKey:@"gender"];
        self.age    = [aDecoder decodeObjectForKey:@"age"];
    }
    
    return self;
}
//序列化
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.gender forKey:@"gender"];
    [aCoder encodeObject:self.age forKey:@"age"];
    
}
@end
