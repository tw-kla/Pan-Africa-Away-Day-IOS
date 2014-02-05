//
//  Speaker.h
//  Away Day 2014
//
//  Created by James Muranga on 2/6/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Session;

@interface Speaker : NSManagedObject

@property (nonatomic, retain) NSString * bio;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * photo;
@property (nonatomic, retain) NSNumber * serverId;
@property (nonatomic, retain) Session *session;

@end
