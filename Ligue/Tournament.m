//
//  Tournament.m
//  Ligue
//
//  Created by Stepan Paholyk on 11/13/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "Tournament.h"

@implementation Tournament

- (instancetype)initWithPlayers:(NSArray<Player*>*)players
{
    self = [super init];
    if (self) {
        self.players = [self shufflePlayers:players];
        self.stages = [[NSMutableArray alloc] initWithCapacity:[players count]/2];
    }
    return self;
}

- (NSArray<Stage *> *) shleldueForPlayers:(NSArray<Player *> *)players
{
    NSMutableArray *stagesMutable = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < [players count]; i++) {
        if (i%2) {
            Player *homePl = players[i-1];
            Player *awayPl = players[i];
            Stage *stage = [[Stage alloc] initWithHomePlayer:homePl andAwayPlayer:awayPl];
            [stagesMutable addObject:stage];
        }
    }
    
    // if plays 2 games go to next stage;
    return stagesMutable;
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
@end
