//
//  AddressBookModel.h
//  AddressBook12
//
//  Created by scjy on 15/12/3.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressBookModel : NSObject
@property(nonatomic,retain) NSString *imageModel;
@property(nonatomic,retain) NSString *nameModel;
@property(nonatomic,retain) NSString *phoneModel;
@property(nonatomic,retain) NSString *genderModel;
@property(nonatomic,retain) NSString *ageGender;
@property(nonatomic,retain) NSString *hobbyModel;

- (void)getModelFromDictionary:(NSDictionary *)dict abdModelBlock:(void(^)(AddressBookModel *addressModel))addressModel;

@end
