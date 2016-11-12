//
//  Player.m
//  Ligue
//
//  Created by Stepan Paholyk on 11/12/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "Player.h"

@implementation Player

- (void) calculateTestSheldueForPlayers:(NSArray*)players
{
    NSUInteger playersCount = [players count];
    
    NSMutableArray *tmpArrray = [NSMutableArray arrayWithArray:players];
    NSLog(@"Players: %@", players);
    
    for (NSUInteger i = 0; i < playersCount; i++) {
        if (i < playersCount-1) {
            [tmpArrray exchangeObjectAtIndex:0 withObjectAtIndex:i+1];
            NSLog(@"tmpArray: %@", tmpArrray);
        }
    }
    
}

@end
