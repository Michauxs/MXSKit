//
//  MXSSingletonCmd.h
//  MXSSingletonFramework
//
//  Created by Sunfei on 2024/5/20.
//

#import <Foundation/Foundation.h>
#import "MXSDeviceCmd.h"

NS_ASSUME_NONNULL_BEGIN

@interface MXSSingletonCmd : NSObject

@property (nonatomic, strong) MXSDeviceCmd *deviceCmd;
+ (MXSDeviceCmd*)device;

@end

NS_ASSUME_NONNULL_END
