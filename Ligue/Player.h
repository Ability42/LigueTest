//
//  Player.h
//  Ligue
//
//  Created by Stepan Paholyk on 11/12/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Club.h"

@interface Player : NSObject

@property (nonatomic) NSString* name;
@property (nonatomic) Club* club;

- (void) calculateTestSheldueForPlayers:(NSArray*)players;

@end
