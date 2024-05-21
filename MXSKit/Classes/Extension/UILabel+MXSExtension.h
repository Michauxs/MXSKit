

#import <UIKit/UIKit.h>

@interface UILabel (MXSExtension)

/**
 **holdText为nil=显示placeholder
 */
@property (nonatomic, strong) NSString *textWithHolder;

/**不确定是否存在的字符*/
@property (nonatomic, strong) NSString *textUncertain;

/**
 **text为nil=字体灰色
 **hold为nil=默认设置
 */
- (void)setText:(NSString *)text WithPlacehold:(NSString *)hold;
/**
 *  fontSize.正常数值为细体/300+正常/600+粗体
 */
+ (UILabel*)makeWithText:(NSString*)text textColor:(UIColor*)color fontSize:(CGFloat)font textAlignment:(NSTextAlignment)align;

@end
