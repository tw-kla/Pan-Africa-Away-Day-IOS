//
//  TWRoom.m
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/17/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "TWRoom.h"

@implementation TWRoom

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"id": @"id",
             @"name": @"name",
             @"colour": @"colour"
             };
}

+ (NSString *)managedObjectEntityName {
    return @"Room";
}
+ (NSDictionary *)managedObjectKeysByPropertyKey {
    return @{
           
             @"id" : @"serverId"
             };
}
@end
