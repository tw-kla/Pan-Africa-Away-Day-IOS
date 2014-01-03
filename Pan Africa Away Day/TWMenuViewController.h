

#import <UIKit/UIKit.h>
#import "RESideMenu.h"

@interface TWMenuViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, RESideMenuDelegate>

@property (strong, readwrite, nonatomic) UITableView *tableView;
- (void)setupTableView;
- (void)selectController:(UINavigationController *)navigationController indexPath:(NSIndexPath *)indexPath;
@end