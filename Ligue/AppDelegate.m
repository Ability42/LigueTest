//
//  AppDelegate.m
//  Ligue
//
//  Created by Stepan Paholyk on 11/12/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "AppDelegate.h"
#import "Player.h"
#import "Match.h"
#import "Tournament.h"
#import "Stage.h"

@interface AppDelegate ()

@property(nonatomic) Tournament *tournament;
@property(nonatomic) NSArray<Player*> *players;
@property(nonatomic) BOOL *winner;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

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
    self.players = players;
    
/*

    NSArray<Match*> *resultMatches = [self createPlayersGameMatrix:players];
    NSLog(@"%@", resultMatches);
    
    // Tournament, you may think those is a shitty code(because it's staightforward^ without any loop),
    // but it's test code, and it good for testing our model
    
    
    Tournament *tournament = [[Tournament alloc] initWithPlayers:players withKnockoutType:YES];
    if ([tournament correctNumberOfInitialTeams]) {
        NSArray<Stage*> *stagesArray = [tournament shleldueForPlayers:players];
        [tournament setRandomGoalsForCurrentStages];
        NSLog(@"Stage 1/%lu", (unsigned long)[players count]);
        
        for (Stage* stage in stagesArray) {
            NSLog(@"%@",stage);
        }
        
        
        players = [tournament reloadSheldueAfterStage];
        stagesArray = [tournament shleldueForPlayers:players];
        [tournament setRandomGoalsForCurrentStages];
        
        NSLog(@"Stage 1/%lu", (unsigned long)[players count]);
        for (Stage* stage in stagesArray) {
            NSLog(@"%@",stage);
        }
        
        
        players = [tournament reloadSheldueAfterStage];
        stagesArray = [tournament shleldueForPlayers:players];
        [tournament setRandomGoalsForCurrentStages];
        NSLog(@"Stage 1/%lu", (unsigned long)[players count]);
        for (Stage* stage in stagesArray) {
            NSLog(@"%@",stage);
        }
        
        
        
        players = [tournament reloadSheldueAfterStage];
        [tournament setRandomGoalsForCurrentStages];
        NSLog(@"Stage 1/%lu", (unsigned long)[players count]);
        stagesArray = [tournament shleldueForPlayers:players];
        
    } else {
        NSLog(@"Number of teams must be exp^2");
    }
*/
    
    
    while ([self correctNumberOfInitialTeams] && !self.winner) {
        
        Tournament *tournament = [self createTournamentForPlayers:self.players withKnockoutType:YES];
        self.tournament = tournament;
        
        NSArray<Stage*> *stages = [self createInitialStageWithKnockoutType:YES];
        [tournament setRandomGoalsForCurrentStages];
        
        for (NSUInteger i = [tournament.players count]/2; i > 0; i = i/2) {
            NSLog(@"Stage 1/%ld %@", i, stages);
            stages = [self nextStageForPlayers];
            [tournament setRandomGoalsForCurrentStages];
            if (i == 1) {
                NSLog(@"Winner %@", tournament.winner);
            }
        }
        break;
    }
    
    
    return YES;
}

#pragma mark - Model Test
///Returns initial tournament stage
- (Tournament*) createTournamentForPlayers:(NSArray<Player*>*)players withKnockoutType:(BOOL)knockout
{
    return [[Tournament alloc] initWithPlayers:players withKnockoutType:knockout];
}

///Returns inital tournament sheldue
- (NSArray<Stage*>*) createInitialStageWithKnockoutType:(BOOL)knockout
{
    return [self.tournament shleldueForPlayers:self.tournament.players];
}

/// returns next stage after all teams played all matches in current stage
- (NSArray<Stage*>*) nextStageForPlayers
{
    return [self.tournament reloadSheldueAfterStage];
}

- (BOOL) correctNumberOfInitialTeams {
    NSUInteger numberOfPlayers = [self.players count];
    while (numberOfPlayers == 1) {
        numberOfPlayers = numberOfPlayers / 2;
    }
    if (numberOfPlayers == 1) {
        return false;
    } else {
        return true;
    }
}

#pragma mark - Game Matrix
// We didn't use those method in our apps, that we have tournament_generator

- (NSArray<Match*>*) createPlayersGameMatrix:(NSArray<Player*>*)players
{
    
    NSMutableArray<Match*> *matches = [[NSMutableArray alloc] init];
    
    NSUInteger playersCount = [players count];
    NSMutableArray *tmpArrray = [players mutableCopy];
    NSLog(@"Players: %@", players);
    
    
    for (NSUInteger i = 0; i < playersCount; i++) {
        if (i < playersCount-1) {
            NSArray<Player*> *tmp = [tmpArrray subarrayWithRange:NSMakeRange(1, playersCount-1)];
            [matches addObjectsFromArray:[self createMatchesForPlayer:[tmpArrray firstObject] withPlayers:tmp]];
            [tmpArrray exchangeObjectAtIndex:0 withObjectAtIndex:i+1];
        }
    }
    [matches addObjectsFromArray:[self createMatchesForPlayer:[players lastObject] withPlayers:[players subarrayWithRange:NSMakeRange(0, playersCount - 1)]]];
    
    return matches;
}

- (NSArray<Match*>*) createMatchesForPlayer:(Player*)player withPlayers:(NSArray<Player*>*) players
{
    NSMutableArray<Match*> *matches = [[NSMutableArray alloc] initWithCapacity:[players count]];
    
    for (Player *pl in players) {
        Match *match = [[Match alloc] init];
        match.home = player;
        match.away = pl;
        [matches addObject:match];
    }
    return matches;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
