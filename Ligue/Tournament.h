//
//  Tournament.h
//  Ligue
//
//  Created by Stepan Paholyk on 11/13/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "Stage.h"

@interface Tournament : NSObject



@property (nonatomic) NSArray<Player*>* players;
@property (nonatomic) NSMutableArray<Stage*>* stages;
// Gropus property need?

- (instancetype)initWithPlayers:(NSArray<Player*>*)players;
- (NSArray<Stage *> *) shleldueForPlayers:(NSArray<Player*>*)players;
- (NSArray<Player *> *) shufflePlayers:(NSArray<Player *> *)players;


@end
