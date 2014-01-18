//
//  TWSpeakersService.m
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/18/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "TWSpeakersAPIService.h"
#import "TWSpeaker.h"

@implementation TWSpeakersAPIService
- (id)init {
    return [super initWithBaseURL:[NSURL URLWithString:@"http://pa-kla-away-day.herokuapp.com"]];
}

- (void)allSpeakers:(void (^)(NSArray *results, NSError *error))block;{
    
    [self GET:@"speakers.json" parameters:nil resultClass:TWSpeaker.class resultKeyPath:@"speakers" completion:^(AFHTTPRequestOperation *operation, id responseObject, NSError *error) {
        block(responseObject, error);
    }];
}
@end
