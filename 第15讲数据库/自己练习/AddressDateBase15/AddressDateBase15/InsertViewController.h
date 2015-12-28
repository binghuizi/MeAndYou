//
//  InsertViewController.h
//  AddressDateBase15
//
//  Created by scjy on 15/12/20.
//  Copyright © 2015年 scjy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InsertViewController : UIViewController<UITextFieldDelegate>
@property(nonatomic,retain) UITextField *nameKuang;
@property(nonatomic,retain) UITextField *genderKuang;
@property(nonatomic,retain) UITextField *agePassKuang;
@property(nonatomic,retain) UITextField *phoneNumKuang;
@property(nonatomic,retain) UITextField *remarksKuang;

@end
