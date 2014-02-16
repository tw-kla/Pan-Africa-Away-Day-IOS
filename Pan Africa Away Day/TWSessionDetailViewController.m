//
//  TWSessionDetailViewController.m
//  Away Day 2014
//
//  Created by James Muranga on 2/16/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "TWSessionDetailViewController.h"

@interface TWSessionDetailViewController ()

@end

@implementation TWSessionDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.session.title;
    self.titleLabel.text = self.session.title;
    self.detailLabel.text = self.session.sessionDescription;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
