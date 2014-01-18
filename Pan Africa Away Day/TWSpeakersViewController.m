//
//  TWSpeakersViewController.m
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/2/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "TWSpeakersViewController.h"
#import "TWSpeakersAPIService.h"
#import "TWSpeaker.h"
#import "Mantle.h"
#import "UIImageView+AFNetworking.h"

@interface TWSpeakersViewController ()

@end

@implementation TWSpeakersViewController
@synthesize speakers,tableView;
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Speakers";
    
    [self setupSpeakers];
}

 

- (void)setupSpeakers
{
    TWSpeakersAPIService * service = [[TWSpeakersAPIService alloc] init];
    [service allSpeakers:^(NSArray *results, NSError *error) {
        if (error == nil) {
            NSDictionary *JSONDictionary = [MTLJSONAdapter JSONDictionaryFromModel:[results objectAtIndex:0]];
            NSLog(@"%@ results" ,JSONDictionary);
            speakers = results;
            [tableView reloadData];
        }
        else {
            NSLog(@"[search error] %@", [error localizedDescription]);
        }
    }];
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
    
    cell.textLabel.text = [(TWSpeaker *)[speakers objectAtIndex:indexPath.row] name] ;
    [cell.imageView setImageWithURL:[NSURL URLWithString:[(TWSpeaker *)[speakers objectAtIndex:indexPath.row] photo]]];
    return cell;
}

@end
