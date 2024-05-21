

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (MXSArray)

- (NSArray*)containsObjectsAtKey:(NSString*)key value:(id)value;

- (NSDictionary*)containsObjectAtKey:(NSString*)key value:(id)value;

@end

NS_ASSUME_NONNULL_END
