

#import "UIImage+MXSExtension.h"

@implementation UIImage (MXSExtension)


+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 *  重新绘制图片
 *  @param color 填充色
 *  @return UIImage
 */
+ (UIImage *)renderImage:(UIImage*)img withColor:(UIColor *)color {
    UIGraphicsBeginImageContextWithOptions(img.size, NO, img.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, img.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, img.size.width, img.size.height);
    CGContextClipToMask(context, rect, img.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

+ (UIImage *)imageFromString:(NSString *)string attributes:(NSDictionary *)attributes size:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    [string drawInRect:CGRectMake(0, 0, size.width, size.height) withAttributes:attributes];
    //    [string drawAtPoint:CGPointMake(size.width*0.5, size.height*0.5) withAttributes:attributes];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bigRect = CGRectMake(0 ,0, size.width, size.height);
    //设置空心圆的线条宽度
    CGContextSetLineWidth(ctx, 1);
    //以矩形bigRect为依据画一个圆
    CGContextAddEllipseInRect(ctx, bigRect);
    //填充当前绘画区域的颜色
    [[UIColor theme] set];
    //(如果是画圆会沿着矩形外围描画出指定宽度的（圆线）空心圆)/（根据上下文的内容渲染图层）
    CGContextStrokePath(ctx);
    
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    /**
     // 画实心圆
     CGRect frame = CGRectMake(kBorderWith + width/4,
     kBorderWith + width/4,
     rect.size.width - kBorderWith*2 - width/2,
     rect.size.height - kBorderWith*2 - width/2);
     //填充当前绘画区域内的颜色
     [[UIColor whiteColor] set];
     //填充当前矩形区域
     CGContextFillRect(ctx, rect);
     //以矩形frame为依据画一个圆
     CGContextAddEllipseInRect(ctx, frame);
     //填充当前绘画区域内的颜色
     [[UIColor orangeColor] set];
     //填充(沿着矩形内围填充出指定大小的圆)
     CGContextFillPath(ctx);
     
     //画空心圆
     CGRect bigRect = CGRectMake(0,0,size,size);
     
     //设置空心圆的线条宽度
     CGContextSetLineWidth(ctx, kBorderWith);
     //以矩形bigRect为依据画一个圆
     CGContextAddEllipseInRect(ctx, bigRect);
     //填充当前绘画区域的颜色
     [[UIColor greenColor] set];
     //(如果是画圆会沿着矩形外围描画出指定宽度的（圆线）空心圆)/（根据上下文的内容渲染图层）
     CGContextStrokePath(ctx);
     
     
     UIGraphicsEndImageContext();
     */
    //    image = [self addBpolygonToImage:image withLineWidth:2 andColor:[UIColor theme]];
    return image;
}

+ (UIImage *)addBpolygonToImage:(UIImage *)image withLineWidth:(CGFloat)lineW andColor:(UIColor *)color{
    //
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0.0);
    //
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    //
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -rect.size.height);
    //
    CGFloat lineWidth = lineW;
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat width = image.size.width;
    CGFloat x, y;
    CGFloat radius = width / 2 - lineWidth / 2;
    CGPoint origin = CGPointMake(width / 2, width / 2);
    for (NSInteger i = 0; i < 7; i++) {
        x = radius * cos(M_PI / 33 * i - M_PI_2) + origin.x;
        y = radius * sin(M_PI / 33 * i - M_PI_2) + origin.y;
        if (i == 0) {
            [path moveToPoint:CGPointMake(x, y)];
        } else {
            [path addLineToPoint:CGPointMake(x, y)];
        }
    }
    [path closePath];
    path.lineWidth = lineWidth;
    path.lineJoinStyle = kCGLineJoinMiter;
    [color setStroke];
    [path stroke];
    //
    CGContextSaveGState(ctx);
    [path addClip];
    CGContextDrawImage(ctx, rect, image.CGImage);
    CGContextRestoreGState(ctx);
    //
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
+ (UIImage*)image:(UIImage*)img WithCornerRadius:(CGFloat)radius{
    CGRect rect = (CGRect){0.f,0.f,img.size};
    //size——同UIGraphicsBeginImageContext,参数size为新创建的位图上下文的大小
    //opaque—透明开关，如果图形完全不用透明，设置为YES以优化位图的存储。
    //scale—–缩放因子
    UIGraphicsBeginImageContextWithOptions(img.size, NO, [UIScreen mainScreen].scale);
    //根据矩形画带圆角的曲线
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
    path.lineWidth = 2;
    
    [path addClip];
    [img drawInRect:rect];
    //图片缩放，是非线程安全的
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)fixOrientation {
    
    // No-op if the orientation is already correct
    if (self.imageOrientation == UIImageOrientationUp) return self;
    
    // We need to calculate the proper transformation to make the image upright.
    // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
    CGAffineTransform transform = CGAffineTransformIdentity;
    
    switch (self.imageOrientation) {
        case UIImageOrientationDown:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
            transform = CGAffineTransformRotate(transform, M_PI);
            break;
            
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformRotate(transform, M_PI_2);
            break;
            
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, 0, self.size.height);
            transform = CGAffineTransformRotate(transform, -M_PI_2);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationUpMirrored:
            break;
    }
    
    switch (self.imageOrientation) {
        case UIImageOrientationUpMirrored:
        case UIImageOrientationDownMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.width, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
            
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRightMirrored:
            transform = CGAffineTransformTranslate(transform, self.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
            break;
        case UIImageOrientationUp:
        case UIImageOrientationDown:
        case UIImageOrientationLeft:
        case UIImageOrientationRight:
            break;
    }
    
    // Now we draw the underlying CGImage into a new context, applying the transform
    // calculated above.
    CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                             CGImageGetBitsPerComponent(self.CGImage), 0,
                                             CGImageGetColorSpace(self.CGImage),
                                             CGImageGetBitmapInfo(self.CGImage));
    CGContextConcatCTM(ctx, transform);
    switch (self.imageOrientation) {
        case UIImageOrientationLeft:
        case UIImageOrientationLeftMirrored:
        case UIImageOrientationRight:
        case UIImageOrientationRightMirrored:
            // Grr...
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
            break;
            
        default:
            CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
            break;
    }
    
    // And now we just create a new UIImage from the drawing context
    CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
    UIImage *img = [UIImage imageWithCGImage:cgimg];
    CGContextRelease(ctx);
    CGImageRelease(cgimg);
    return img;
}


- (UIImage *)creatQRCodeImageFormURLStr:(NSString *)urlStr withSize:(CGFloat)size {
    
    // 1.创建过滤器，这里的@"CIQRCodeGenerator"是固定的
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    // 2.恢复默认设置
    [filter setDefaults];
    
    // 3. 给过滤器添加数据
    NSString *dataString = urlStr;
    NSData *data = [dataString dataUsingEncoding:NSUTF8StringEncoding];
    // 注意，这里的value必须是NSData类型
    [filter setValue:data forKeyPath:@"inputMessage"];
    
    // 4. 生成二维码
    CIImage *outputImage = [filter outputImage];
    //    QRCodeImageView.image = [UIImage imageWithCIImage:outputImage];
    
//    UIImage *trans_img = [self creatNonInterpolatedUIImageFormCIImage:outputImage withSize:code_width];
    
    // 5. 显示二维码
    
    CGRect extent = CGRectIntegral(outputImage.extent);
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    // 1. 创建bitmap
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:outputImage fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    
    return [UIImage imageWithCGImage:scaledImage];
}

@end
