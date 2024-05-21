

#import "UIButton+MXSExtension.h"

@implementation UIButton (MXSExtension)

/**
 *  PS: fontSize.正常数值为细体/300+为正常/600+为粗体
 */
+ (UIButton*)makeWithTitle:(NSString*)title titleColor:(UIColor*)TitleColor fontSize:(CGFloat)font backgroundColor:(UIColor*)backgroundColor {
	
	UIButton *btn = [UIButton new];
	if (title) {
		[btn setTitle:title forState:UIControlStateNormal];
	}
	[btn setTitleColor:TitleColor forState:UIControlStateNormal];
	
	if (font > 600.f) {
		btn.titleLabel.font = [UIFont systemFontOfSize:(font - 600) weight:UIFontWeightBold];
	}
    else if (font > 300.f) {
		btn.titleLabel.font = [UIFont systemFontOfSize:(font - 300) weight:UIFontWeightRegular];
	} 
    else {
		btn.titleLabel.font = [UIFont systemFontOfSize:font weight:UIFontWeightThin];
	}
	
	if (backgroundColor) {
		btn.backgroundColor = backgroundColor;
	} else
		btn.backgroundColor = [UIColor clearColor];
	
	return btn;
}

+ (UIButton*)makeWithNormalTitle:(NSString*)nTitle normalColor:(UIColor*)nColor selectedTitle:(NSString*)sTitle selectedColor:(UIColor*)sColor  fontSize:(CGFloat)font {
    
    UIButton *btn = [UIButton new];
    
    if (nTitle) [btn setTitle:nTitle forState:UIControlStateNormal];
    if (sTitle) [btn setTitle:sTitle forState:UIControlStateSelected];
    
    [btn setTitleColor:nColor forState:UIControlStateNormal];
    [btn setTitleColor:sColor forState:UIControlStateSelected];
    
    if (font > 600.f) {
        btn.titleLabel.font = [UIFont systemFontOfSize:(font - 600) weight:UIFontWeightBold];
    }
    else if (font > 300.f) {
        btn.titleLabel.font = [UIFont systemFontOfSize:(font - 300)];
    } 
    else {
        btn.titleLabel.font = [UIFont systemFontOfSize:font weight:UIFontWeightThin];
    }
    
    return btn;
}

+ (UIButton*)makeWithImgName:(NSString*)imgName backgroundColor:(UIColor*)background policy:(BtnCreatPolicy)policy {
    UIButton *btn = [UIButton new];
    [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    
    if (policy == BtnCreatPolicySelect) {
        [btn setImage:[UIImage imageNamed:[imgName stringByAppendingString:@"_select"]] forState:UIControlStateSelected];
    }
    if (background) {
        btn.backgroundColor = background;
    }
    return btn;
}

+ (UIButton *)makeWithTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)font image:(NSString *)imgName policy:(BtnCreatPolicy)policy backgroundColor:(UIColor *)background {
    
    UIButton *btn = [UIButton new];
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    
    if (font > 600.f) {
        btn.titleLabel.font = [UIFont systemFontOfSize:(font - 600) weight:UIFontWeightBold];
    }
    else if (font > 300.f) {
        btn.titleLabel.font = [UIFont systemFontOfSize:(font - 300)];
    } 
    else {
        btn.titleLabel.font = [UIFont systemFontOfSize:font weight:UIFontWeightThin];
    }
    
    if (background) {
        btn.backgroundColor = background;
    }
    
    
    [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    if (policy == BtnCreatPolicySelect) {
        [btn setImage:[UIImage imageNamed:[imgName stringByAppendingString:@"_select"]] forState:UIControlStateSelected];
    }
    
    return btn;
}



/**
 *  PS: fontSize.正常数值为细体/300+为正常/600+为粗体
 */
+ (UIButton*)makeWithTitle:(NSString*)title titleColor:(UIColor*)TitleColor fontSize:(CGFloat)font {
    
    UIButton *btn = [UIButton new];
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    [btn setTitleColor:TitleColor forState:UIControlStateNormal];
    
    if (font > 600.f) {
        btn.titleLabel.font = [UIFont systemFontOfSize:(font - 600) weight:UIFontWeightBold];
    }
    else if (font > 300.f) {
        btn.titleLabel.font = [UIFont systemFontOfSize:(font - 300)];
    } 
    else {
        btn.titleLabel.font = [UIFont systemFontOfSize:font weight:UIFontWeightThin];
    }
    
    return btn;
}

+ (UIButton*)makeWithImageName:(NSString*)imgName policy:(BtnCreatPolicy)policy {
    UIButton *btn = [UIButton new];
    [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    
    if (policy == BtnCreatPolicySelect) {
        [btn setImage:[UIImage imageNamed:[imgName stringByAppendingString:@"_select"]] forState:UIControlStateSelected];
    }
    
    return btn;
}

+ (UIButton *)makeWithImageName:(NSString *)imgName selectImage:(NSString *)selected {
    UIButton *btn = [UIButton new];
    
    [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    if (selected) {
        [btn setImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
    }
    
    return btn;
}

+ (UIButton *)makeWithTitle:(NSString *)title titleColor:(UIColor *)titleColor fontSize:(CGFloat)font image:(NSString *)imgName selectImage:(NSString *)selected {
    
    UIButton *btn = [UIButton new];
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    
    if (font > 600.f) {
        btn.titleLabel.font = [UIFont systemFontOfSize:(font - 600) weight:UIFontWeightBold];
    }
    else if (font > 300.f) {
        btn.titleLabel.font = [UIFont systemFontOfSize:(font - 300)];
    } 
    else {
        btn.titleLabel.font = [UIFont systemFontOfSize:font weight:UIFontWeightThin];
    }
    
    [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    if (selected) {
        [btn setImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];
    }
    
    return btn;
}

+ (UIButton *)makeWithImageAndText:(NSString *)imgName selected:(NSString*)select title:(NSString *)text titleColor:(UIColor *)TitleColor fontSize:(CGFloat)font margin:(CGFloat)margin {
    UIButton *btn = [UIButton makeWithTitle:text titleColor:TitleColor fontSize:font];
    
    UIImage *image = [UIImage imageNamed:imgName];
    [btn setImage:image forState:UIControlStateNormal];
    if (select) [btn setImage:[UIImage imageNamed:select] forState:UIControlStateSelected];
    
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, margin*0.5, 0, -margin*0.5)];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -margin*0.5, 0, margin*0.5)];
    
    return btn;
}

#pragma mark - 左文字右图片
+ (UIButton *)makeWithTextAndImg:(NSString *)text titleColor:(UIColor *)TitleColor fontSize:(CGFloat)font imgName:(NSString *)imgName margin:(CGFloat)margin {
    
    UIButton *btn = [UIButton makeWithTitle:text titleColor:TitleColor fontSize:font];
    UIImage *image = [UIImage imageNamed:imgName];
    [btn setImage:image forState:UIControlStateNormal];
    
    
    CGSize fSize = [text boundingRectWithSize:CGSizeMake(MAXFLOAT ,100) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:btn.titleLabel.font} context:nil].size;
    
    CGFloat img_offset_x = image.size.width + margin*0.5;
    //    CGFloat title_width = btn.titleLabel.bounds.size.width;   //此时无效
    CGFloat title_offset_x = fSize.width + margin*0.5;
    
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0, -img_offset_x, 0, img_offset_x)];
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, title_offset_x, 0, -title_offset_x)];
    
    return btn;
}

@end
