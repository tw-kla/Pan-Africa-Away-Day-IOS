//
//  TWSessionsViewController.m
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/2/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "TWSessionsViewController.h"
#import "TWSessionAPIService.h"
#import "TWSession.h"
#import "Mantle.h"
#import "TWAppDelegate.h"
@interface TWSessionsViewController ()

@end
static const int kBatchSize = 40;

@implementation TWSessionsViewController
@synthesize tableView,sessions;
- (void)setupSessions
{
    TWSessionAPIService * sessionsCatalog = [[TWSessionAPIService alloc] init];
    [sessionsCatalog allSessions:^(NSArray *results, NSError *error) {
        if (error == nil) {
            NSDictionary *JSONDictionary = [MTLJSONAdapter JSONDictionaryFromModel:[results objectAtIndex:0]];
            NSLog(@"%@ results" ,JSONDictionary);
            NSError *error;
            for (TWSession* session in results)
            {
                NSLog(@"%@",session);
                
                if (![self containsSession:session]){
                    if (![self saveSession:session error:&error]) {
                        NSLog(@"*** Couldn't add the session. Error: %@", [error localizedFailureReason]);
                    }

                }else {
                    NSLog(@"Session exists");
                }
                
            }
        }
        else {
            NSLog(@"[search error] %@", [error localizedDescription]);
        }
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Sessions";
    [self setupSessions];
    TWAppDelegate* appDelegate = [UIApplication sharedApplication].delegate;
    self.managedObjectContext = appDelegate.managedObjectContext;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityDesc = [NSEntityDescription entityForName:@"Session" inManagedObjectContext:self.managedObjectContext];
    [request setEntity:entityDesc];
    
    NSError *error;
    self.sessions = [self.managedObjectContext executeFetchRequest:request error:&error];
    NSLog(@"fetched data = %@",[self.sessions lastObject]); //this shows the data
    [self.tableView reloadData];
}

- (IBAction)showMenu
{
    [self.sideMenuViewController presentMenuViewController];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [sessions count];
}

- (UITableViewCell *)tableView:(UITableView *)givenTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [givenTableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [(TWSession *)[sessions objectAtIndex:indexPath.row] title] ;
    return cell;
}


- (BOOL)containsSession:(TWSession *)session {
    NSFetchRequest *fetchRequest = [[self class] fetchRequestForSessionWithIdentifier:session.id];
    NSUInteger count = [self.managedObjectContext countForFetchRequest:fetchRequest error:NULL];
    
    return (count != NSNotFound && count > 0);
}

+ (NSFetchRequest *)fetchRequest {
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[TWSession managedObjectEntityName]];
    [fetchRequest setFetchBatchSize:kBatchSize];
    
    return fetchRequest;
}
+ (NSFetchRequest *)fetchRequestForSessionWithIdentifier:(NSNumber *)identifier {
    static dispatch_once_t onceToken;
    static NSPredicate *predicateTemplate;
    
    dispatch_once(&onceToken, ^{
        predicateTemplate = [NSPredicate predicateWithFormat:@"serverId == $identifier"];
    });
    
    NSPredicate *predicate = [predicateTemplate predicateWithSubstitutionVariables:@{
                                                                                     @"identifier" : identifier
                                                                                     }];
    
    NSFetchRequest *fetchRequest = [self fetchRequest];
    [fetchRequest setPredicate:predicate];
    
    return fetchRequest;
}
- (BOOL)saveSession:(TWSession *)session error:(NSError * __autoreleasing *)error {
    NSManagedObject *managedSession = [MTLManagedObjectAdapter managedObjectFromModel:session insertingIntoContext:self.managedObjectContext error:error];
    
    if (*error == nil) {
        
        return [self.managedObjectContext save:error];
    }
    
    return NO;
}


@end
