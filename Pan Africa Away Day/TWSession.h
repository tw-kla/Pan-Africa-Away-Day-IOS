//
//  TWSession.h
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/17/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mantle.h"
#import "TWRoom.h"

@interface TWSession : MTLModel <MTLJSONSerializing,MTLManagedObjectSerializing>
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *description;
@property (nonatomic, copy, readonly) NSDate *startTime;
@property (nonatomic, copy, readonly) NSDate *endTime;
@property (nonatomic, copy, readonly) TWRoom *room;
//@property (nonatomic, copy, readonly) NSArray *speakers;
@property (nonatomic, copy, readonly) NSNumber *id;

- (NSDate *)day;
@end
