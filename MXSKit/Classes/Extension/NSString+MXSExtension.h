

#import <UIKit/UIKit.h>

@interface  NSString (MXSExtension)

/**MD5 加密 :String转化为md5加密String*/
+ (NSString*)md5:(NSString *)str;
+ (NSString*)makeUUIDString;
+ (NSString*)JsonStringFromObject:(id)object;

/**判断String是否为空*/
- (BOOL)isEmpty;

+ (NSString*)coverTelephoneNoKeyword:(NSString*)teleStr;
@property(nonatomic, readonly) BOOL isPhoneNo;
@property(nonatomic, readonly) BOOL isPassword;
@property(nonatomic, readonly) BOOL isFloatString;
@property(nonatomic, readonly) BOOL isIntString;
@property(nonatomic, readonly) BOOL isChinese;
//- (BOOL)isPhoneNo;

/**判断String是否含有某个String*/
-(BOOL)isContain:(NSString*)text;

+ (NSString*)stringWithInteger:(NSInteger)numb;
+ (NSString*)stringWithFloat:(double)numb;
+ (NSString*)stringForWanWith:(double)numb;


/**单据状态 枚举-文字*/
+ (NSString*)stringWithAOrderAuditStatus:(NSNumber*)numb;

/***/
+ (NSString*)decimalStyleFloatForNumber:(NSNumber*)number;
+ (NSString*)decimalStyleIntForNumber:(NSNumber*)number;

@end
