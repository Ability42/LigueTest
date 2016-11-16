//
//  GroupStage.h
//  Ligue
//
//  Created by Stepan Paholyk on 11/16/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Group.h"
#import "Match.h"

@interface GroupStage : NSObject


@property (nonatomic) NSArray<Player*>* players;
@property (nonatomic) NSArray<Group*>* groups;


- (instancetype)initWithPlayers:(NSArray<Player*>*)players;

- (NSArray<Match*>*) getMatchesForGroup:(Group*)group;
- (NSArray<Group*>*) createGroupsWithPlayers:(NSArray<Player*>*)players;

@end
