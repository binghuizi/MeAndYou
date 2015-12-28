//
//  MangoView.m
//  UILessonDelegate
//
//  Created by 张茫原 on 15/11/24.
//  Copyright © 2015年 芒果科技. All rights reserved.
//

#import "MangoView.h"

#define kWidth self.frame.size.width

@implementation MangoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadingCustomView];
    }
    return self;
}

- (void)loadingCustomView{
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 120, kWidth - 60, 44)];
    //文字居中显示
    self.nameLabel.textAlignment = NSTextAlignmentCenter;
    //字体
    self.nameLabel.font = [UIFont systemFontOfSize:24.0];
    //字体颜色
    self.nameLabel.textColor = [UIColor brownColor];
    //文字
    self.nameLabel.text = @"芒果iOS";
    //背景颜色
    self.nameLabel.backgroundColor = [UIColor cyanColor];
    [self addSubview:self.nameLabel];
    [self.nameLabel release];
    
    self.btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.btn.frame = CGRectMake(50, 200, kWidth - 100, 44);
    //背景颜色
    [self.btn setBackgroundColor:[UIColor redColor]];
    //标题颜色
    [self.btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //按钮标题
    [self.btn setTitle:@"翻滚吧" forState:UIControlStateNormal];
    [self addSubview:self.btn];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
