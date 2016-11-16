//
//  TournamentStage.m
//  Ligue
//
//  Created by Stepan Paholyk on 11/16/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "TournamentStage.h"

@implementation TournamentStage



- (instancetype)initWithPlayers:(NSArray<Player*>*)players
{
    self = [super init];
    if (self) {
        self.players = players;
    }
    return self;
}



- (NSArray<Match*>*) initialMatchesWithPlayers:(NSArray<Player*>*)players
{
    NSArray<Player*> *shuffledPlayers = players;
    NSMutableArray<Match*> *matches = [[NSMutableArray alloc] initWithCapacity:[self.players count]/2];
    self.players = shuffledPlayers;
    
    if ([self isWinner]) {
        NSLog(@"Winner: %@", [self.players lastObject]);
        _winner = YES;
    } else {

        for (int i = 0; i < [self.players count]; i++) {
            if (i%2 == 1) {
                Player *homePl = self.players[i-1];
                Player *awayPl = self.players[i];
                Match *match = [[Match alloc] initWithHomePlayer:homePl andAwayPlayer:awayPl];
                [matches addObject:match];
            }
        }
        
        self.initialMatches = matches; // TODO: initialMatches needed?
    }
    return matches;
}



- (NSArray<Match*>*) nextStage
{
    
    NSMutableArray<Player*> *playersInCurrentStage = [[NSMutableArray alloc] init];
    
    Player *matchWinner = nil;
    for (int i = 0; i < [self.initialMatches count]; i++) {
        Match *match = self.initialMatches[i];
        
        if (match.homeGoals > match.awayGoals) {
            matchWinner = match.home;
            [playersInCurrentStage addObject:matchWinner];
            
        } else if(match.homeGoals < match.awayGoals) {
            matchWinner = match.away;
            [playersInCurrentStage addObject:matchWinner];
            
        } else {
            
            // Penalty series
            
        }
    }
    NSArray<Match*> *stages = [self initialMatchesWithPlayers:playersInCurrentStage];
    return stages;
}


- (BOOL) isWinner
{
    return [self.players count] == 1 ? YES : NO;
}

@end

