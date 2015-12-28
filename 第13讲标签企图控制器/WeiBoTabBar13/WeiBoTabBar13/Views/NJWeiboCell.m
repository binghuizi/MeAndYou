//
//  NJWeiboCell.m
//  WeiBoTabBar13
//
//  Created by scjy on 15/12/14.
//  Copyright (c) 2015年 赵佳慧iOS. All rights reserved.
//

#define NJNameFont [UIFont systemFontOfSize:15]
#define NJTextFont [UIFont systemFontOfSize:16]
#import "NJWeiboCell.h"
#import "NJWeibo.h"
@interface NJWeiboCell ()
@property(nonatomic,weak) UIImageView *iconView;
@property(nonatomic,weak) UIImageView *vipView;
@property(nonatomic,weak) UIImageView *pictureView;
@property(nonatomic,weak) UILabel *nameLabel;
@property(nonatomic,weak) UILabel *introLabel;
@end
@implementation NJWeiboCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *identifier = @"status";
    NJWeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[NJWeiboCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}
//构造方法  在这个方法中添加需要显示的子控件
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
    //1.头像
        UIImageView *iconView = [[UIImageView alloc]init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
     //昵称
        UILabel *nameLabel = [[UILabel alloc]init];
        nameLabel.font = NJNameFont;
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        //VIP
        UIImageView *vipView = [[UIImageView alloc]init];
        vipView.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:vipView];
        self.vipView = vipView;
        //正文
        UILabel *introLabel = [[UILabel alloc]init];
        introLabel.font = NJTextFont;
        introLabel.numberOfLines = 0;
        [self.contentView addSubview:introLabel];
        self.introLabel = introLabel;
        //发表图片
        UIImageView *pictureView = [[UIImageView alloc]init];
        [self.contentView addSubview:pictureView];
        self.pictureView = pictureView;
        
    }
    return self;
}
-(void)setWeiboFrame:(NJWeiboFrame *)weiboFrame{
    _weiboFrame = weiboFrame;
    //赋值数据
    [self settingData];
    //设置frame
    [self settingFrame];
}
//每个位置控件 显示的数据
- (void)settingData{
    NJWeibo *weibo = self.weiboFrame.weibo;
    //设置头像
    self.iconView.image = [UIImage imageNamed:weibo.icon];
    self.nameLabel.text = weibo.name;
    //设置VIP
    if (weibo.vip) {
        self.vipView.hidden = NO;
        self.nameLabel.textColor = [UIColor redColor];
        
    }else{
        self.vipView.hidden = YES;
        self.nameLabel.textColor = [UIColor blackColor];
    }
    //设置正文
    self.introLabel.text = weibo.text;
    //设置是否发表图片
    if (weibo.picture) {
        self.pictureView.image = [UIImage imageNamed:weibo.picture];
        self.pictureView.hidden = NO;
    }else{
        self.pictureView.hidden = YES;
    }
}
//fram  各个空间的高度位置  从定义的fram获取
- (void)settingFrame{
    self.iconView.frame  = self.weiboFrame.iconF;//头像位置
    self.nameLabel.frame = self.weiboFrame.nameF;//昵称位置
    self.vipView.frame   = self.weiboFrame.vipF;//VIP位置
    // 设置正文的frame
        self.introLabel.frame = self.weiboFrame.introF;//正文位置
    
         // 设置配图的frame 发表的是否有图片
    
         if (self.weiboFrame.weibo.picture) {// 有配图
                 self.pictureView.frame = self.weiboFrame.pictrueF;
             }
    
}
//文本高度
- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
 {
         NSDictionary *dict = @{NSFontAttributeName : font};
        // 如果将来计算的文字的范围超出了指定的范围,返回的就是指定的范围
        // 如果将来计算的文字的范围小于指定的范围, 返回的就是真实的范围
         CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
         return size;
     }



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
