//
//  TWSpeakersViewController.h
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/2/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import <UIKit/UIKit.h>
 

@interface TWSpeakersViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSArray * speakers;

@end
