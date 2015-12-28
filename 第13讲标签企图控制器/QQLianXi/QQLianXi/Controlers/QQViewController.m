//
//  QQViewController.m
//  QQLianXi
//
//  Created by scjy on 15/12/15.
//
//

#import "QQViewController.h"
#import "Message.h"
#import "MessageFrame.h"
#import "MessageTableViewCell.h"
@interface QQViewController ()
@property(nonatomic,weak) IBOutlet UITableView *tableView;
//显示菜单
@property(nonatomic,strong) UIMenuController *menuController;
@property(nonatomic,weak) IBOutlet UITextField *textField;
@property(nonatomic,weak) IBOutlet UIView *buttomMenuView;
@property(nonatomic,strong) NSMutableArray *msgf;

@end

@implementation QQViewController
//懒加载菜单控制器
-(UIMenuController *)menuController{
    if (_menuController == nil) {
        _menuController = [UIMenuController sharedMenuController];
        UIMenuItem *copyItem = [[UIMenuItem alloc]initWithTitle:@"复制" action:@selector(doCopy)];
        UIMenuItem * shareItem=[[UIMenuItem alloc] initWithTitle:@"转发" action:@selector(doShare)];
        
        UIMenuItem * collectorItem=[[UIMenuItem alloc] initWithTitle:@"收藏" action:@selector(doCollector)];
        
        UIMenuItem * composeItem=[[UIMenuItem alloc] initWithTitle:@"转发" action:@selector(doCompose)];
        
        UIMenuItem * deleteItem=[[UIMenuItem alloc] initWithTitle:@"删除" action:@selector(doDelete)];
        [_menuController setMenuItems:@[copyItem,shareItem,collectorItem,composeItem,deleteItem]];
        [_menuController setArrowDirection:(UIMenuControllerArrowDown)];
    }
    return _menuController;
}
-(void)doCopy{
    NSLog(@"doCopy");
}
-(void)doShare{
    NSLog(@"doShare");
}
-(void)doCollector{
    NSLog(@"doCollector");
}
-(void)doCompose{
    NSLog(@"doCompose");
}
-(void)doDelete{
    NSLog(@"doDelete");
}
#pragma mark UIMenuController必须实现的两个方法
-(BOOL)canBecomeFirstResponder{
    return YES;
}
//根据action 判断UIMenuController是否显示对应action的title
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if (action == @selector(doCopy) || action == @selector(doShare) || action == @selector(doCollector) || action == @selector(doCompose) || action == @selector(doDelete)) {
        return YES;
    }
    return NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //分离器
    //self.view.backgroundColor = [UIColor blackColor];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    UIView *leftView = [[UIView alloc]initWithFrame:CGRectMake(15, 0, 10, 0)];
    self.textField.leftView = leftView;
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.textField.delegate = self;
    
}
//监听键盘的滚动
- (void)keyBoardChangeFrame:(NSNotification *)info{
    NSDictionary *infoDict = info.userInfo;
    
    CGRect keyBoardRect = [infoDict[@"UIKeyboardFrameEndUserInfoKey"]CGRectValue];
    CGFloat keyBoardTranslate = keyBoardRect.origin.y - self.view.frame.size.height;
    [UIView animateWithDuration:[infoDict[@"UIKeyboardAnimationCurveUserInfoKey"]doubleValue]delay:0 options:7 << 16 animations:^{
        CGRect viewF = self.view.frame;
        viewF.origin.y = keyBoardTranslate;
        self.view.frame = viewF;
    }completion:nil];
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    //1.修改模型
    MessageFrame *addMsgF = [[MessageFrame alloc]init];
    Message *msg = [[Message alloc]init];
    msg.text = self.textField.text;
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm";
    msg.time = [dateFormatter stringFromDate:date];
    msg.type = MessageTypeMe;
    addMsgF.msg = msg;
    [self.msgf addObject:addMsgF];
    //2.刷新UITableViewCell
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.msgf.count - 1 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationNone)];
    //3.自适应
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:(UITableViewScrollPositionBottom) animated:YES];
    self.textField.text = nil;
    return YES;
}
//解析
- (NSMutableArray *)msgF{
    if (_msgf == nil) {
        NSString *msgPath = [[NSBundle mainBundle]pathForResource:@"messages.plist" ofType:nil];
        NSArray *msgArr = [NSArray arrayWithContentsOfFile:msgPath];
        NSMutableArray *msgM = [NSMutableArray arrayWithCapacity:msgArr.count];
        for (NSDictionary *dict in msgArr) {
            Message *msg = [Message messageWithDict:dict];
            MessageFrame *msgF = [[MessageFrame alloc]init];
            //最后获取一个fram
            MessageFrame *lastMsgF = [msgM lastObject];
            Message *lastMess = lastMsgF.msg;
            if ([lastMess.time isEqualToString:msg.time]) {
                msgF.hidTime=YES;
            }
            msgF.msg = msg;
            [msgM addObject:msgF];
        }
        _msgf = msgM;
    }
    return _msgf;
   
}
//结束编辑
-(void)textFieldDidEndEditing:(UITextField *)textField{
    self.textField.text=nil;
}
//行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.msgf.count;
}


//返回一个具体的cell-
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[MessageTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.selectedBackgroundView = [[UIView alloc]init];
    MessageFrame *msgF = self.msgf[indexPath.row];
    cell.msgF = msgF;
    return cell;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
    
}
//自定义高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    MessageFrame *msgF = self.msgf[indexPath.row];
    return msgF.cellHeightF;
    
}
//触发事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view endEditing:YES];
    MessageTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    CGRect contentRect;
    UIButton *contentBtn;
    for (UIView *subView in cell.contentView.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            contentBtn = (UIButton *)subView;
            contentRect = subView.frame;
        }
    }
    [self.menuController setTargetRect:contentRect inView:contentBtn.superview];
    [self.menuController setMenuVisible:YES animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
