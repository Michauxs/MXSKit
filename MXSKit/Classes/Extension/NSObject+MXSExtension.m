

#import "NSObject+MXSExtension.h"
#import <objc/runtime.h>

@implementation NSObject (MXSExtension)

- (void)callMethodWithName:(NSString*)SELName withResult:(NSObject**)obj {
    SEL sel = NSSelectorFromString(SELName);
    
    /**设计初衷：找不到实现方法直接结束不再做后续处理（消息转发机制）
     *所以 使用class_getInstanceMethod->method_getImplementation，而不是用class_getMethodImplementation（当找不到实现函数Imp时会返回消息转发机制的IMP）*/
    Method m = class_getInstanceMethod([self class], sel);
    if (m) {
        
        id result = nil;
        id (*func)(id, SEL, id) = (id (*)(id, SEL, id))method_getImplementation(m);
        result = func(self, sel, *obj);
        
        *obj = result;
    }
}

- (void)callMethodWithName:(NSString*)SELName {
    SEL sel = NSSelectorFromString(SELName);
    
    /**设计初衷：找不到实现方法直接结束不再做后续处理（消息转发机制）
     *所以 使用class_getInstanceMethod->method_getImplementation，而不是用class_getMethodImplementation（当找不到实现函数Imp时会返回消息转发机制的IMP）
     
     struct objc_super person1 = {self,class_getSuperclass([self class])};
     //调用父类的方法
     objc_msgSendSuper(&person1, _cmd,newName);
     *
     ClasssA *obj = objc_msgSend(objc_getClass("ClassA"),sel_registerName("alloc"));
     obj = objc_msgSend(obj,sel_registerName("init"));
     obj = objc_msgSend(obj,sel_registerName("method"),10);
     *
     * ((void (*)(id, SEL))(void *)objc_msgSend)((id)person, sel_registerName("saySomething"));
     *
     */
    Method m = class_getInstanceMethod([self class], sel);
    if (m) {
        /**1: C来实现 objc_msgSend
         */
        id result = nil;
        IMP imp_m = method_getImplementation(m);
        result = ((id (*)(id, SEL))imp_m)(self, sel);
        /**2: OC
         ((void (*)(id, SEL))(void *)objc_msgSend)((id)self, sel);
         */
        
        /**3: x
         IMP imp_m = [self methodForSelector:sel];
         imp_m();
         */
         
        /**4
         //typedefine id (*IMP)(id, SEL, ...)
         id (*func)(id, SEL) = (id (*)(id, SEL))method_getImplementation(m);
         result = func(self, sel);
         */
    }
}


/**
 IMP获取的方法:
 // 第一种方法
 SEL sel = @selector(addSubviewTemp:with:);
 Method method = class_getInstanceMethod([self class], sel);
 IMP imp = method_getImplementation(method);
 NSString *str =((id(*)(id, SEL, UIView*, id))imp)(self, sel, [UIView new], @"DFD"); // [self addSubviewTemp:[UIView new] with:@"DFD"];
 
 // 第二种方法
 SEL sel = @selector(addSubviewTemp:with:);
 IMP imp = [self methodForSelector:sel];
 NSString *str =  ((id(*)(id, SEL, UIView*, id))imp)(self, sel, [UIView new], @"DFD"); // [self addSubviewTemp:[UIView new] with:@"DFD"];
 
 // 第三种方法
 SEL sel = @selector(test);
 IMP imp = class_getMethodImplementation(self, sel);
 NSString *str =  ((id(*)(id, SEL, UIView*, id))imp)(self, sel, [UIView new], @"DFD"); // [self addSubviewTemp:[UIView new] with:@"DFD"];
 
 1.method_getImplementation(Method)
 2.methodForSelector(SEL)
 3.class_getMethodImplementation(Class, SEL)
 
 几种IMP获取的方法区别: PS: methodForSelector 内部是用 class_getMethodImplementation 实现的;
 1.class_getMethodImplementation 可能会比 method_getImplementation效率高;
 2.当找不到实现函数Imp时（执行函数不存在）,class_getMethodImplementation  会返回消息转发机制的IMP, 而method_getImplementation 找不到方法时会返回 nil。
 
 作者：晨寂
 链接：https://www.jianshu.com/p/e5aef096f967
 来源：简书
 简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。
 */
/**
 + (BOOL)resolveInstanceMethod:(SEL)sel {
 return YES;//返回YES，进入下一步转发
 }
 
 - (id)forwardingTargetForSelector:(SEL)aSelector {
 return nil;//返回nil，进入下一步转发
 }
 
 - (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
 if ([NSStringFromSelector(aSelector) isEqualToString:@"foo"]) {
 return [NSMethodSignature signatureWithObjCTypes:"v@:"];//签名，进入forwardInvocation
 }
 
 return [super methodSignatureForSelector:aSelector];
 }
 
 - (void)forwardInvocation:(NSInvocation *)anInvocation {
 SEL sel = anInvocation.selector;
 
 Person *p = [Person new];
 if([p respondsToSelector:sel]) {
 [anInvocation invokeWithTarget:p];
 }
 else {
 [self doesNotRecognizeSelector:sel];
 }
 
 }
  链接：https://www.jianshu.com/p/6ebda3cd8052
 */


- (BOOL)isNil {
    return [self isKindOfClass:[NSNull class]] || self == nil;
}
- (BOOL)isNull {
    return [self isKindOfClass:[NSNull class]];
}
- (BOOL)notNull {
    return ![self isKindOfClass:[NSNull class]];
}

- (NSString *)by_stringForKey:(NSString *)key {
    if (![self isKindOfClass:[NSDictionary class]]) {
        return @"";
    }
    
    NSString *str = [(NSDictionary*)self objectForKey:key];
    if ([str isNil] || ![str isKindOfClass:[NSString class]]) {
        str = @"";
    }
    return str;
}
- (NSNumber *)by_numberForKey:(NSString *)key {
    if (![self isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    
    NSNumber *numb = [(NSDictionary*)self objectForKey:key];
    if ([numb isNull] || ![numb isKindOfClass:[NSNumber class]]) {
        numb = nil;
    }
    return numb;
}

- (NSInteger)by_integerForKey:(NSString *)key {
    return [[self by_numberForKey:key] integerValue];
}

- (NSArray *)by_arrayForKey:(NSString *)key {
    if (![self isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    NSArray *array = [(NSDictionary*)self objectForKey:key];
    if (![array isKindOfClass:[NSArray class]]) {
        return nil;
    }
    return array;
}
- (NSDictionary *)by_dictForKey:(NSString *)key {
    if (![self isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    NSDictionary *dict = [(NSDictionary*)self objectForKey:key];
    if (![dict isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    return dict;
}

- (id)by_valueForKey:(NSString *)key {
    
    id value = [self valueForKey:key];
    if ([value isKindOfClass:[NSNull class]]) {
        return nil;
    }
    return value;
}

@end
