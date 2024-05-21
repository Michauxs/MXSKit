

#import <Foundation/Foundation.h>

@interface NSObject (MXSExtension)

- (void)callMethodWithName:(NSString*)SELName withResult:(NSObject**)obj;

- (void)callMethodWithName:(NSString*)SELName;

//- (void)postPerform2;
- (BOOL)isNil;
- (BOOL)isNull;
- (BOOL)notNull;

- (NSString*)by_stringForKey:(NSString*)key;
- (NSNumber*)by_numberForKey:(NSString*)key;
- (NSInteger)by_integerForKey:(NSString*)key;
- (NSArray*)by_arrayForKey:(NSString*)key;
- (NSDictionary*)by_dictForKey:(NSString*)key;


- (id)by_valueForKey:(NSString*)key;

@end
