//
//  Message.h
//  QQLianXi
//
//  Created by scjy on 15/12/15.
//
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSUInteger,MessageType) {
    MessageTypeMe,
    MessageTypeOther
};
@interface Message : NSObject
@property(nonatomic,copy) NSString *text;
@property(nonatomic,copy) NSString *time;
@property(nonatomic,assign,getter=isProxy) BOOL type;
+(instancetype)messageWithDict:(NSDictionary *)dict;

@end
