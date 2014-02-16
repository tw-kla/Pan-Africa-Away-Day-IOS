//
//  TWHomeViewController.m
//  Pan Africa Away Day
//
//  Created by James Muranga on 2/1/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "TWHomeViewController.h"
#import "TWAppDelegate.h"
#import "Session.h"
#import "Speaker.h"
#import "UIImageView+AFNetworking.h"


@interface TWHomeViewController ()

@end

@implementation TWHomeViewController
@synthesize tableView, navigationBar, syncButton, sessionTypeSegementControl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

        self.title = @"Featured";
        [self.tabBarItem setImage:[UIImage imageNamed:@"IconHome"]];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    TWAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;

    self.managedObjectContext = appDelegate.managedObjectContext;

    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Session"];

    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"startTime" ascending:YES]];

    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];

    self.fetchedResultsController.delegate = self;

    [self.fetchedResultsController performFetch:nil];

    tableView.separatorInset = UIEdgeInsetsZero;

    [navigationBar setShadowImage:[[UIImage alloc] init]];

    [navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.fetchedResultsController.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return self.fetchedResultsController.fetchedObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)givenTableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *CellIdentifier = @"Cell";

    UITableViewCell *cell =
            [givenTableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    Session *event = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = event.title;


    cell.detailTextLabel.text = event.sessionDescription;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    return cell;
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (IBAction)syncSessionsAndSpeakers:(id)sender {

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Updating Schedule";
    
    [Session getSessions:self.managedObjectContext domain:self resultBlock:^(NSArray *data, MMServerPageManager *pageManager, BOOL *req) {
        NSLog(@" sessions working");
        NSLog(@" f--> %d", [data count]);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }       failureBlock:^(NSError *error) {
        NSLog(@" sessions failed");
    }];
    
    [Speaker getSpeakers:self.managedObjectContext domain:self resultBlock:^(NSArray *data, MMServerPageManager *pageManager, BOOL *req) {
        NSLog(@" speakers working");
        NSLog(@" f--> %d", [data count]);
        
    }       failureBlock:^(NSError *error) {
        NSLog(@" speakers failed");
    }];
    
    [self.tableView reloadData];
}


- (IBAction)segmentControlValueChanged:(id)sender {
}

 



@end
