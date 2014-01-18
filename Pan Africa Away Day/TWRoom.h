//
//  TWRoom.h
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/17/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Mantle.h"

@interface TWRoom : MTLModel <MTLJSONSerializing>
@property (nonatomic, copy, readonly) NSString *colour;
@property (nonatomic, copy, readonly) NSString *name;
@end
