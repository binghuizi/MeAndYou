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
    [_imageModel release],  _imageModel = nil;
    [_nameModel  release],  _nameModel  = nil;
    [_phoneModel release],  _phoneModel = nil;
    [_genderModel release],_genderModel = nil;
    [_ageGender release],    _ageGender = nil;
    [_hobbyModel release],  _hobbyModel = nil;
    [super dealloc];
    
}
- (void)getModelFromDictionary:(NSDictionary *)dict abdModelBlock:(void(^)(AddressBookModel *addressModel))addressModel{
    AddressBookModel *address = [[AddressBookModel alloc]initWithDictionary:dict];
    addressModel(address);//回传controll；
}

-(id)initWithImageName:(NSString *)imageName
                  name:(NSString *)name
           phoneNumber:(NSString *)phoneNumber
                gender:(NSString *)gender
                   age:(NSString *)age
                 hobby:(NSString *)hobby{
    self = [super init];
    if (self) {
        _imageModel = imageName;
        _nameModel = name;
        _phoneModel = phoneNumber;
        _genderModel = gender;
        _ageGender   = age;
        _hobbyModel = hobby;
    }
    return self;
}

+(instancetype)addressBookWithImageName:(NSString *)imageName
                                   name:(NSString *)name
                            phoneNumber:(NSString *)phoneNumber
                                 gender:(NSString *)gender
                                    age:(NSString *)age
                                  hobby:(NSString *)hobby{
    AddressBookModel *addB = [[AddressBookModel alloc]initWithImageName:imageName name:name phoneNumber:phoneNumber gender:gender age:age hobby:hobby];
    return addB;
}


@end
