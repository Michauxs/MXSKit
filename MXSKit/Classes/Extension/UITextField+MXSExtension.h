

#import <UIKit/UIKit.h>
#import "UIColor+MXSExtension.h"
#import "UILabel+MXSExtension.h"

@interface UITextField (MXSExtension)
+ (UITextField*)makeWithPlaceHolder:(NSString*)holder textColor:(UIColor*)color fontSize:(CGFloat)font leftPadding:(CGFloat)padding;
+ (UITextField*)makeWithPlaceHolder:(NSString*)holder textColor:(UIColor*)color fontSize:(CGFloat)font leftPadding:(CGFloat)padding title:(NSString*)title;
@end
