//
//  People.h
//  ArchiveLianXi
//
//  Created by scjy on 15/12/17.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface People : NSObject<NSCoding>
@property(nonatomic,copy) NSString *name;
@property(nonatomic,copy) NSString *gender;
@property(nonatomic,copy) NSString *age;

@end
