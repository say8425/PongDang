//
//  PongDangTests.m
//  PongDangTests
//
//  Created by Cheon Park on 2014. 7. 3..
//  Copyright (c) 2014년 northPenguin. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface pongDangTests : XCTestCase

@end

@implementation pongDangTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
