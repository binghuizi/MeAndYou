//
//  AddressBookTableViewCell.h
//  AddressBook12
//
//  Created by scjy on 15/12/3.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddressBookModel.h"
@interface AddressBookTableViewCell : UITableViewCell
//@property(nonatomic,retain) NSString *imageName;
//@property(nonatomic,retain) NSString *name;
//@property(nonatomic,retain) NSString *phoneNumber;

@property(nonatomic,retain) AddressBookModel *model;
+(CGFloat)getCellWithHeight:(AddressBookModel *)addressModel;
@end
