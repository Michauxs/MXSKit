

#import <Foundation/Foundation.h>
#import "MXSSingletonCmd.h"

@interface NSDate (MXSExtension)

//获取今天的日期
+ (NSString *)today;
//获取本周一的日期
+ (NSString *)monday;
//获取本周日的日期
+ (NSString *)sunday;


//获取本月第一天的日期
+ (NSString *)firstDayOfMonth;
//获取本月最后一天的日期
+ (NSString *)lastDayOfMonth;


//获取几日前的日期
+ (NSString *)dateBeforeDay:(NSUInteger)day;
//获取几个月前的日期
+ (NSString *)dateBeforeMonth:(NSUInteger)month withDate:(NSString*)date;
//获取指定日期几日前的日期
+ (NSString *)date:(NSString*)date beforeDay:(NSUInteger)day;


+ (NSTimeInterval)timeIntervalFromDateString:(NSString*)dateStr;

@end
