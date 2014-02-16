//
//  TWSessionDetailViewControllerTest.m
//  Away Day 2014
//
//  Created by James Muranga on 2/16/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TWSessionDetailViewController.h"
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#import <OCMock/OCMock.h>
#import "TWAppDelegate.h"
#import "Session.h"

@interface TWSessionDetailViewControllerTest : XCTestCase
@property(retain,strong) TWSessionDetailViewController *sut;
@end

@implementation TWSessionDetailViewControllerTest

@synthesize sut;
- (void)setUp
{
    [super setUp];
    sut = [[TWSessionDetailViewController alloc]init];
    TWAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    Session * session =  [NSEntityDescription
                          insertNewObjectForEntityForName:@"Session" inManagedObjectContext:appDelegate.managedObjectContext];
    session.title = @"WonderFul Session";
    session.sessionDescription = @"Clear Session";
    
    [sut setSession:session];
    [sut view];
    
}

- (void)tearDown
{
    
    [super tearDown];
}

- (void)testDetailLabelShouldBeConnected
{
 
    assertThat(sut.detailLabel, is(notNilValue()));
}

- (void)testmainImageShouldBeConnected
{

    assertThat(sut.mainImageView, is(notNilValue()));
}


- (void)testtimeLabelShouldBeConnected
{
        assertThat(sut.timeLabel, is(notNilValue()));
}


- (void)testtitleLabelShouldBeConnected
{
   
    assertThat(sut.titleLabel, is(notNilValue()));
}

-(void) testThatTheSessionTitleTextIsSet{
    assertThat(sut.titleLabel.text, is(@"WonderFul Session"));
}

-(void) testThatTheSessionDescriptionTextIsSet{
    assertThat(sut.detailLabel.text, is(@"Clear Session"));
}


-(void) testThatTheTitleIsSet{
    assertThat(sut.title, is(@"WonderFul Session"));
}
@end
