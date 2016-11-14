//
//  Player.m
//  Ligue
//
//  Created by Stepan Paholyk on 11/12/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "Player.h"

@interface Player ()


@end

@implementation Player

#pragma mark - Initialization

- (instancetype)initWithName:(NSString*)name andClub:(Club*)club
{
    self = [super init];
    if (self) {
        self.name = name;
        self.club = club;
    }
    return self;
}


#pragma mark - Lazy Init

- (void) createPlayersGameMatrix:(NSArray*)players
{
    
    NSUInteger playersCount = [players count];
    NSMutableArray *tmpArrray = [NSMutableArray arrayWithArray:players];
    NSLog(@"Players: %@", players);
    
    
    NSMutableArray *gameMatrix = [NSMutableArray array];
    
    for (NSUInteger i = 0; i < playersCount; i++) {
        if (i < playersCount-1) {
            [tmpArrray exchangeObjectAtIndex:0 withObjectAtIndex:i+1];
            NSArray * tmp = [tmpArrray copy];
            NSLog(@"tmpArray: %@", tmp);
            [gameMatrix addObject:tmp];
        }
    }
    
    NSLog(@"%@", gameMatrix);
}

- (NSString*) description {
    return [NSString stringWithFormat:@"%@(%@)", self.name, self.club.title];
}


@end
