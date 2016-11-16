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
    
    NSMutableArray<Match*> *matches = [[NSMutableArray alloc] initWithCapacity:[self.players count]/2];
    self.players = players;
    
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
    if ([self allMatchesPlayedInCurrentStage]) {

        
        Player *matchWinner = nil;
        for (int i = 0; i < [self.initialMatches count]; i++) {
            Match *match = self.initialMatches[i];
            
            if (match.homeGoals > match.awayGoals) {
                matchWinner = match.home;
                [playersInCurrentStage addObject:matchWinner];
                
            } else if(match.homeGoals < match.awayGoals) {
                matchWinner = match.away;
                [playersInCurrentStage addObject:matchWinner];
                
            }
        }
    }
    NSArray<Match*> *stages = [self initialMatchesWithPlayers:playersInCurrentStage];
    return stages;
}

- (BOOL) allMatchesPlayedInCurrentStage
{
    BOOL result = nil;
    for (Match *match in self.initialMatches) {
        if (match.homeGoals != -1 && match.awayGoals != -1) {
            result = NO;
        } else {
            result = YES;
            break;
        }
    }
    return result;
}

- (BOOL) isWinner
{
    return [self.players count] == 1 ? YES : NO;
}



@end

