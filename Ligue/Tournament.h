//
//  Tournament.h
//  Ligue
//
//  Created by Stepan Paholyk on 11/13/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface Tournament : NSObject



@property (nonatomic) NSArray<Player*>* players;
// Gropus property need?

- (instancetype)initWithPlayers:(NSArray<Player*>*)players;
- (NSArray<Player *> *) createSheldueForTournamentWithPlayers:(NSArray<Player*>*)players;
- (NSArray<Player *> *) randomIndexesForPlayers:(NSArray<Player *> *)players;


@end
