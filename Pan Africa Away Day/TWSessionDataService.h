//
//  TWSessionList.h
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/17/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "OVCClient.h"

@interface TWSessionDataService : OVCClient
- (void)allSessions:(void (^)(NSArray *results, NSError *error))block;

@end
