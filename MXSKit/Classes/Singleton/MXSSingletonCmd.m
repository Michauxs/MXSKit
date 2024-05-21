//
//  MXSSingletonCmd.m
//  MXSSingletonFramework
//
//  Created by Sunfei on 2024/5/20.
//

#import "MXSSingletonCmd.h"

static MXSSingletonCmd *_instance;


@implementation MXSSingletonCmd

+ (MXSSingletonCmd *)shared {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

#pragma mark - MXSDeviceCmd
- (MXSDeviceCmd *)deviceCmd {
    if (!_deviceCmd) {
        @synchronized (_deviceCmd) {
            if(!_deviceCmd) {
                _deviceCmd = [[MXSDeviceCmd alloc] init];
            }
        }
    }
    return _deviceCmd;
}
+ (MXSDeviceCmd *)device {
    return MXSSingletonCmd.shared.deviceCmd;
}

@end
