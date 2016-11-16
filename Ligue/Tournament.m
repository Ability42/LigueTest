//
//  Tournament.m
//  Ligue
//
//  Created by Stepan Paholyk on 11/16/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "Tournament.h"

@implementation Tournament

- (instancetype)initWithPlayers:(NSArray<Player*>*)players
{
    self = [super init];
    if (self) {
        NSUInteger playersCount = [players count];
        
        if ([self correctNumberOfPlayers:playersCount]) {
            if (playersCount > 8) {
                GroupStage *groupStage = [[GroupStage alloc] initWithPlayers:players];
                self.groupStage = groupStage;
            } else if (playersCount <= 8) {
                TournamentStage *tournamentStage = [[TournamentStage alloc] initWithPlayers:players];
                self.tournamentStage = tournamentStage;
            }
        }
    }
    return self;
}

- (BOOL) correctNumberOfPlayers:(NSUInteger)numberOfPlayers
{
    while (numberOfPlayers > 1) {
        numberOfPlayers = numberOfPlayers / 2;
    }
    if (numberOfPlayers == 1) {
        return true;
    } else {
        return false;
    }
}


@end
