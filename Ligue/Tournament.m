//
//  Tournament.m
//  Ligue
//
//  Created by Stepan Paholyk on 11/13/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "Tournament.h"

@implementation Tournament

- (instancetype)initWithPlayers:(NSArray<Player*>*)players withKnockoutType:(BOOL)knockout
{
    self = [super init];
    if (self) {
        self.knockout = knockout;
        self.players = [self shufflePlayers:self.players];
        self.initialStages = [[NSMutableArray alloc] initWithCapacity:[players count]/2];
    }
    return self;
}

- (NSArray<Stage *> *) shleldueForPlayers:(NSArray<Player *> *)players
{
    NSMutableArray *stagesMutable = [[NSMutableArray alloc] initWithCapacity:[players count]/2];
    
    if ([players count] < 2) {
        NSLog(@"Winner: %@!!!", [players objectAtIndex:0]);
    } else {
    
        
        if (self.knockout) {
            for (int i = 0; i < [players count]; i++) {
                if (i%2) {
                    Player *homePl = players[i-1];
                    Player *awayPl = players[i];
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

- (NSArray<Player*>*) reloadSheldueAfterStage
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
    
    return playersInCurrentStage;
    
}

- (NSArray<Player *> *) shufflePlayers:(NSArray<Player *> *)players
{
    NSMutableArray<Player*> *initialArray = [NSMutableArray arrayWithArray:players];
    for (int i = 0; i<[players count]; i++) {
        int randomIndex = arc4random()%[players count];
        [initialArray exchangeObjectAtIndex:i withObjectAtIndex:randomIndex];
    }
    return initialArray;
}

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
