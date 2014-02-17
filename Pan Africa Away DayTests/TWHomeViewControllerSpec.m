//
//  TWHomeViewControllerSpec.m
//  Away Day 2014
//
//  Created by James Muranga on 2/5/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//


#import "TWHomeViewController.h"
#import "TWAppDelegate.h"

@interface TWHomeViewControllerSpec : XCTestCase
@property(retain,strong) TWHomeViewController *sut;
@end

@implementation TWHomeViewControllerSpec
@synthesize sut;
- (void)setUp
{
    [super setUp];
    sut = [[TWHomeViewController alloc]init];
    TWAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    sut.managedObjectContext = appDelegate.managedObjectContext;
    
    [sut view];
    
}

- (void)tearDown
{
    
    [super tearDown];
}


- (void)testNavigationBarShouldBeConnected
{
    
    assertThat(sut.navigationBar, is(notNilValue()));
}

- (void)testSyncBarButtonShouldBeConnected
{
    
    assertThat(sut.syncButton, is(notNilValue()));
}

- (void)testSyncButtonAction
{
    
    assertThat(NSStringFromSelector ([sut.syncButton action]),equalTo(@"syncSessionsAndSpeakers:"));
}

- (void)testSegementControlShouldBeConnected
{
    
    assertThat(sut.sessionTypeSegementControl, is(notNilValue()));
}

- (void)testSessionTypeSegementControlButtonAction
{
    [sut view];
    assertThat([sut.sessionTypeSegementControl actionsForTarget:sut forControlEvent:UIControlEventValueChanged],
               contains(@"segmentControlValueChanged:", nil));
}




@end
