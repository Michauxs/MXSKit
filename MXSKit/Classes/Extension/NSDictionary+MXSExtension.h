

#import <Foundation/Foundation.h>

@interface NSDictionary (MXSExtension)

- (id)by_objectForKey:(id)key;

- (void)addEntriesWithDictionary:(NSDictionary*)item andKeys:(NSArray*)keyes;

@end

