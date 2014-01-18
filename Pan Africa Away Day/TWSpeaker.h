//
//  TWSpeaker.h
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/18/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mantle.h"

@interface TWSpeaker : MTLModel <MTLJSONSerializing>
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *bio;
@property (nonatomic, copy, readonly) NSNumber *id;
@property (nonatomic, copy, readonly) NSString *photo;
@end
