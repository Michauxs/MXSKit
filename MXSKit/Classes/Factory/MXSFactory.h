

#import <Foundation/Foundation.h>

@interface MXSFactory : NSObject

+ (id)makeObjectWithName:(NSString*)name;

+ (id)makeController:(NSString*)name;
+ (id)makeDelegate:(NSString*)name;
+ (id)makeView:(NSString*)name;
//+ (BYBaseView*)makeView:(NSString*)name controller:(id)controller;
//
///*
// * style: 0 - UITableViewStylePlain
// * style: 1 - UITableViewStyleGroup
// */
//+ (BYTableView *)makeTableViewWithStyle:(NSInteger)style;

@end
