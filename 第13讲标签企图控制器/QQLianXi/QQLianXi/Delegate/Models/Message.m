//
//  Message.m
//  QQLianXi
//
//  Created by scjy on 15/12/15.
//
//

#import "Message.h"

@implementation Message
-(instancetype)initWithDict:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
    
}
+(instancetype)messageWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}



@end
