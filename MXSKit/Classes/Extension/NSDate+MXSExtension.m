

#import "NSDate+MXSExtension.h"

@implementation NSDate (MXSExtension)

+ (NSTimeInterval)timeIntervalFromDateString:(NSString *)dateStr {
    NSTimeInterval end = [[MXSSingletonCmd.shared.defaultDateFormatter dateFromString:dateStr] timeIntervalSince1970];
    return end;
}

/**获取今天的日期*/
+ (NSString *)today {
    NSDate *nowDate = [NSDate date];
//    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
//    [formater setTimeZone:[NSTimeZone defaultTimeZone]];
//    [formater setDateFormat:@"yyyy-MM-dd"];
    NSString *today = [MXSSingletonCmd.shared.defaultDateFormatter stringFromDate:nowDate];
    return today;
}

/**获取这周一的日期*/
+(NSString *)monday {
    //获取当前时间
    NSDate *nowDate = [NSDate date];
    //获取当前日期
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setFirstWeekday:2];  //设定每周的第一天从星期一开始(从星期一开始，则value传入2)
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday | NSCalendarUnitDay fromDate:nowDate];
    //获取今天是周几（注意：美国是按周日为每个星期的第一天来表示的，所以：1－星期天 2－星期一 3－星期二 4－星期三 5－星期四 6－星期五 7－星期六）
    NSInteger weekDay = [components weekday];
    //获取几天是几号
    NSInteger day = [components day];
    //NSLog(@"日期：周%ld-------%ld号",(long)weekDay-1,(long)day);

    //计算当前日期和本周的星期一和星期天相差天数
    long firstDiff;
    if (weekDay == 1){
        firstDiff = -6;
    }else{
        firstDiff = [calendar firstWeekday] - weekDay;
    }
    //NSLog(@"firstDiff: %ld",firstDiff);

    // 在当前日期(去掉时分秒)基础上加上相差的天数
    NSDateComponents *firstDayComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay  fromDate:nowDate];
    [firstDayComponents setDay:day + firstDiff];
    NSDate *firstDayOfWeek = [calendar dateFromComponents:firstDayComponents];
    
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd"];
    NSString *firstDay=[formater stringFromDate:firstDayOfWeek];

    return firstDay;
}



/**获取这周日的日期*/
+(NSString *)sunday{
    //获取当前时间
    NSDate *nowDate = [NSDate date];
    //获取当前日期
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekday | NSCalendarUnitDay fromDate:nowDate];
    //获取今天是周几（注意：美国是按周日为每个星期的第一天来表示的，所以：1－星期天 2－星期一 3－星期二 4－星期三 5－星期四 6－星期五 7－星期六）
    NSInteger weekDay = [components weekday];
    //获取几天是几号
    NSInteger day = [components day];
    //NSLog(@"日期：周%ld-------%ld号",(long)weekDay-1,(long)day);
    
    //计算当前日期和本周的星期一和星期天相差天数
    long lastDiff;
    if (weekDay == 1){
        lastDiff = 0;
        
    }else{
        lastDiff = 8 - weekDay;
    }
    //NSLog(@"lastDiff: %ld",lastDiff);
    
    // 在当前日期(去掉时分秒)基础上加上相差的天数
    NSDateComponents *lastDayComp = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay   fromDate:nowDate];
    [lastDayComp setDay:day + lastDiff];
    NSDate *lastDayOfWeek = [calendar dateFromComponents:lastDayComp];
    
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd"];
    NSString *lastDay=[formater stringFromDate:lastDayOfWeek];
    
    return lastDay;
}



/**获取这个月第一天的日期*/
+(NSString *)firstDayOfMonth{
    NSDate *nowDate = [NSDate date];
    double interval = 0;
    NSDate *firstDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    BOOL OK = [calendar rangeOfUnit:NSCalendarUnitMonth startDate:& firstDate interval:&interval forDate:nowDate];
    
    if (OK) {
        NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];
        [myDateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString *firstDayStr = [myDateFormatter stringFromDate: firstDate];
        return firstDayStr;
    }else {
        return @"";
    }
}


/**获取这个月最后一天的日期*/
+(NSString *)lastDayOfMonth{
    NSDate *nowDate = [NSDate date];
    double interval = 0;
    NSDate *firstDate = nil;
    NSDate *lastDate = nil;
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    BOOL OK = [calendar rangeOfUnit:NSCalendarUnitMonth startDate:& firstDate interval:&interval forDate:nowDate];
    
    if (OK) {
        lastDate = [firstDate dateByAddingTimeInterval:interval - 1];
        NSDateFormatter *myDateFormatter = [[NSDateFormatter alloc] init];
        [myDateFormatter setDateFormat:@"yyyy-MM-dd"];
        NSString *lastDayStr = [myDateFormatter stringFromDate: lastDate];
        return lastDayStr;
    }else {
        return @"";
    }
}



/**获取几个月前的日期*/
+(NSString *)dateBeforeMonth:(NSUInteger)month withDate:(NSString *)date {
    //得到当前的时间
    NSDate * mydate = [NSDate date];
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    if (date) {
        mydate = [dateFormatter dateFromString:date];
    }

    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //NSDateComponents *comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitMonth fromDate:mydate];
    
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:0];
    [adcomps setMonth:-month];
    [adcomps setDay:0];
    
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:mydate options:0];
    NSString *beforDate = [dateFormatter stringFromDate:newdate];
    return beforDate;
}


+ (NSString *)date:(NSString*)date beforeDay:(NSUInteger)day {
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSTimeInterval end = [[dateFormatter dateFromString:date] timeIntervalSince1970];
    NSTimeInterval start = end - 86400 * day;
    NSString *start_date = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:start]];
    
    return start_date;
}

+ (NSString *)dateBeforeDay:(NSUInteger)day {
    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval some_time = now - 86400 * day;
    
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    return [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:some_time]];
}

@end
