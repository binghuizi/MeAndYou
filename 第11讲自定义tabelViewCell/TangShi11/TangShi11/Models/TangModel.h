//
//  TangModel.h
//  TangShi11
//
//  Created by scjy on 15/12/5.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TangModel : NSObject
@property(nonatomic,retain) NSString *oneTitleModel;
@property(nonatomic,retain) NSString *twoNameModel;
- (instancetype) initWithString:(NSString *)str;
@end
