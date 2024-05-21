

#import <UIKit/UIKit.h>

@interface UIImage (MXSExtension)

/**
 *  根据颜色返回Image
 *
 *  @param color   颜色
 *
 *  @return UIImage
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

- (UIImage *)fixOrientation;

/**
 *  重新绘制图片
 *  @param color 填充色
 *  @return UIImage
 */
+ (UIImage *)renderImage:(UIImage*)img withColor:(UIColor *)color;

+ (UIImage *)imageFromString:(NSString *)string attributes:(NSDictionary *)attributes size:(CGSize)size;



- (UIImage *)creatQRCodeImageFormURLStr:(NSString *)urlStr withSize:(CGFloat)size;



@end
