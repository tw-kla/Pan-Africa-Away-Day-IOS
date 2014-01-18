//
// Created by James Muranga on 1/18/14.
// Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "TWSession.h"
#import "TWSessionsViewController.h"
#import "TWSessionStoreService.h"



NSUInteger kBatchSize = 40;

@implementation TWSessionStoreService {

}

+ (NSFetchRequest *)fetchRequestForSessionWithIdentifier:(NSNumber *)identifier {
    static dispatch_once_t onceToken;
    static NSPredicate *predicateTemplate;

    dispatch_once(&onceToken, ^{
        predicateTemplate = [NSPredicate predicateWithFormat:@"serverId == $identifier"];
    });

    NSPredicate *predicate = [predicateTemplate predicateWithSubstitutionVariables:@{
                                                                                     @"identifier" : identifier
                                                                                     }];

    [[NSFetchRequest fetchRequestWithEntityName:[TWSession managedObjectEntityName]] setFetchBatchSize:kBatchSize];

    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:[TWSession managedObjectEntityName]];
    [fetchRequest setPredicate:predicate];

    return fetchRequest;
}

- (id)initWithContext:(NSManagedObjectContext *)context {
    TWSessionStoreService *service = [[TWSessionStoreService alloc] init];
    service.managedObjectContext = context;
    return service;

}

- (BOOL)containsSession:(TWSession *)session {
    NSUInteger count = [self.managedObjectContext countForFetchRequest:[TWSessionStoreService fetchRequestForSessionWithIdentifier:session.id] error:NULL];

    return (count != NSNotFound && count > 0);
}

- (BOOL)saveSession:(TWSession *)session error:(NSError * __autoreleasing *)error {
    NSManagedObject *managedSession = [MTLManagedObjectAdapter managedObjectFromModel:session insertingIntoContext:self.managedObjectContext error:error];

    if (*error == nil) {

        return [self.managedObjectContext save:error];
    }

    return NO;
}
@end