#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "NSArray+MXSExtension.h"
#import "NSDate+MXSExtension.h"
#import "NSDictionary+MXSExtension.h"
#import "NSObject+MXSExtension.h"
#import "NSString+MXSExtension.h"
#import "UIButton+MXSExtension.h"
#import "UIColor+MXSExtension.h"
#import "UIImage+MXSExtension.h"
#import "UILabel+MXSExtension.h"
#import "UITextField+MXSExtension.h"
#import "UIView+MXSExtension.h"
#import "MXSVCFactory.h"
#import "MXSDelegateFactory.h"
#import "MXSFactory.h"
#import "MXSViewFactory.h"
#import "MXSKit.h"
#import "MXSDeviceCmd.h"
#import "MXSSingletonCmd.h"

FOUNDATION_EXPORT double MXSKitVersionNumber;
FOUNDATION_EXPORT const unsigned char MXSKitVersionString[];

