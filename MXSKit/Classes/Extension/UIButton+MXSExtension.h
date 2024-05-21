

#import <UIKit/UIKit.h>

typedef enum : int {
    BtnCreatPolicyNormal = 0,
    BtnCreatPolicySelect,
} BtnCreatPolicy;

@interface UIButton (MXSExtension)

/**
 *  PS: fontSize.正常数值为细体/300+为正常/600+为粗体
 */
+ (UIButton*)makeWithTitle:(NSString*)title titleColor:(UIColor*)TitleColor fontSize:(CGFloat)font backgroundColor:(UIColor*)backgroundColor;
+ (UIButton*)makeWithNormalTitle:(NSString*)nTitle normalColor:(UIColor*)nColor selectedTitle:(NSString*)sTitle selectedColor:(UIColor*)sColor  fontSize:(CGFloat)font;

+ (UIButton*)makeWithImgName:(NSString*)imgName backgroundColor:(UIColor*)background policy:(BtnCreatPolicy)policy;

+ (UIButton*)makeWithTitle:(NSString*)title titleColor:(UIColor*)titleColor fontSize:(CGFloat)font image:(NSString*)imgName policy:(BtnCreatPolicy)policy backgroundColor:(UIColor*)background;



/**
 *  PS: fontSize.正常数值为细体/300+为正常/600+为粗体
 */
+ (UIButton*)makeWithTitle:(NSString*)title titleColor:(UIColor*)TitleColor fontSize:(CGFloat)font;

/**若设置policy为BtnCreatPolicySelect -- 选中状态图片名后缀必须是 “_select”*/
+ (UIButton*)makeWithImageName:(NSString*)imgName policy:(BtnCreatPolicy)policy;

+ (UIButton*)makeWithImageName:(NSString*)imgName selectImage:(NSString*)selected;

/**若设置普通和选中状态*/
+ (UIButton*)makeWithTitle:(NSString*)title titleColor:(UIColor*)titleColor fontSize:(CGFloat)font image:(NSString*)imgName selectImage:(NSString*)selected;

/**左图片右文字*/
+ (UIButton *)makeWithImageAndText:(NSString*)imgName selected:(NSString*)select title:(NSString *)text titleColor:(UIColor *)TitleColor fontSize:(CGFloat)font margin:(CGFloat)margin;

/**左文字右图片*/
+ (UIButton*)makeWithTextAndImg:(NSString*)text titleColor:(UIColor*)TitleColor fontSize:(CGFloat)font imgName:(NSString*)imgName margin:(CGFloat)margin;




@end
