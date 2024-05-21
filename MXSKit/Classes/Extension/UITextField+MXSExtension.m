

#import "UITextField+MXSExtension.h"

@implementation UITextField (MXSExtension)

+ (UITextField*)makeWithPlaceHolder:(NSString*)holder textColor:(UIColor*)color fontSize:(CGFloat)font leftPadding:(CGFloat)padding {
    UITextField *field = [UITextField new];
    if (holder) {
        field.placeholder = holder;
    }
    field.textColor = color;
    
    if (font > 600.f) {
        field.font = [UIFont systemFontOfSize:(font - 600) weight:UIFontWeightBold];
    }
    else if (font > 300.f) {
        field.font = [UIFont systemFontOfSize:(font - 300)];
    } 
    else {
        field.font = [UIFont systemFontOfSize:font weight:UIFontWeightThin];
    }
    
    if (padding != 0) {
        field.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, padding, 0)];
        field.leftViewMode = UITextFieldViewModeAlways;
    }
    
    field.clearButtonMode = UITextFieldViewModeWhileEditing;
    field.returnKeyType = UIReturnKeyDone;
    
    return field;
}

+ (UITextField*)makeWithPlaceHolder:(NSString*)holder textColor:(UIColor*)color fontSize:(CGFloat)font leftPadding:(CGFloat)padding title:(NSString*)title {
    UITextField *field = [UITextField new];
    if (holder) {
        field.placeholder = holder;
    }
    field.textColor = color;
    
    if (font > 600.f) {
        field.font = [UIFont systemFontOfSize:(font - 600) weight:UIFontWeightBold];
    }
    else if (font > 300.f) {
        field.font = [UIFont systemFontOfSize:(font - 300)];
    } 
    else {
        field.font = [UIFont systemFontOfSize:font weight:UIFontWeightThin];
    }
    
    if (padding != 0) {
        field.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, padding, 0)];
        field.leftViewMode = UITextFieldViewModeAlways;
    }
    
    if (title) {
        UILabel *titleLabel = [UILabel makeWithText:title textColor:UIColor.black fontSize:314 textAlignment:0];
        [field addSubview:titleLabel];
        titleLabel.frame = CGRectMake(0, 0, 200, 44);
    }
    
    field.clearButtonMode = UITextFieldViewModeWhileEditing;
    field.returnKeyType = UIReturnKeyDone;
    
    return field;
}

@end
