

#import <UIKit/UIKit.h>

@interface UIColor (MXSExtension)

/**
 *  根据RGB值返回颜色
 *
 *  @param red   R值    0 ~~ 255.0
 *  @param green G值    0 ~~ 255.0
 *  @param blue  B值    0 ~~ 255.0
 *  @param alpha 透明度    0 ~~ 1.0
 *
 *  @return RGB颜色
 */
+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue alpha:(CGFloat)alpha;

/**
 *  根据RGB值返回颜色
 *
 *  @param red   R值    0 ~~ 255.0
 *  @param green G值    0 ~~ 255.0
 *  @param blue  B值    0 ~~ 255.0
 *
 *  @return RGB颜色
 */
+ (UIColor *)colorWithR:(CGFloat)red G:(CGFloat)green B:(CGFloat)blue;

/**
 *  从十六进制字符串获取颜色
 *
 *  @param color 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 *  @param alpha 透明度    0 ~~ 1.0
 *
 *  @return RGB颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/**
 *  从十六进制字符串获取颜色
 *
 *  @param color 支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 *
 *  @return RGB颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color;

@property(class, nonatomic, readonly) UIColor *testColor;      // 0.0 white

+ (UIColor*)theme;
+ (UIColor*)byOrange;
+ (UIColor*)byRed;
+ (UIColor*)byCyan;
+ (UIColor*)themeLight;
+ (UIColor*)random;
+ (UIColor*)white;

+ (UIColor *)green;
+ (UIColor *)red;
+ (UIColor *)black;
+ (UIColor *)dark;
+ (UIColor *)gary;
+ (UIColor *)lightGary;

+ (UIColor *)garyLine;
+ (UIColor *)garyBackground;
+ (UIColor *)maskAlpha;

+ (UIColor*)RGB153Gary;
+ (UIColor*)RGB89Gary;
+ (UIColor*)RGB127Gary;
+ (UIColor*)RGB225Gary;

@end
