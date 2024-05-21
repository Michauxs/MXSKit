//
//  MXSDeviceCmd.h
//  MXSSingletonFramework
//
//  Created by Sunfei on 2024/5/20.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define IMGRESOURE(NAME)        [UIImage imageNamed:NAME]
#define SCREEN_WIDTH            [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT           [UIScreen mainScreen].bounds.size.height
#define SCREEN_SCALE            [UIScreen mainScreen].scale


NS_ASSUME_NONNULL_BEGIN

@interface MXSDeviceCmd : NSObject


@property (nonatomic, strong) NSDictionary *statusBarHeight;
@property (nonatomic, assign) CGFloat NavBarMaxY;
@property (nonatomic, assign) CGFloat StatusBarH;
@property (nonatomic, assign) CGFloat HomeIndicatorH;

- (void)sendNavHeight;

@end

NS_ASSUME_NONNULL_END
