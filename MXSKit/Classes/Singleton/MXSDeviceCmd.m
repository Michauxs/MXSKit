//
//  MXSDeviceCmd.m
//  MXSSingletonFramework
//
//  Created by Sunfei on 2024/5/20.
//

#import "MXSDeviceCmd.h"

@implementation MXSDeviceCmd

- (instancetype)init {
    if (self = [super init]) {
        _statusBarHeight = @{@"375812":@44,
                             @"414896":@44,
                             @"390844":@47,
                             @"428926":@44,
                             @"360780":@50,
                             @"393852":@59,
                             @"430932":@59,
        };
        
        _StatusBarH = [[self.statusBarHeight objectForKey:[NSString stringWithFormat:@"%.f%.f", SCREEN_WIDTH, SCREEN_HEIGHT]] floatValue];
        if (_StatusBarH == 0) _StatusBarH = 20.f;
        
        _NavBarMaxY = _StatusBarH + 44.f;
        
        if (_StatusBarH == 20.f) {
            _HomeIndicatorH = 0.f;
        }
        else _HomeIndicatorH = 34.f;
    }
    return self;
}


- (void)sendStatusHeight {
    NSLog(@"statusBar height: %.2f", _StatusBarH);
}

@end
