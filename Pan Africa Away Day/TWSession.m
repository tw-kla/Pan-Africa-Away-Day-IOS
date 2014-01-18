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

//+ (NSValueTransformer *)speakersJSONTransformer {
//    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:TWSpeaker.class];
//}
+ (NSValueTransformer *)roomJSONTransformer {
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:TWRoom.class];
}

+ (NSString *)managedObjectEntityName {
    return @"Session";
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
    return @{
             @"description" : @"sessionDescription",
             @"id" : @"serverId"
             };
}

+ (NSValueTransformer *)endTimeJSONTransformer {
    static dispatch_once_t onceToken;
    static NSDateFormatter *dateFormatter;
    
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    });
    
    return [MTLValueTransformer transformerWithBlock:^id(NSString *string) {
        return [dateFormatter dateFromString:string];
    }];
}

+ (NSValueTransformer *)startTimeJSONTransformer {
    static dispatch_once_t onceToken;
    static NSDateFormatter *dateFormatter;
    
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
        dateFormatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    });
    
    return [MTLValueTransformer transformerWithBlock:^id(NSString *string) {
        return [dateFormatter dateFromString:string];
    }];
}

- (NSDate *)day
{
    return [self.startTime beginningOfDay];
}
@end
