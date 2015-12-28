//
//  EditeViewController.h
//  AddressDateBase15
//
//  Created by scjy on 15/12/20.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LinkMan.h"
@interface EditeViewController : UIViewController<UITextFieldDelegate>
@property(nonatomic,retain) LinkMan *linkMan;
@property(nonatomic,retain) UITextField *nameKuang;
@property(nonatomic,retain) UITextField *genderKuang;
@property(nonatomic,retain) UITextField *agePassKuang;
@property(nonatomic,retain) UITextField *phoneNumKuang;
@property(nonatomic,retain) UITextField *remarksKuang;
@property(nonatomic,retain) NSString *nameString;
@property(nonatomic,retain) NSString *genderString;
@property(nonatomic,assign) NSInteger ageString;
@property(nonatomic,retain) NSString *phoneNumberString;
@property(nonatomic,retain) NSString *remarkString;


@end
