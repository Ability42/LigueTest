//
//  GroupStage.m
//  Ligue
//
//  Created by Stepan Paholyk on 11/16/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "GroupStage.h"

@implementation GroupStage

- (instancetype)initWithPlayers:(NSArray<Player*>*)players
{
    self = [super init];
    if (self) {
        self.players = players;
    }
    return self;
}

#pragma mark - Lazy Init

- (NSArray<Group*>*) groups
{
    if (!_groups) {
        _groups = [[NSArray alloc] init];
    }
    return _groups;
}

- (NSArray<Player*>*) players
{
    if (!_players) {
        _players = [[NSMutableArray alloc] init];
    }
    return _players;
}

- (NSArray<Match*>*) getMatchesForGroup:(Group*)group {
    // here Swift script is executed
    return nil;
}

- (NSArray<Group*>*) createGroupsWithPlayers:(NSArray<Player*>*)players {
    
    NSMutableArray<Player*> *playersForGroup = [[NSMutableArray alloc] initWithArray:players];
    NSMutableArray<Group*> *groups = [[NSMutableArray alloc] init];
    for (int i = 0; i < [self.players count]; i++) {
        
        if ([playersForGroup count] > 0) {
            if (i % 4 == 0) {
                NSRange effectiveRange = NSMakeRange(0,4);
                Group *group = [[Group alloc] initWithName:[NSString stringWithFormat:@"Group #%d", i/4] andPlayers:[playersForGroup subarrayWithRange:effectiveRange]];
                [playersForGroup removeObjectsInRange:effectiveRange];
                [groups addObject:group];
            }
        } else {
            NSLog(@"Groups created");
            break;
        }
        
    }
    
    return groups;
}

@end
