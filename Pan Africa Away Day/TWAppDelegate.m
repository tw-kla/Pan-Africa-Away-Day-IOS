//
//  TWAppDelegate.m
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/2/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "TWAppDelegate.h"


@interface TWAppDelegate ()


@end

@implementation TWAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
        return YES;
}


#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
