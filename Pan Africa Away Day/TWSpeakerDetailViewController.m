//
//  TWSpeakerDetailViewController.m
//  Away Day 2014
//
//  Created by James Muranga on 2/17/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "TWSpeakerDetailViewController.h"

@interface TWSpeakerDetailViewController ()

@end

@implementation TWSpeakerDetailViewController

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
    // Do any additional setup after loading the view from its nib.
    self.title = self.speaker.name;
    self.labelName.text = self.speaker.name;
    self.bioLabel.text = self.speaker.bio;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
