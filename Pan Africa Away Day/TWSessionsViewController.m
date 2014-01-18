//
//  TWSessionsViewController.m
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/2/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "TWSessionsViewController.h"
#import "TWSessionDataService.h"
#import "TWSession.h"
#import "Mantle.h"
@interface TWSessionsViewController ()

@end


@implementation TWSessionsViewController
@synthesize tableView,sessions;
- (void)setupSessions
{
    TWSessionDataService * sessionsCatalog = [[TWSessionDataService alloc] init];
    [sessionsCatalog allSessions:^(NSArray *results, NSError *error) {
        if (error == nil) {
            NSDictionary *JSONDictionary = [MTLJSONAdapter JSONDictionaryFromModel:[results objectAtIndex:0]];
            NSLog(@"%@ results" ,JSONDictionary);
            sessions = results;
            [tableView reloadData];
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

@end
