//
//  Tournament.h
//  Ligue
//
//  Created by Stepan Paholyk on 11/16/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "GroupStage.h"
#import "TournamentStage.h"

@interface Tournament : NSObject

- (instancetype)initWithPlayers:(NSArray<Player*>*)players;

@property (nonatomic) GroupStage *groupStage;
@property (nonatomic) TournamentStage *tournamentStage;

@end
