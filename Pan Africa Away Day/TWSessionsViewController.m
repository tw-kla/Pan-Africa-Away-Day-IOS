//
//  TWSessionsViewController.m
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/2/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "TWSessionsViewController.h"

@interface TWSessionsViewController ()

@end

@implementation TWSessionsViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Sessions";
}

- (IBAction)showMenu
{
    [self.sideMenuViewController presentMenuViewController];
}

@end
