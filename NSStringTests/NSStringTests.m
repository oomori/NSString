//
//  NSStringTests.m
//  NSStringTests
//
//  Created by 大森 智史 on 12/01/30.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "NSStringTests.h"

#import "OOOAppDelegate.h"
OOOAppDelegate * obj;


@implementation NSStringTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    obj = [[OOOAppDelegate alloc] init];
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    //STFail(@"Unit tests are not implemented yet in NSStringTests");
    
    STAssertEqualObjects([obj method001_UTF8String], @"string", @"string?");
    STAssertEqualObjects([obj method002_initWithCString], @"string", @"string?");
    STAssertEqualObjects([obj method003_initWithUTF8String], @"string", @"string?");
    STAssertEquals([obj method004], (NSUInteger)6,@"string");
    STAssertEquals([obj method005], (unichar)105, @"string");
    STAssertEqualObjects([obj method006], @"參xx", @"string?");
    STAssertEqualObjects([obj method007], @"in", @"string?");
    STAssertEqualObjects([obj method008], @"string", @"string?");
    STAssertEqualObjects([obj method009], @"string", @"string?");
    //STAssertEqualObjects([obj method010], @"aaaaaaaaaaaaaaaaaa", @"string?");
    STAssertEqualObjects([obj method011], @"string", @"string?");

    
    
    

}

@end
