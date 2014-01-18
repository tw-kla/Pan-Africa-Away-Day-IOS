//
//  TWSessionsViewController.h
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/2/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MSCollectionViewCalendarLayout.h"

@interface TWSessionsViewController : UICollectionViewController <MSCollectionViewDelegateCalendarLayout, NSFetchedResultsControllerDelegate>
@property (strong, nonatomic) NSArray *sessions;

@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) MSCollectionViewCalendarLayout *collectionViewCalendarLayout;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@end
