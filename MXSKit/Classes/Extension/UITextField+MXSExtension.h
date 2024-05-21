

#import <UIKit/UIKit.h>

@interface UITextField (MXSExtension)
+ (UITextField*)makeWithPlaceHolder:(NSString*)holder textColor:(UIColor*)color fontSize:(CGFloat)font leftPadding:(CGFloat)padding;
+ (UITextField*)makeWithPlaceHolder:(NSString*)holder textColor:(UIColor*)color fontSize:(CGFloat)font leftPadding:(CGFloat)padding title:(NSString*)title;
@end
