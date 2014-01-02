//
//  TWRootViewController.m
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/2/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "TWRootViewController.h"
#import "TWMenuViewController.h"

@interface TWRootViewController ()

@end

@implementation TWRootViewController
- (void)awakeFromNib
{
    self.contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"contentController"];
    self.menuViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"menuController"];
    self.backgroundImage = [UIImage imageNamed:@"appBackground"];
    self.delegate = (TWMenuViewController *)self.menuViewController;
}

@end
