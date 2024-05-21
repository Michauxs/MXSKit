

#import "UIView+MXSExtension.h"

@implementation UIView (MXSExtension)
- (CGFloat)tz_left {
    return self.frame.origin.x;
}

- (void)setTz_left:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)tz_top {
    return self.frame.origin.y;
}

- (void)setTz_top:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)tz_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setTz_right:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)tz_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setTz_bottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)tz_width {
    return self.frame.size.width;
}

- (void)setTz_width:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)tz_height {
    return self.frame.size.height;
}

- (void)setTz_height:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)tz_centerX {
    return self.center.x;
}

- (void)setTz_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)tz_centerY {
    return self.center.y;
}

- (void)setTz_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)tz_origin {
    return self.frame.origin;
}

- (void)setTz_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)tz_size {
    return self.frame.size;
}

- (void)setTz_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

+ (void)showOscillatoryAnimationWithLayer:(CALayer *)layer type:(TZOscillatoryAnimationType)type{
    NSNumber *animationScale1 = type == TZOscillatoryAnimationToBigger ? @(1.15) : @(0.5);
    NSNumber *animationScale2 = type == TZOscillatoryAnimationToBigger ? @(0.92) : @(1.15);
    
    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
        [layer setValue:animationScale1 forKeyPath:@"transform.scale"];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
            [layer setValue:animationScale2 forKeyPath:@"transform.scale"];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionBeginFromCurrentState | UIViewAnimationOptionCurveEaseInOut animations:^{
                [layer setValue:@(1.0) forKeyPath:@"transform.scale"];
            } completion:nil];
        }];
    }];
}




#pragma mark - UI
- (void)setRadius:(CGFloat)radius borderWidth:(CGFloat)width borderColor:(UIColor*)borderColor background:(UIColor*)backColor {
    self.layer.cornerRadius = radius;
    self.layer.borderWidth = width;
    
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    if (radius > 0) self.clipsToBounds = YES;
    
    if (borderColor) {
        self.layer.borderColor = borderColor.CGColor;
    }
    if (backColor) {
        self.backgroundColor = backColor;
    }
}

- (void)drawLineWithColor:(UIColor *)color frame:(CGRect)frame {
    CALayer *line = [CALayer layer];
    line.backgroundColor = color.CGColor;
    line.frame = frame;
    [self.layer addSublayer:line];
}

- (void)drawDotLineWithColor:(UIColor *)color frame:(CGRect)frame pattern:(NSArray *)pat {
//    CAShapeLayer *border = [CAShapeLayer layer];
//    //  线条颜色
//    border.strokeColor = color.CGColor;
//    border.fillColor = nil;
//
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(0, 0)];
//    if (CGRectGetWidth(self.frame) > CGRectGetHeight(self.frame)) {
//        [path addLineToPoint:CGPointMake(self.bounds.size.width, 0)];
//    }else{
//        [path addLineToPoint:CGPointMake(0, self.bounds.size.height)];
//    }
//    border.path = path.CGPath;
//    border.frame = self.bounds;
//    // 不要设太大 不然看不出效果
//    border.lineWidth = 0.5;
//    border.lineCap = @"butt";
//
//    //  第一个是 线条长度   第二个是间距    nil时为实线
//    border.lineDashPattern = @[@6, @10];
//    [self.layer addSublayer:border];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = frame;
//    [shapeLayer setBounds:self.bounds];
//    [shapeLayer setPosition:self.center];
    [shapeLayer setFillColor:nil];
    // 设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:[color CGColor]];
    // 3.0f设置虚线的宽度
    [shapeLayer setLineWidth:frame.size.height];
    [shapeLayer setLineJoin:kCALineJoinRound];
    // 3=线的宽度 1=每条线的间距
    [shapeLayer setLineDashPattern:pat];
    // Setup the path
    CGMutablePathRef path = CGPathCreateMutable();
    // 0,10代表初始坐标的x，y
    // 320,10代表初始坐标的x，y
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, frame.size.width,0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    // 可以把self改成任何你想要的UIView, 下图演示就是放到UITableViewCell中的
    [[self layer] addSublayer:shapeLayer];
}

- (void)setImageViewContentMode {
    self.clipsToBounds = YES;
    self.contentMode = UIViewContentModeScaleAspectFill;
}

@end
