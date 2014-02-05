//
//  TWHomeViewControllerSpec.m
//  Away Day 2014
//
//  Created by James Muranga on 2/5/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TWHomeViewController.h"
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>

@interface TWHomeViewControllerSpec : XCTestCase
@property(retain,strong) TWHomeViewController *sut;
@end

@implementation TWHomeViewControllerSpec
@synthesize sut;
- (void)setUp
{
    [super setUp];
    sut = [[TWHomeViewController alloc]init];
}

- (void)tearDown
{
    
    [super tearDown];
}


- (void)testNavigationBarShouldBeConnected
{
    [sut view];
    assertThat(sut.navigationBar, is(notNilValue()));
}

- (void)testSyncBarButtonShouldBeConnected
{
    [sut view];
    assertThat(sut.syncButton, is(notNilValue()));
}

- (void)testSyncButtonAction
{
    [sut view];
    assertThat(NSStringFromSelector ([sut.syncButton action]),equalTo(@"syncSessionsAndSpeakers:"));
}




@end
