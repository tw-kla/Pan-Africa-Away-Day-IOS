//
//  TWSpeakersViewController.m
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/2/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "TWSpeakersViewController.h"
#import "UIImageView+AFNetworking.h"
#import "TWAppDelegate.h"
#import "Speaker.h"
#import "TWSpeakerDetailViewController.h"

@interface TWSpeakersViewController ()

@end

@implementation TWSpeakersViewController
@synthesize tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.tabBarItem setImage:[UIImage imageNamed:@"IconSpeaker"]];
        self.title = @"Speakers";

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Speakers";


    TWAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;


    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Speaker"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:@"name" cacheName:nil];
    self.fetchedResultsController.delegate = self;

    [self.fetchedResultsController performFetch:nil];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[self.fetchedResultsController sections] objectAtIndex:section]
            numberOfObjects];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.fetchedResultsController.sections.count;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [self.fetchedResultsController sectionIndexTitles];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [self.fetchedResultsController sectionForSectionIndexTitle:title atIndex:index];
}

- (UITableViewCell *)tableView:(UITableView *)givenTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";

    UITableViewCell *cell = [givenTableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    id <NSFetchedResultsSectionInfo> theSection = [[self.fetchedResultsController sections] objectAtIndex:indexPath.section];
    Speaker *speaker = [[theSection objects]objectAtIndex:indexPath.row];

    cell.textLabel.text = speaker.name;
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    TWSpeakerDetailViewController *detailViewController = [[TWSpeakerDetailViewController alloc] initWithNibName:@"TWSpeakerDetailViewController" bundle:nil];
    Speaker *speaker = [self.fetchedResultsController objectAtIndexPath:indexPath];
    detailViewController.speaker = speaker;
	[self.navigationController pushViewController:detailViewController animated:YES];
}

@end
