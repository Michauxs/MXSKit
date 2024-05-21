

#import "UILabel+MXSExtension.h"

static NSString *kBYLabelPickTips =         @"请选择";
static NSString *kBYLabelInputTips =        @"请输入";

@implementation UILabel (MXSExtension)

@dynamic textWithHolder;
@dynamic textUncertain;

#pragma mark -- UI
- (void)setTextWith:(NSString *)text placehold:(NSString *)hold {
    if (text) {
        self.textColor = [UIColor black];
        self.text = text;
    } else {
        self.textColor = [UIColor gary];
        
        if (hold) {
            self.text = hold;
        } else {
            self.text = kBYLabelPickTips;
        }
    }
}
- (void)setText:(NSString *)text WithPlacehold:(NSString *)hold {
    if ([text length] != 0) {
        self.textColor = [UIColor black];
        self.text = text;
    }
    else {
        self.textColor = [UIColor gary];
        self.text = hold ? hold : @"";
    }
}
- (void)setTextWithHolder:(NSString *)holdText {
    if (holdText) {
        self.textColor = [UIColor black];
        self.text = holdText;
    } else {
        self.textColor = [UIColor gary];
        self.text = kBYLabelPickTips;
    }
}

- (void)setTextUncertain:(NSString *)textUncertain {
    if (textUncertain.length != 0) {
        self.text = textUncertain;
    }
}


/**
 *  PS: fontSize.正常数值为细体/300+为正常/600+为粗体
 */
+ (UILabel*)makeWithText:(NSString*)text textColor:(UIColor*)color fontSize:(CGFloat)font textAlignment:(NSTextAlignment)align {
    
    UILabel *label = [UILabel new];
    if (text){
        label.text = text;
    }
    label.textColor = color;
    label.numberOfLines = 0;
    
    if (align == 0) {
        label.textAlignment = NSTextAlignmentLeft;
    } else {
        label.textAlignment = align;
    }
    
    if (font > 600.f) {
        label.font = [UIFont systemFontOfSize:font - 600 weight:UIFontWeightBold];
    }
    else if (font > 300.f) {
        label.font = [UIFont systemFontOfSize:(font - 300)];
    } 
    else {
        label.font = [UIFont systemFontOfSize:font weight:UIFontWeightThin];
    }
    
    //    label.edgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    
    return label;
}

@end
