

#import "MXSFactory.h"
#import "MXSDelegateFactory.h"
#import "MXSVCFactory.h"
#import "MXSViewFactory.h"

#define DELEGATE                @"Dlg"
#define CONTROLLER              @"VC"
#define VIEW                    @"View"

@implementation MXSFactory

+ (id)makeObjectWithName:(NSString *)name {
    id instacnce;
    if ([name hasSuffix:DELEGATE]) {
        instacnce = [MXSDelegateFactory createInstance:name];
    }
    else if ([name hasSuffix:CONTROLLER]) {
        instacnce = [MXSVCFactory createInstance:name];
    }
    else {
        
    }
    return instacnce;
}

#pragma mark - distribute
+ (id)makeController:(NSString *)name {
    NSString *n = [name stringByAppendingString:CONTROLLER];
    return [MXSVCFactory createInstance:n];
}

+ (id)makeDelegate:(NSString *)name {
    NSString *n = [name stringByAppendingString:DELEGATE];
    return [MXSDelegateFactory createInstance:n];
}

+ (id)makeView:(NSString *)name {
    NSString *n = [name stringByAppendingString:VIEW];
    return [MXSViewFactory createInstance:n];
}

//+ (BYBaseView*)makeView:(NSString *)name controller:(id)controller {
//    NSString *n = [name stringByAppendingString:VIEW];
//    BYBaseView *view = [BYViewFactory createInstance:n];
//    view.controller = controller;
//    return view;
//}
//
///*
// * style: 0 - UITableViewStylePlain
// * style: 1 - UITableViewStyleGroup
// */
//+ (BYTableView *)makeTableViewWithStyle:(NSInteger)style {
//    UITableViewStyle s;
//    if (style == 1) {
//        s = UITableViewStyleGrouped;
//    } else {
//        s = UITableViewStylePlain;
//    }
//    
//    BYTableView *tableView = [[BYTableView alloc] initStyle:s];
//    if(@available(iOS 15.0,*)) {tableView.sectionHeaderTopPadding = 0;}     //去掉headerpadding的高度
//    return tableView;
//}

@end
