//
//  TWHomeViewController.m
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/7/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "TWHomeViewController.h"

@interface TWHomeViewController ()

@end

@implementation TWHomeViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Pan Africa Away Day 2014";
}



- (IBAction)showMenu
{
    [self.sideMenuViewController presentMenuViewController];
}

@end
