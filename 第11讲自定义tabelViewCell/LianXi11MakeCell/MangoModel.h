//
//  MangoModel.h
//  LianXi11MakeCell
//
//  Created by scjy on 15/12/2.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MangoModel : NSObject
@property(nonatomic,retain) NSString *carName;
@property(nonatomic,retain) NSString *carIntruduce;
@property(nonatomic,retain) NSString *carImage;
//外部字典传进来 进行加工
- (instancetype) initWithDictionary:(NSDictionary *)dict;
@end
