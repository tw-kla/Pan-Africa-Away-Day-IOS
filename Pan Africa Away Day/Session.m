//
//  Session.m
//  Away Day 2014
//
//  Created by James Muranga on 2/14/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "Session.h"
#import "Room.h"
#import "Speaker.h"
#import "MMServerPageManager.h"


@implementation Session

@dynamic endTime;
@dynamic isKeynote;
@dynamic serverId;
@dynamic sessionDescription;
@dynamic startTime;
@dynamic title;
@dynamic room;
@dynamic speakers;

- (NSDate *)day
{
    return [self.startTime beginningOfDay];
}

+ (void)getSessions:(NSManagedObjectContext *)managedContext domain:(id)domain resultBlock:(void (^)(NSArray *posts, MMServerPageManager *pageManager, BOOL *requestNextPage))resultBlock failureBlock:(void (^)(NSError *error))failureBlock {
    NSString *uri = [NSString stringWithFormat:@"sessions.json"];
    [self startPagedRequestWithURN:uri
                              data:nil
                           context:managedContext
                            domain:self
                       resultBlock:resultBlock
                      failureBlock:failureBlock];
}

+ (NSString *)keyPathForResponseObject {
    return @"sessions";
}
@end
