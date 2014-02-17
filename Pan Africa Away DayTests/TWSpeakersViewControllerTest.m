//
//  TWSpeakersViewControllerTest.m
//  Away Day 2014
//
//  Created by James Muranga on 2/16/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//


#import "TWSpeakersViewController.h"
@interface TWSpeakersViewControllerTest : XCTestCase
@property(retain,strong) TWSpeakersViewController *sut;
@end

@implementation TWSpeakersViewControllerTest

@synthesize sut;
- (void)setUp
{
    [super setUp];
    sut = [[TWSpeakersViewController alloc]init];
    
    
    [sut view];
    
}

- (void)tearDown
{
    
    [super tearDown];
}

- (void)testTableViewShouldBeConnected
{
    [sut view];
    assertThat(sut.tableView, is(notNilValue()));
}


@end
