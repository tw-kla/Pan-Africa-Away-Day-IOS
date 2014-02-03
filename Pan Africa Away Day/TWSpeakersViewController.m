//
//  TWSpeakersViewController.m
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/2/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "TWSpeakersViewController.h"
#import "UIImageView+AFNetworking.h"

@interface TWSpeakersViewController ()

@end

@implementation TWSpeakersViewController
@synthesize speakers,tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
                [self.tabBarItem setImage:[UIImage imageNamed:@"IconSpeaker"]];
        self.title = @"Speakers";
        
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Speakers";
    
  
}

 



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [speakers count];
}

- (UITableViewCell *)tableView:(UITableView *)givenTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [givenTableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
   // style the cell
    return cell;
}

@end
