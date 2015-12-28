//
//  MessageTableViewCell.m
//  QQLianXi
//
//  Created by scjy on 15/12/15.
//
//

#import "MessageTableViewCell.h"
#import "Message.h"
#import "MessageFrame.h"
@interface MessageTableViewCell()
@property(nonatomic,weak) UIImageView *iconImg;
@property(nonatomic,weak) UILabel *timeble;
@property(nonatomic,weak) UIButton *contentBtn;

@end
@implementation MessageTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //1.头像
        UIImageView *iconImg = [[UIImageView alloc]init];
        [self.contentView addSubview:iconImg];
        //2.timeble
        UILabel *timeble = [[UILabel alloc]init];
        timeble.font = [UIFont systemFontOfSize:14];
        timeble.numberOfLines = 0;
        
        [self.contentView addSubview:timeble];
        self.timeble = timeble;
        //3.content
        UIButton *contentBun = [[UIButton alloc]init];
        contentBun.userInteractionEnabled = NO;
        [contentBun setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        contentBun.titleLabel.font = [UIFont systemFontOfSize:14];
        contentBun.titleLabel.numberOfLines = 0;
        //压缩文字
        contentBun.contentEdgeInsets = UIEdgeInsetsMake(30, 30, 30, 30);
        [self.contentView addSubview:contentBun];
        self.contentBtn = contentBun;
        self.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
        
        
    }
    return  self;
}
-(void)setMsgF:(MessageFrame *)msgF{
    _msgF=msgF;
    
    [self setupData];
    
    [self setupFrame];
}

-(void)setupData{
    Message *msg = self.msgF.msg;
    //1.设置数据
    if (msg.type == MessageTypeMe) {
        self.iconImg.image = [UIImage imageNamed:@"me"];
        
    }else{
        self.iconImg.image = [UIImage imageNamed:@"other"];
        
    }
    self.timeble.text = msg.time;
    [self.contentBtn setTitle:msg.text forState:UIControlStateNormal
     ];
}

- (void)setupFrame{
    self.iconImg.frame = self.msgF.iconImagF;
    self.timeble.frame = self.msgF.timelbleF;
    self.contentBtn.frame = self.msgF.contentBtnF;
    if (self.msgF.msg.type == MessageTypeMe) {
         [self.contentBtn setBackgroundImage:[self stretchableImg: [UIImage imageNamed:@"chat_recive_nor"]] forState:(UIControlStateNormal)];
        [self.contentBtn setBackgroundImage:[self stretchableImg: [UIImage imageNamed:@"chat_recive_press_pic"]] forState:(UIControlStateHighlighted)];
    }
}

- (UIImage *)stretchableImg:(UIImage *)image{
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
