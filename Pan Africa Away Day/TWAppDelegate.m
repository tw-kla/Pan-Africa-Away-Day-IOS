//
//  TWAppDelegate.m
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/2/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "TWAppDelegate.h"
#import "TWSessionAPIService.h"
#import "TWSessionStoreService.h"
#import "TWSession.h"
#import "Reachability.h"
#import "TWSessionsViewController.h"
#import "TWHomeViewController.h"
#import "TWSpeakersViewController.h"

@interface TWAppDelegate ()


@end

@implementation TWAppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] ;
    
    self.tabBarController = [[UITabBarController alloc] init];
    
    TWSessionsViewController * sessionsViewController = [[TWSessionsViewController alloc]initWithNibName:@"TWSessionsView" bundle:nil];
    
    TWHomeViewController * homeViewController = [[TWHomeViewController alloc]initWithNibName:@"TWHomeViewController" bundle:nil];
    
    TWSpeakersViewController * speakersViewController =  [[TWSpeakersViewController alloc ]initWithNibName:@"TWSpeakersView" bundle:nil];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:homeViewController];
   
    UINavigationController *sessionsNav = [[UINavigationController alloc] initWithRootViewController:sessionsViewController];
    
    UINavigationController *speakersNav = [[UINavigationController alloc] initWithRootViewController:speakersViewController];
    
    self.tabBarController.viewControllers = @[homeNav,sessionsNav,speakersNav];
    
    self.window.rootViewController = self.tabBarController;
    
    [self.window makeKeyAndVisible];
    
    [self syncSessions];
    
    return YES;
}

- (void)syncSessions {
    TWSessionAPIService * sessionsCatalog = [[TWSessionAPIService alloc] init];
    TWSessionStoreService * storeService = [[TWSessionStoreService alloc] initWithContext:self.managedObjectContext];
    [sessionsCatalog allSessions:^(NSArray *results, NSError *error) {
        if (error == nil) {
            NSDictionary *JSONDictionary = [MTLJSONAdapter JSONDictionaryFromModel:[results objectAtIndex:0]];
            NSLog(@"%@ results" ,JSONDictionary);
            NSError *error;
            for (TWSession* session in results)
            {
                NSLog(@"%@",session);
                
                if (![storeService containsSession:session]){
                    if (![storeService saveSession:session error:&error]) {
                        NSLog(@"*** Couldn't add the session. Error: %@", [error localizedFailureReason]);
                    }
                    
                }else {
                    NSLog(@"Session exists");
                }
                
            }
        }
        else {
            NSLog(@"[search error] %@", [error localizedDescription]);
        }
    }];
}


- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Pan_Africa_Away_Day" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}


- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Pan_Africa_Away_Day.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
