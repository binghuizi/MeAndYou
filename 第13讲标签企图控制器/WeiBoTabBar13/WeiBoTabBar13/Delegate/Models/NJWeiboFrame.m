//
//  NJWeiboFrame.m
//  WeiBoTabBar13
//
//  Created by scjy on 15/12/14.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//
#define NJNameFont [UIFont systemFontOfSize:15]
#define NJTextFont [UIFont systemFontOfSize:16]
#import "NJWeiboFrame.h"
#import "NJWeibo.h"
@implementation NJWeiboFrame
-(void)setWeibo:(NJWeibo *)weibo{
    _weibo = weibo;
    //间隙
    float padding = 10;
    //头像
    float iconViewX = padding;
    float iconViewY = padding;
    float iconViewW = 30;
    float iconViewH = 30;
    self.iconF = CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);
    
    //昵称 x = 头像最大的x + 间隙
    CGFloat nameLabelX = CGRectGetMaxX(self.iconF) + padding;
    //文字(昵称)高度
    CGSize nameSize = [self sizeWithString:_weibo.name font:NJNameFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat nameLabelH = nameSize.height;
    CGFloat nameLabelW = nameSize.width;
    CGFloat nameLabelY = iconViewY + (iconViewH - nameLabelH) * 0.5;
    self.nameF = CGRectMake(nameLabelX, nameLabelY, nameLabelW, nameLabelH);
    //VIP
    // 设置vip的frame
         CGFloat vipViewX = CGRectGetMaxX(self.nameF) + padding;
         CGFloat vipViewY = nameLabelY;
         CGFloat vipViewW = 14;
         CGFloat vipViewH = 14;
         self.vipF = CGRectMake(vipViewX, vipViewY, vipViewW, vipViewH);
    
         // 设置正文的frame
         CGFloat introLabelX = iconViewX;
         CGFloat introLabelY = CGRectGetMaxY(self.iconF) + padding;
         CGSize textSize =  [self sizeWithString:_weibo.text font:NJTextFont maxSize:CGSizeMake(300, MAXFLOAT)];
    
         CGFloat introLabelW = textSize.width;
         CGFloat introLabelH = textSize.height;
    
         self.introF = CGRectMake(introLabelX, introLabelY, introLabelW, introLabelH);
    
         // 设置配图的frame
         CGFloat cellHeight = 0;
         if (_weibo.picture) {// 有配图
                 CGFloat pictureViewX = iconViewX;
                 CGFloat pictureViewY = CGRectGetMaxY(self.introF) + padding;
                 CGFloat pictureViewW = 100;
                 CGFloat pictureViewH = 100;
                 self.pictrueF = CGRectMake(pictureViewX, pictureViewY, pictureViewW, pictureViewH);
        
                 // 计算行高
                self.cellHeight = CGRectGetMaxY(self.pictrueF) + padding;
             }else
                 {
                         // 没有配图情况下的行高
                         self.cellHeight = CGRectGetMaxY(self.introF) + padding;
                     }

    
}
//文本高度
-(CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize{
    NSDictionary *dic = @{NSFontAttributeName:font};
    CGSize size = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size;
}
@end
