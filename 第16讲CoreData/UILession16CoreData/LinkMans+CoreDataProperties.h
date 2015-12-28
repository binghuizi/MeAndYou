//
//  LinkMans+CoreDataProperties.h
//  UILession16CoreData
//
//  Created by scjy on 15/12/22.
//  Copyright © 2015年 scjy. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "LinkMans.h"

NS_ASSUME_NONNULL_BEGIN

@interface LinkMans (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *age;
@property (nullable, nonatomic, retain) NSString *gender;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *phoneNumber;
@property (nullable, nonatomic, retain) NSString *remarks;

@end

NS_ASSUME_NONNULL_END
