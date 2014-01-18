//
// Created by James Muranga on 1/18/14.
// Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWSession.h"

@interface TWSessionStoreService : NSObject
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
+ (NSFetchRequest *)fetchRequestForSessionWithIdentifier:(NSNumber *)identifier;

- (id)initWithContext:(NSManagedObjectContext *)context;
- (BOOL)containsSession:(TWSession *)session;
- (BOOL)saveSession:(TWSession *)session error:(NSError * __autoreleasing *)error;
@end