//
//  Room.h
//  Away Day 2014
//
//  Created by James Muranga on 2/14/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "TWRecord.h"

@class Session;

@interface Room : TWRecord

@property(nonatomic, retain) NSString *colour;
@property(nonatomic, retain) NSString *name;
@property(nonatomic, retain) NSNumber *serverId;
@property(nonatomic, retain) NSSet *sessions;
@end

@interface Room (CoreDataGeneratedAccessors)

- (void)addSessionsObject:(Session *)value;

- (void)removeSessionsObject:(Session *)value;

- (void)addSessions:(NSSet *)values;

- (void)removeSessions:(NSSet *)values;

@end
