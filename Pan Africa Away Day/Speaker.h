//
//  Speaker.h
//  Away Day 2014
//
//  Created by James Muranga on 2/14/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "TWRecord.h"

@class Session;
@class MMServerPageManager;

@interface Speaker : TWRecord

@property(nonatomic, retain) NSString *bio;
@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSString *photo;
@property(nonatomic, retain) NSNumber *serverId;
@property(nonatomic, retain) NSSet *sessions;

+ (void)getSpeakers:(NSManagedObjectContext *)managedContext domain:(id)domain resultBlock:(void (^)(NSArray *posts, MMServerPageManager *pageManager, BOOL *requestNextPage))resultBlock failureBlock:(void (^)(NSError *error))failureBlock;
@end

@interface Speaker (CoreDataGeneratedAccessors)

- (void)addSessionsObject:(Session *)value;

- (void)removeSessionsObject:(Session *)value;

- (void)addSessions:(NSSet *)values;

- (void)removeSessions:(NSSet *)values;

@end
