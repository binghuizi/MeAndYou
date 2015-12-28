//
//  MessageFrame.h
//  QQLianXi
//
//  Created by scjy on 15/12/15.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class Message;
@interface MessageFrame : NSObject
@property(nonatomic,assign) CGRect iconImagF;
@property(nonatomic,assign) CGRect timelbleF;
@property(nonatomic,assign) CGRect contentBtnF;
@property(nonatomic,assign) CGFloat cellHeightF;
@property(nonatomic,assign) BOOL hidTime;
@property(nonatomic,strong) Message *msg;
@end
