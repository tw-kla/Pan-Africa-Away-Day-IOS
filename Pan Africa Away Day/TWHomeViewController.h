//
//  TWHomeViewController.h
//  Pan Africa Away Day
//
//  Created by James Muranga on 2/1/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TWHomeViewController : UIViewController <NSFetchedResultsControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *syncButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sessionTypeSegementControl;

@end
