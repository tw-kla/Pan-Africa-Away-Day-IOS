//
//  TWSpeakerDetailViewControllerTest.m
//  Away Day 2014
//
//  Created by James Muranga on 2/17/14.
//  Copyright (c) 2014 Thoughtworks. All rights reserved.
//


#import "TWSpeakerDetailViewController.h"

#import "TWAppDelegate.h"
#import "Speaker.h"
@interface TWSpeakerDetailViewControllerTest : XCTestCase
@property(retain,strong) TWSpeakerDetailViewController *sut;
@end

@implementation TWSpeakerDetailViewControllerTest

@synthesize sut;
- (void)setUp
{
    [super setUp];
    sut = [[TWSpeakerDetailViewController alloc]init];
    TWAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    Speaker * speaker =  [NSEntityDescription
                          insertNewObjectForEntityForName:@"Speaker" inManagedObjectContext:appDelegate.managedObjectContext];
    speaker.name = @"WonderFul Speaker";
    speaker.bio = @"Clear Speaker";
    
    [sut setSpeaker:speaker];
    [sut view];
    
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testMainImageShouldBeConnected
{
    
    assertThat(sut.mainImageView, is(notNilValue()));
}

- (void)testNameLabelShouldBeConnected
{
    
    assertThat(sut.labelName, is(notNilValue()));
}

- (void)testBioLabelShouldBeConnected
{
    
    assertThat(sut.bioLabel, is(notNilValue()));
}

-(void) testThatTheSpeakerNameTextIsSet{
    assertThat(sut.labelName.text, is(@"WonderFul Speaker"));
}

-(void) testThatTheSpeakerBioTextIsSet{
    assertThat(sut.bioLabel.text, is(@"Clear Speaker"));
}


-(void) testThatTheTitleIsSet{
    assertThat(sut.title, is(@"WonderFul Speaker"));
}

@end
