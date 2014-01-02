

#import <UIKit/UIKit.h>
#import "RESideMenu.h"

@interface TWMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, RESideMenuDelegate>

@property (strong, readwrite, nonatomic) UITableView *tableView;

@end