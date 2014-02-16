//
//  Speaker.m
//  Away Day 2014
//
//  Created by James Muranga on 2/14/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "Speaker.h"
#import "MMServerPageManager.h"


@implementation Speaker

@dynamic bio;
@dynamic name;
@dynamic photo;
@dynamic serverId;
@dynamic sessions;


+ (void)getSpeakers:(NSManagedObjectContext *)managedContext domain:(id)domain resultBlock:(void (^)(NSArray *posts, MMServerPageManager *pageManager, BOOL *requestNextPage))resultBlock failureBlock:(void (^)(NSError *error))failureBlock {
    NSString *uri = [NSString stringWithFormat:@"speakers.json"];
    [self startPagedRequestWithURN:uri
                              data:nil
                           context:managedContext
                            domain:self
                       resultBlock:resultBlock
                      failureBlock:failureBlock];
}

+ (NSString *)keyPathForResponseObject {
    return @"speakers";
}
@end
