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
        self.players = players;
        
    }
    return self;
}
/*
- (NSArray<Player *> *) createSheldueForTournamentWithPlayers:(NSArray<Player *> *)players
{
    if ([players count] == [self.players count]) {
        NSMutableArray<Player*> *initialArray = [NSMutableArray arrayWithArray:players];
    }
    for (int i = 0; i < [players count]/2; i++) {
        if ([players count] == 2) {
            break;
        } else {
            
            [self createSheldueForTournamentWithPlayers:<#(NSArray<Player *> *)#>]
        }
    }
    
}
 */

- (NSArray<Player *> *) randomIndexesForPlayers:(NSArray<Player *> *)players
{
    NSMutableArray<Player*> *initialArray = [NSMutableArray arrayWithArray:players];
    for (int i = 0; i<[players count]; i++) {
        int randomIndex = arc4random()%[players count];
        [initialArray exchangeObjectAtIndex:i withObjectAtIndex:randomIndex];
    }
    return initialArray;
}
@end
