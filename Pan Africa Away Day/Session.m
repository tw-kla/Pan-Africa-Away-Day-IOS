//
//  Session.m
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/18/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "Session.h"
#import "Room.h"


@implementation Session

@dynamic endTime;
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
@end
