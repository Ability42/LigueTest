//
//  Group.h
//  Ligue
//
//  Created by Stepan Paholyk on 11/15/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"


@interface Group : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic) NSArray<Player*>* players;
@property (nonatomic, getter=isAllMatchesPlayed) BOOL allMatchesPlayed;


- (instancetype)initWithName:(NSString*)name andPlayers:(NSArray<Player*>*)players;


@end
