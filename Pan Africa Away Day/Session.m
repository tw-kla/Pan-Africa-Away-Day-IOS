//
//  Session.m
//  Away Day 2014
//
//  Created by James Muranga on 2/6/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "Session.h"
#import "Room.h"
#import "Speaker.h"


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
@end
