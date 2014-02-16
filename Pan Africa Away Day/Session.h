//
//  Session.h
//  Away Day 2014
//
//  Created by James Muranga on 2/14/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "TWRecord.h"

@class Room, Speaker;
@class MMServerPageManager;

@interface Session : TWRecord

@property(nonatomic, retain) NSDate *endTime;
@property(nonatomic, retain) NSNumber *isKeynote;
@property(nonatomic, retain) NSNumber *serverId;
@property(nonatomic, retain) NSString *sessionDescription;
@property(nonatomic, retain) NSDate *startTime;
@property(nonatomic, retain) NSString *title;
@property(nonatomic, retain) Room *room;
@property(nonatomic, retain) NSSet *speakers;

+ (void)getSessions:(NSManagedObjectContext *)managedContext domain:(id)domain resultBlock:(void (^)(NSArray *posts, MMServerPageManager *pageManager, BOOL *requestNextPage))resultBlock failureBlock:(void (^)(NSError *error))failureBlock;
@end

@interface Session (CoreDataGeneratedAccessors)

- (void)addSpeakersObject:(Speaker *)value;

- (void)removeSpeakersObject:(Speaker *)value;

- (void)addSpeakers:(NSSet *)values;

- (void)removeSpeakers:(NSSet *)values;

- (NSDate *)day;
@end
