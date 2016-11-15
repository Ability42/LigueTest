//
//  Group.m
//  Ligue
//
//  Created by Stepan Paholyk on 11/15/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "Group.h"

@implementation Group

- (instancetype)initWithName:(NSString*)name andPlayers:(NSArray<Player*>*)players
{
    self = [super init];
    if (self) {
        self.name = name;
        self.players = players;
    }
    return self;
}

@end
