//
//  TWSpeakersViewController.m
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/2/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "TWSpeakersViewController.h"

@interface TWSpeakersViewController ()

@end

@implementation TWSpeakersViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Speakers";
}

- (IBAction)showMenu
{
    [self.sideMenuViewController presentMenuViewController];
}

@end
