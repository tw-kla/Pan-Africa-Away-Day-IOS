//
//  Session.h
//  Away Day 2014
//
//  Created by James Muranga on 2/6/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Room, Speaker;

@interface Session : NSManagedObject

@property (nonatomic, retain) NSDate * endTime;
@property (nonatomic, retain) NSNumber * isKeynote;
@property (nonatomic, retain) NSNumber * serverId;
@property (nonatomic, retain) NSString * sessionDescription;
@property (nonatomic, retain) NSDate * startTime;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) Room *room;
@property (nonatomic, retain) Speaker *speakers;

- (NSDate *)day;

@end
