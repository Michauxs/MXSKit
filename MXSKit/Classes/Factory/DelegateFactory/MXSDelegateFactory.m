

#import "MXSDelegateFactory.h"
#import "NSObject+MXSExtension.h"
//#import "BYTableDelegate.h"
//#import "BYCollectionDelegate.h"

@implementation MXSDelegateFactory

+ (id)createInstance:(NSString*)name {
    
    Class c = NSClassFromString(name);
    id delegate = [[c alloc]init];
    
    [delegate callMethodWithName:@"postPerform"];
    
    return delegate;
}

@end
