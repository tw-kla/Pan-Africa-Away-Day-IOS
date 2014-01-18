//
//  Room.h
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/18/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Room : NSManagedObject

@property (nonatomic, retain) NSString * colour;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * serverId;

@end
