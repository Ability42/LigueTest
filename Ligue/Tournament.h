//
//  Tournament.h
//  Ligue
//
//  Created by Stepan Paholyk on 11/13/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Match.h"
#import "Group.h"
#import "Penalty.h"

@interface Tournament : NSObject

@property (nonatomic) NSArray<Player*>* players;
@property (nonatomic) NSArray<Match*>* initialMatches;
@property (nonatomic) BOOL *teamAlreadyPlayFirstGame; //only if !knockoutType
@property (nonatomic) NSMutableArray<Group*>* groups;
@property (nonatomic) BOOL winner;


- (instancetype)initWithPlayers:(NSArray<Player*>*)players withKnockoutType:(BOOL)knockout;

- (NSArray<Match*>*) initialMatchesWithPlayers:(NSArray<Player*>*)players withKnockout:(BOOL)knockout;
- (NSArray<Player*>*) shufflePlayers:(NSArray<Player *> *)players;
- (NSArray<Match*>*) nextStageWithKnockoutType:(BOOL)knockout;
- (NSArray<Group*>*) createGroupsWithPlayers:(NSArray<Player*>*)players;

- (void) setRandomGoalsForCurrentStages;
- (BOOL) isWinner;
@end
