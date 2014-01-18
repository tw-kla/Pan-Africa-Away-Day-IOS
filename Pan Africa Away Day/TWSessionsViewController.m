//
//  TWSessionsViewController.m
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/2/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "TWSessionsViewController.h"
#import "TWSessionDataService.h"
#import "Mantle.h"
@interface TWSessionsViewController ()

@end

@implementation TWSessionsViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Sessions";
    TWSessionDataService * sessionsCatalog = [[TWSessionDataService alloc] init];
    [sessionsCatalog allSessions:^(NSArray *results, NSError *error) {
        if (error == nil) {
            NSDictionary *JSONDictionary = [MTLJSONAdapter JSONDictionaryFromModel:[results objectAtIndex:0]];
            NSLog(@"%@ results" ,JSONDictionary);
        }
        else {
            NSLog(@"[search error] %@", [error localizedDescription]);
        }
    }];
}

- (IBAction)showMenu
{
    [self.sideMenuViewController presentMenuViewController];
}

@end
