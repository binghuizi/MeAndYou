//
//  MangoTableViewCell.h
//  UILession11UITableViewCell
//
//  Created by scjy on 15/12/2.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MangoModel.h"
@interface MangoTableViewCell : UITableViewCell
@property(nonatomic,retain) MangoModel *model;//创建model属性
//定义一个类方法在外部调用   通过传入 model参数 计算出每一个cell的高度
+ (CGFloat)getCellHeightWithMangoModel:(MangoModel *)mangoModel;
+ (CGFloat) getTextHeightWithText:(NSString *)carIntroduce;
@end
