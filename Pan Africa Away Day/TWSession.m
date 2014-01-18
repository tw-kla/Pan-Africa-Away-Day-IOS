//
//  TWSession.m
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/17/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "TWSession.h"
#import "TWSpeaker.h"

@implementation TWSession
+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"title": @"title",
             @"description": @"description",
             @"startTime": @"startTime",
             @"endTime": @"endTime",
             @"id": @"id"
             };
}

+ (NSValueTransformer *)speakersJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:TWSpeaker.class];
}
+ (NSValueTransformer *)roomJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:TWRoom.class];
}
@end
