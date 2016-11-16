//
//  TournamentStage.h
//  Ligue
//
//  Created by Stepan Paholyk on 11/16/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Match.h"
 
@interface TournamentStage : NSObject

@property (nonatomic) NSArray<Player*>* players;
@property (nonatomic) BOOL winner;
@property (nonatomic) NSArray<Match*>* initialMatches;

- (instancetype)initWithPlayers:(NSArray<Player*>*)players;

- (NSArray<Match*>*) initialMatchesWithPlayers:(NSArray<Player*>*)players;
- (NSArray<Match*>*) nextStage;
@end
