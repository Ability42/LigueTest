//
//  LigueTests.m
//  LigueTests
//
//  Created by Stepan Paholyk on 11/12/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Player.h"
#import "Tournament.h"

@interface LigueTests : XCTestCase

@end

@implementation LigueTests

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
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void) testTournamentFunctionality {
    NSArray<Player*> *players = @[[[Player alloc] initWithName:@"Stepan"
                                                       andClub:[[Club alloc] initWithTitle:@"Barcelona"]],
                                  [[Player alloc] initWithName:@"Andy"
                                                       andClub:[[Club alloc] initWithTitle:@"Real"]],
                                  [[Player alloc] initWithName:@"Peter"
                                                       andClub:[[Club alloc] initWithTitle:@"Atletiko"]],
                                  [[Player alloc] initWithName:@"Tom"
                                                       andClub:[[Club alloc] initWithTitle:@"Dinamo"]],
                                  [[Player alloc] initWithName:@"Jerry"
                                                       andClub:[[Club alloc] initWithTitle:@"Manchester"]],
                                  [[Player alloc] initWithName:@"Kim"
                                                       andClub:[[Club alloc] initWithTitle:@"Chelsea"]],
                                  [[Player alloc] initWithName:@"Donald"
                                                       andClub:[[Club alloc] initWithTitle:@"Arsenal"]],
                                  [[Player alloc] initWithName:@"John"
                                                       andClub:[[Club alloc] initWithTitle:@"Borussia D."]]
                                  ];
    
    Tournament *testTournament = [[Tournament alloc] initWithPlayers:players];
    
    
    
    
    NSArray *testMatches = [testTournament.tournamentStage currentMatchesWithPlayers:players];
    [self testSetRandomGoalsForMatches:testMatches];
    for (Match* match in testMatches) {
        NSLog(@"%@", match);
    }
    
    testMatches = [testTournament.tournamentStage nextStage];
    [self testSetRandomGoalsForMatches:testMatches];
    for (Match* match in testMatches) {
        NSLog(@"%@", match);
    }
    

}

- (void)testSetRandomGoalsForMatches:(NSArray<Match*>*)matches
{
    for (Match *match in matches) {
        match.homeGoals = arc4random() % 5;
        match.awayGoals = arc4random() % 5;
        if (match.homeGoals == match.awayGoals) {
            match.homeGoals = match.homeGoals+1;
        }
    }
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
