//
//  ManggoView.m
//  UILessionTargetAction5
//
//  Created by scjy on 15/11/24.
//  Copyright (c) 2015年 芒果iOS. All rights reserved.
//

#import "ManggoView.h"
@interface ManggoView(){
    id _traget;//目标将要执行动作对象
    SEL _action;//动作，目标对象将要执行的操作
    
}
@end
@implementation ManggoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadingCustonView];
    }
    return self;
}
-(void)loadingCustonView{
    
}
-(void)addTarget:(id)traget action:(SEL)action{
    //把外部传递过来的动作赋值给ManggoView自身的目标和动作实例变量
    _traget = traget;
    _action = action;
    
}
-(void)addTarget2:(id)traget2 action2:(SEL)action2{
    //把外部传递过来的动作赋值给ManggoView自身的目标和动作实例变量
    _traget = traget2;
    _action = action2;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //当点击之后我们需要让目标去执行对应的动作
    [_traget performSelector:_action];
}

@end
