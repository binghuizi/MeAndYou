//
//  AddressBookModel.m
//  AddressBook12
//
//  Created by scjy on 15/12/3.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import "AddressBookModel.h"

@implementation AddressBookModel
-(instancetype)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.imageModel  = dict[@"head_image"];
        self.nameModel   = dict[@"name"];
        self.phoneModel  = dict[@"phoneNum"];
        self.genderModel = dict[@"gender"];
        self.ageGender   = dict[@"age"];
        self.hobbyModel  = dict[@"hobby"];
    }
    return self;
}

-(void)dealloc{
    [_imageModel release], _imageModel = nil;
    [_nameModel  release], _nameModel  = nil;
    [_phoneModel release], _phoneModel = nil;
    [super dealloc];
    
}
- (void)getModelFromDictionary:(NSDictionary *)dict abdModelBlock:(void(^)(AddressBookModel *addressModel))addressModel{
    AddressBookModel *address = [[AddressBookModel alloc]initWithDictionary:dict];
    addressModel(address);//回传controll；
}
@end
