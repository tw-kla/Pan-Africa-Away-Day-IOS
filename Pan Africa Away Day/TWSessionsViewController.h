//
//  TWSessionsViewController.h
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/2/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RESideMenu.h"

@interface TWSessionsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *sessions;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@end
