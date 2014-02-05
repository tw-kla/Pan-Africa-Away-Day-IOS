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


@interface TWSpeakersViewController ()

@end

@implementation TWSpeakersViewController
@synthesize tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
                [self.tabBarItem setImage:[UIImage imageNamed:@"IconSpeaker"]];
        self.title = @"Speakers";
        
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Speakers";
    
    
    TWAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Speaker"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    self.fetchedResultsController.delegate = self;
    
    [self.fetchedResultsController performFetch:nil];
  
}

 



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.fetchedResultsController.sections.count;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return self.fetchedResultsController.fetchedObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)givenTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [givenTableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    Speaker *speaker = [self.fetchedResultsController objectAtIndexPath:indexPath];
  
    
    cell.textLabel.text = speaker.name ;
    [cell.imageView setImageWithURL:[NSURL URLWithString:speaker.photo]];
   // style the cell
    return cell;
}


- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView reloadData];
}

@end
