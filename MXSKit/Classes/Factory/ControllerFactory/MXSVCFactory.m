

#import "MXSVCFactory.h"
#import "NSObject+MXSExtension.h"

@implementation MXSVCFactory

+ (id)factoryInstance {
    //    static AYDefaultControllerFactoy* instance = nil;
    //    if (instance == nil) {
    //        static dispatch_once_t onceToken;
    //        dispatch_once(&onceToken, ^{
    //            instance = [[self alloc]init];
    //        });
    //    }
    //    return instance;
    return [[self alloc]init];
}

+ (id)createInstance:(NSString*)name {
    
    Class c = NSClassFromString(name);
    id controller = [[c alloc]init];
    
    [controller callMethodWithName:@"postPerform"];
    return controller;
    
    
    //Class c = NSClassFromString(factoryName);
    //Method m = class_getClassMethod(c, @selector(factoryInstance));//获取类方法
    //IMP im = method_getImplementation(m);
    //fac = im(c, @selector(factoryInstance));
}


@end
