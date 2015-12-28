//
//  TableViewCell.h
//  CoreData16
//
//  Created by scjy on 15/12/24.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

@end
