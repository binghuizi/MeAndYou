//
//  MessageFrame.m
//  QQLianXi
//
//  Created by scjy on 15/12/15.
//
//

#import "MessageFrame.h"
#import "Message.h"
@implementation MessageFrame
- (void)setMsg:(Message *)msg{
    _msg = msg;
    [self setupFrame];
}
- (void)setupFrame{
    CGFloat padding = 10;
    CGFloat iconImgWH = 40;
    CGFloat iconX;
    CGFloat iconY = 3 * padding;
    if (self.msg.type == MessageTypeMe) {
        iconX = 375 - iconImgWH - padding;
    }else{
        iconX = padding;
    }
//1.头像位置
    self.iconImagF = CGRectMake(iconX, iconY, iconImgWH, iconImgWH);
//2.timeble  显示时间的位置
    if (self.hidTime == NO) {
        CGSize timeMaxSize = CGSizeMake(MAXFLOAT, 20);
        NSDictionary * timeArtDict = @{NSFontAttributeName:[UIFont systemFontOfSize:14]};
        //文本实际高度
        CGSize timeSize = [self.msg.time boundingRectWithSize:timeMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:timeArtDict context:nil].size;
        //X坐标
        CGFloat timeX = (375 - timeSize.width) * 0.5;
        self.timelbleF = CGRectMake(timeX, 20, timeSize.width, timeSize.height);
    }
//3.content 对话框的位置
    CGSize contentMaxSize = CGSizeMake(200, MAXFLOAT);
    CGSize contentSize = [self textWithMaxSize:contentMaxSize withFont:[UIFont systemFontOfSize:14] withText:self.msg.text];
    CGFloat iconImgXFloat = CGRectGetMaxX(self.iconImagF);
    CGFloat contentX;
    CGFloat contenty = CGRectGetMaxY(self.iconImagF)*0.5 + padding;
    if (self.msg.type == MessageTypeMe) {
        contentX = 375 - contentSize.width - 2 *padding - iconImgWH - 60;
        
    }else{
        contentX = padding + iconImgXFloat;
    }
    self.contentBtnF = CGRectMake(contentX, contenty, contentSize.width + 60, contentSize.height + 60);
    self.cellHeightF = CGRectGetMaxY(self.contentBtnF) + padding;
    
    
    
}
- (CGSize)textWithMaxSize:(CGSize) textMaxSize withFont:(UIFont *)font withText:(NSString *)text{
    NSDictionary *textDict = @{NSFontAttributeName:font};
    return [text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textDict context:nil].size;
    
}
@end
