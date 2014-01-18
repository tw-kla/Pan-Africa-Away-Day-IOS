//
//  TWSpeaker.m
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/18/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "TWSpeaker.h"

@implementation TWSpeaker


+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"name": @"name",
             @"bio": @"bio",
             @"photo": @"photo",
             @"id": @"id",
             };
}

+ (NSString *)managedObjectEntityName {
    return @"Speaker";
}
+ (NSDictionary *)managedObjectKeysByPropertyKey {
    return @{
             
             @"id" : @"serverId"
             };
}
@end
