//
//  Tournament.m
//  Ligue
//
//  Created by Stepan Paholyk on 11/13/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "Tournament.h"

@implementation Tournament

#pragma mark - Initialization

- (instancetype)initWithPlayers:(NSArray<Player*>*)players withKnockoutType:(BOOL)knockout
{
    self = [super init];
    if (self) {
        self.knockout = knockout;
        self.players = players;
        self.initialStages = [[NSMutableArray alloc] initWithCapacity:[players count]/2];
    }
    return self;
}


#pragma mark - Tournament stand methods
/// Accepts array of players and returns array of balanced tournament matches
- (NSArray<Stage*>*) shleldueForPlayers:(NSArray<Player*>*)players
{
    NSArray<Player*> *shuffledPlayers = [self shufflePlayers:players];
    self.players = shuffledPlayers;
    
    NSMutableArray *stagesMutable = [[NSMutableArray alloc] initWithCapacity:[shuffledPlayers count]/2];
    
    if ([shuffledPlayers count] < 2) {
        self.winner = [self.players objectAtIndex:0];
        
    } else {
    
        if (self.knockout) {
            for (int i = 0; i < [self.players count]; i++) {
                if (i%2) {
                    Player *homePl = shuffledPlayers[i-1];
                    Player *awayPl = shuffledPlayers[i];
                    Stage *stage = [[Stage alloc] initWithHomePlayer:homePl andAwayPlayer:awayPl];
                    [stagesMutable addObject:stage];
                }
            }
        }
        
        // if plays 2 games go to next stage;
        self.currentStages = stagesMutable;
    }
    return stagesMutable;
}

- (NSArray<Stage*>*) reloadSheldueAfterStage
{
    
    NSMutableArray<Player*> *playersInCurrentStage = [[NSMutableArray alloc] initWithCapacity:[self.currentStages count]];
    
    
    for (int i = 0; i < [self.currentStages count]; i++) {
        Stage *stage = self.currentStages[i];
        
        if (stage.homeGoals > stage.awayGoals) {
            Player *stageWinner = stage.home;
            [playersInCurrentStage addObject:stageWinner];
            
        } else if(stage.homeGoals < stage.awayGoals) {
            Player *stageWinner = stage.away;
            [playersInCurrentStage addObject:stageWinner];
            
        } else {
            Player *stageWinner = stage.away;
            // Penalty series
            // This line of code prevented from running in Match init Method
            [playersInCurrentStage addObject:stageWinner];
            
        }
    }
    NSArray<Stage*> *stages = [self shleldueForPlayers:playersInCurrentStage];
    return stages;
    
}

- (NSArray<Player *> *) shufflePlayers:(NSArray<Player *> *)players
{
    NSMutableArray<Player*> *shuffledPlayersArray = [NSMutableArray arrayWithArray:players];
    for (int i = 0; i<[players count]; i++) {
        int randomIndex = arc4random()%[players count];
        [shuffledPlayersArray exchangeObjectAtIndex:i withObjectAtIndex:randomIndex];
    }
    return shuffledPlayersArray;
}


#pragma mark - Test methods

- (void) setRandomGoalsForCurrentStages {
    for (int i = 0; i < [self.currentStages count]; i++) {
        Stage *stage = self.currentStages[i];
        
        stage.awayGoals = arc4random()%5;
        stage.homeGoals = arc4random()%5;
        if (stage.homeGoals == stage.awayGoals) {
            stage.homeGoals += 1;
        }
    }
}
@end
