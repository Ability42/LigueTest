//
//  Tournament.m
//  Ligue
//
//  Created by Stepan Paholyk on 11/13/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "Tournament.h"
#import "Group.h"

@implementation Tournament

#pragma mark - Initialization

- (instancetype)initWithPlayers:(NSArray<Player*>*)players withKnockoutType:(BOOL)knockout
{
    self = [super init];
    if (self) {
        self.players = [self shufflePlayers:players;
        self.initialMatches = [[NSMutableArray alloc] initWithCapacity:[players count]/2];
    }
    return self;
}

#pragma mark - Lazy Instantiation

- (NSMutableArray<Group*>*) groups
{
    if (!_groups) {
        _groups = [[NSMutableArray alloc] initWithCapacity:[self.players count]/4];
    }
    return _groups;
}

#pragma mark - Tournament stand methods

/// Accepts array of players and returns array of balanced tournament matches
- (NSArray<Match*>*) initialMatchesWithPlayers:(NSArray<Player*>*)players withKnockout:(BOOL)knockout
{
    NSArray<Player*> *shuffledPlayers = [self shufflePlayers:players];
    NSMutableArray<Match*> *matches = [[NSMutableArray alloc] initWithCapacity:[self.players count]/2];
    self.players = shuffledPlayers;
    
    if ([self isWinner]) {
        NSLog(@"Winner: %@", [self.players lastObject]);
    } else {
        if (knockout) {
            for (int i = 0; i < [self.players count]; i++) {
                if (i%2 == 1) {
                    Player *homePl = self.players[i-1];
                    Player *awayPl = self.players[i];
                    Match *match = [[Match alloc] initWithHomePlayer:homePl andAwayPlayer:awayPl];
                    [matches addObject:match];
                }
            }
        } else {
            // if each Player plays Matches home and away
            
        }
        
        self.initialMatches = matches;
    }
    return matches;
}
/// if all matches in current stage is played
/// returns a Matches of next stage
- (NSArray<Match*>*) nextStageWithKnockoutType:(BOOL)knockout
{
    
    NSMutableArray<Player*> *playersInCurrentStage = [[NSMutableArray alloc] initWithCapacity:[self.initialMatches count]];
    
    
    for (int i = 0; i < [self.initialMatches count]; i++) {
        Match *match = self.initialMatches[i];
        
        if (match.homeGoals > match.awayGoals) {
            Player *matchWinner = match.home;
            [playersInCurrentStage addObject:matchWinner];
            
        } else if(match.homeGoals < match.awayGoals) {
            Player *matchWinner = match.away;
            [playersInCurrentStage addObject:matchWinner];
            
        } else {
            
            // Penalty series
            
        }
    }
    NSArray<Match*> *stages = [self initialMatchesWithPlayers:playersInCurrentStage withKnockout:knockout];
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

- (NSArray<Group*>*) createGroupsWithPlayers:(NSArray<Player*>*)players {
    
    NSMutableArray<Player*> *playersForGroup = [[NSMutableArray alloc] initWithArray:players];
    
    for (int i = 0; i < [self.players count]; i++) {
        
        if (playersForGroup) {
            if (i % 4 == 0) {
                NSRange effectiveRange = NSMakeRange(0,4);
                Group *group = [[Group alloc] initWithName:[NSString stringWithFormat:@"Group #%d", i/4] andPlayers:[playersForGroup subarrayWithRange:effectiveRange]];
                [playersForGroup removeObjectsInRange:effectiveRange];
                [self.groups addObject:group];
            }
        } else {
            NSLog(@"Groups created");
            break;
        }
        
    }
    
    return self.groups;
}


#pragma mark - Test methods

- (void) setRandomGoalsForCurrentStages {
    for (int i = 0; i < [self.initialMatches count]; i++) {
        Match *stage = self.initialMatches[i];
        
        stage.awayGoals = arc4random()%5;
        stage.homeGoals = arc4random()%5;
        if (stage.homeGoals == stage.awayGoals) {
            stage.homeGoals += 1;
        }
    }
}

- (NSArray<Match*>*) getCurrentStageMatches
{
    return self.initialMatches;
}

- (BOOL) isWinner
{
    return [self.players count] == 1 ? YES : NO;
}
@end
