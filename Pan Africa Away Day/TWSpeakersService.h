//
//  TWSpeakersService.h
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/18/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import "OVCClient.h"

@interface TWSpeakersService : OVCClient
- (void)allSpeakers:(void (^)(NSArray *results, NSError *error))block;
@end
