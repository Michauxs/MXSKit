

#import "UIColor+MXSExtension.h"

@implementation UIColor (MXSExtension)

+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
}


+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue {
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1.0];
}


+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}



//默认alpha值为1
+ (UIColor *)colorWithHexString:(NSString *)color
{
    return [self colorWithHexString:color alpha:1.0f];
}

+ (UIColor*)testColor {
    return [UIColor colorWithRed:38.0/255.0 green:110.0/255.0 blue:255.0/255.0 alpha:1.0];
}

#pragma mark - customs
+ (UIColor*)theme {
    return [UIColor colorWithRed:38.0/255.0 green:110.0/255.0 blue:255.0/255.0 alpha:1.0];
}
+ (UIColor*)themeBorder {
    return [UIColor colorWithRed:189.f/255.0 green:238.f/255.0 blue:233.f/255.0 alpha:1.0];
}
+ (UIColor*)themeLight {
    return [UIColor colorWithRed:198.f/255.0 green:238.f/255.0 blue:233.f/255.0 alpha:1.0];
}
+ (UIColor*)byOrange {
    return [UIColor colorWithR:253 G:153 B:48];
}
+ (UIColor*)byRed {
    return [UIColor colorWithR:233 G:20 B:40];
}
+ (UIColor*)byCyan {
    return [UIColor colorWithR:0 G:174 B:253];
}

+ (UIColor*)black {
    return [UIColor colorWithRed:64.0/255.0 green:64.0/255.0 blue:64.0/255.0 alpha:1.0];
}

+ (UIColor *)dark {
    return [UIColor colorWithRed:115.0/255.0 green:115.0/255.0 blue:115.0/255.0 alpha:1.0];
}

+ (UIColor*)white {
    return [UIColor whiteColor];
}
+ (UIColor *)green {
    return [UIColor colorWithR:31 G:194 B:129];
}
+ (UIColor *)red {
    return [UIColor colorWithR:238 G:38 B:38];
}


+ (UIColor*)gary {
    return [UIColor colorWithRed:178.f / 255.f green:178.f / 255.f blue:178.f / 255.f alpha:1.f];
}
+ (UIColor*)lightGary {
    return [UIColor colorWithRed:204.f / 255.f green:204.f / 255.f blue:204.f / 255.f alpha:1.f];
}
+ (UIColor*)garyLine {
    return [UIColor colorWithRed:221.f / 255.f green:221.f / 255.f blue:221.f / 255.f alpha:1.f];
}
+ (UIColor*)RGB153Gary {
    return [UIColor colorWithRed:153.f / 255.f green:153.f / 255.f blue:153.f / 255.f alpha:1.f];
}
+ (UIColor*)RGB89Gary {
    return [UIColor colorWithRed:89.f / 255.f green:89.f / 255.f blue:89.f / 255.f alpha:1.f];
}
+ (UIColor*)RGB127Gary {
    return [UIColor colorWithRed:127.f / 255.f green:127.f / 255.f blue:127.f / 255.f alpha:1.f];
}
+ (UIColor*)RGB225Gary {
    return [UIColor colorWithRed:225.f / 255.f green:225.f / 255.f blue:225.f / 255.f alpha:1.f];
}

+ (UIColor*)darkBackground {
    return [UIColor colorWithRed:42.0/255.0 green:42.0/255.0 blue:42.0/255.0 alpha:1.0];
}
+ (UIColor*)garyBackground {
    return [UIColor colorWithRed:242.f / 255.f green:243.f / 255.f blue:244.f / 255.f alpha:1.f];
}
+ (UIColor*)disableBackground {
    return [UIColor colorWithRed:144.f / 255.f green:144.f / 255.f blue:144.f / 255.f alpha:1.f];
}

+ (UIColor *)maskAlpha {
    return [UIColor colorWithWhite:0 alpha:0.25f];
}
+ (UIColor*)borderAlpha {
    return [UIColor colorWithWhite:1.f alpha:0.25f];
}

+ (UIColor *)random {
    return [self colorWithRED:(arc4random()%255) GREEN:(arc4random()%255) BLUE:(arc4random()%255) ALPHA:1.f];
}
+ (UIColor *)colorWithRED:(CGFloat)RED GREEN:(CGFloat)GREEN BLUE:(CGFloat)BLUE ALPHA:(CGFloat)ALPHA {
    return [UIColor colorWithRed:RED / 255.0 green:GREEN / 255.0 blue:BLUE / 255.0 alpha:ALPHA];
}
@end
