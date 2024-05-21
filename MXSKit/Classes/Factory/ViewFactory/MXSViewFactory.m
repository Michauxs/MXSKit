

#import "MXSViewFactory.h"
#import "NSObject+MXSExtension.h"

@implementation MXSViewFactory

+ (id)createInstance:(NSString*)name {
    
    Class c = NSClassFromString(name);
    id view = [[c alloc]init];
    return view;
}

@end
