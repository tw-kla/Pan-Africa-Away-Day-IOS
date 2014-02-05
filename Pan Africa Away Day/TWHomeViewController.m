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


@interface TWHomeViewController ()

@end

@implementation TWHomeViewController
@synthesize tableView,navigationBar,syncButton,sessionTypeSegementControl;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.title = @"Featured";
        [self.tabBarItem setImage:[UIImage imageNamed:@"IconHome"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    TWAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Session"];
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"startTime" ascending:YES]];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    
    
    
    self.fetchedResultsController.delegate = self;
    
    [self.fetchedResultsController performFetch:nil];
    
    tableView.separatorInset = UIEdgeInsetsZero;
    
    [tableView setTintColor:[UIColor greenColor]];
    
    [navigationBar setShadowImage:[[UIImage alloc] init]];
    [navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)didReceiveMemoryWarning
{
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
    NSArray * speakers = (NSArray *)event.speakers;
    NSLog(@"Speakers :%d",speakers);
    cell.detailTextLabel.text = event.sessionDescription;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
- (IBAction)syncSessionsAndSpeakers:(id)sender {
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = @"Updating Schedule";
    [self loadSessions];
    [self.tableView reloadData];
}

- (void) loadSessions{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://pa-kla-away-day.herokuapp.com/sessions.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray * sessions = [responseObject objectForKey:@"sessions"];
        for (NSDictionary * session in sessions) {
            [self createOrUpdateSession:session];
        }
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
}

- (IBAction)segmentControlValueChanged:(id)sender {
}

-(void) createOrUpdateSession:(NSDictionary *)session{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Session" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(serverId = %@)", [session objectForKey:@"id"]];
    [fetchRequest setPredicate:predicate];
    NSUInteger count = [self.managedObjectContext countForFetchRequest:fetchRequest error:NULL];
    Boolean notNew = (count != NSNotFound && count > 0);
    if (notNew){}else{
        NSLog(@"saving %@",session);
        Session *newSession = [NSEntityDescription insertNewObjectForEntityForName:@"Session" inManagedObjectContext:self.managedObjectContext];
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
        [newSession setServerId:[session objectForKey:@"id"]];
        [newSession setTitle:[session objectForKey:@"title"]];
        [newSession setSessionDescription:[session objectForKey:@"description"]];
        [newSession setStartTime: [dateFormatter dateFromString:[session objectForKey:@"startTime"]]];
        [newSession setEndTime: [dateFormatter dateFromString:[session objectForKey:@"endTime"]]];
        
        NSString * isKeynote = [session objectForKey:@"is_keynote"];
        if(isKeynote ==  (id)[NSNull null]){
            [newSession setIsKeynote:[NSNumber numberWithBool:NO]];
        }else{
            [newSession setIsKeynote:[NSNumber numberWithBool:[isKeynote boolValue]]];
        }
        for (NSDictionary* speaker in [session objectForKey:@"speakers"]) {
            [self createOrUpdateSpeaker:speaker withSession:newSession];
        }
        [self.managedObjectContext save:nil];
    }
    
}


-(void) createOrUpdateSpeaker:(NSDictionary *)speaker withSession:(Session *) session{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Speaker" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(serverId = %@)", [speaker objectForKey:@"id"]];
    [fetchRequest setPredicate:predicate];
    NSUInteger count = [self.managedObjectContext countForFetchRequest:fetchRequest error:NULL];
    Boolean notNew = (count != NSNotFound && count > 0);
    if (notNew){}else{
        NSLog(@"saving %@",speaker);
        Speaker *newSpeaker = [NSEntityDescription insertNewObjectForEntityForName:@"Speaker" inManagedObjectContext:self.managedObjectContext];
        
        [newSpeaker setServerId:[speaker objectForKey:@"id"]];
        [newSpeaker setBio:[speaker objectForKey:@"bio"]];
        [newSpeaker setName:[speaker objectForKey:@"name"]];
        [newSpeaker setPhoto:[speaker objectForKey:@"photo"]];
        [newSpeaker setSession:session];
        
        [self.managedObjectContext save:nil];
    }
}

@end
