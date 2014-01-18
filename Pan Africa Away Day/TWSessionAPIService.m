//
//  TWSessionList.m
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/17/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "TWSessionAPIService.h"
#import "TWSession.h"

@implementation TWSessionAPIService
- (id)init {
    return [super initWithBaseURL:[NSURL URLWithString:@"http://pa-kla-away-day.herokuapp.com"]];
}

- (void)allSessions:(void (^)(NSArray *results, NSError *error))block;{
    
    [self GET:@"sessions.json" parameters:nil resultClass:TWSession.class resultKeyPath:@"sessions" completion:^(AFHTTPRequestOperation *operation, id responseObject, NSError *error) {
        block(responseObject, error);
    }];
}
@end
