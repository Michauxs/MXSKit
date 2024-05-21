

#import "NSString+MXSExtension.h"
#import <CommonCrypto/CommonDigest.h>

static NSString* const BYRegexPhoneNo =         @"^[0-9]{11}$";
static NSString* const BYRegexFloatString =     @"((^\\-{0,1}\\d+)|^0)(\\.\\d{0,2}){0,1}$";
static NSString* const BYRegexIntString =       @"^[0-9]{1,}$";
//static NSString* const BYRegexPassword =         @"^[a-zA-z]{1,}[0-9]{1,}$";
static NSString* const BYRegexPassword =        @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,14}$";

static NSString* const BYRegexChinese =        @"^[\\u4e00-\\u9fa5]+$";

@implementation  NSString (MXSExtension)


#pragma mark – MD5 加密 :String转化为md5加密String
+ (NSString *)md5:(NSString *)str {
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
    result[0], result[1], result[2], result[3],
    result[4], result[5], result[6], result[7],
    result[8], result[9], result[10], result[11],
    result[12], result[13], result[14], result[15]
    ];
}

+ (NSString*)makeUUIDString {
//    CFUUIDRef puuid = CFUUIDCreate( nil );
//    CFStringRef uuidString = CFUUIDCreateString( nil, puuid );
//    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidString));
//    CFRelease(puuid);
//    CFRelease(uuidString);
//    return result;
    
    static int kNumber = 15;
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = arc4random() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}

+ (NSString *)JsonStringFromObject:(id)object {
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
    if (error) return nil;
    
    NSString *jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    return jsonString;
}

#pragma mark - 判断String是否为空
- (BOOL)isEmpty {
    if (self.length==0 || self==nil || self==NULL) {
        return YES;
    }
    
    return NO;
}

+ (NSString*)coverTelephoneNoKeyword:(NSString*)teleStr {
    if (teleStr.length < 11) {
        return teleStr;
    }
    NSString *string = [teleStr stringByReplacingOccurrencesOfString:[teleStr substringWithRange:NSMakeRange(3,4)] withString:@"****"];
    return string;
}

- (BOOL)isChinese {
    NSString *regex = BYRegexChinese;
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:self];
}

- (BOOL)isPhoneNo {
    NSString *regex = BYRegexPhoneNo;
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:self];
}
- (BOOL)isFloatString {
    NSString *regex = BYRegexFloatString;
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:self];
}
- (BOOL)isIntString {
    NSString *regex = BYRegexIntString;
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:self];
}
- (BOOL)isPassword {
    if(self.length < 6 || self.length > 14) return NO;
    
    NSString *regex = BYRegexPassword;
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pred evaluateWithObject:self];
}

#pragma mark - 判断String是否含有某个String
- (BOOL)isContain:(NSString*)text {
    if ([self rangeOfString:text].location != NSNotFound) {
        return YES;
    }
    return NO;
}


+ (NSString *)stringWithInteger:(NSInteger)numb {
    return [NSString stringWithFormat:@"%ld", numb];
}
+ (NSString *)stringWithFloat:(double)numb {
    return [NSString stringWithFormat:@"%.2f", numb];
}
+ (NSString *)stringForWanWith:(double)numb {
    NSString *string;
    if (numb >= 10000) {
        string = [NSString stringWithFormat:@"%.2f万", numb*0.0001];
    }
    else {
        string = [NSString stringWithFormat:@"%.2f", numb];
    }
    return string;
}


+ (NSString *)stringWithAOrderAuditStatus:(NSNumber *)numb {
    NSInteger auditStatus = numb.integerValue;
    if (auditStatus == 0) return @"无需审批";
    else if (auditStatus == -1) return @"未提交审批";
    else if (auditStatus == 1) return @"审批通过";
    else if (auditStatus == 2) return @"审批中";
    else if (auditStatus == 3) return @"审批退回";
    else if (auditStatus == 4) return @"审批撤销";
    else return @"未知状态";
}


+ (NSString*)decimalStyleFloatForNumber:(NSNumber*)number {
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.maximumFractionDigits = 2;
    formatter.minimumFractionDigits = 2;
    formatter.groupingSeparator = @",";
    formatter.groupingSize = 3;
    
    NSString *formattedString = [formatter stringFromNumber:number];
    return formattedString;
}
+ (NSString*)decimalStyleIntForNumber:(NSNumber*)number {
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    formatter.maximumFractionDigits = 0;
//    formatter.minimumFractionDigits = 2;
    formatter.groupingSeparator = @",";
    formatter.groupingSize = 3;
    
    NSString *formattedString = [formatter stringFromNumber:number];
    return formattedString;
}


@end
