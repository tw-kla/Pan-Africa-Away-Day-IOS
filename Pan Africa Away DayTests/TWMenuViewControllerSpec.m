//
//  TWMenuViewControllerSpec.m
//  Pan Africa Away Day
//
//  Created by James Muranga on 1/3/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TWMenuViewController.h"
#import "TWRootViewController.h"

#import "Kiwi.h"

SPEC_BEGIN(MenuViewControllerSpec)

describe(@"MenuViewController", ^{
    it(@"should setup the tableview", ^{
        TWMenuViewController *controller = [[TWMenuViewController alloc]init];
       [controller stub:@selector(setupTableView)];
        [[[controller should] receive] setupTableView];
        [controller viewDidLoad];
        
    });
    
    
});

SPEC_END
