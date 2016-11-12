//
//  Match.h
//  Ligue
//
//  Created by Stepan Paholyk on 11/12/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface Match : NSObject

@property (nonatomic, getter=isHome) Player *home;
@property (nonatomic, getter=isAway) Player *away; // "away" is the same like "guest", but syntactically correct
@property (assign, nonatomic) NSUInteger homeGoals;
@property (assign, nonatomic) NSUInteger awayGoals;

@property (nonatomic) NSDate *date;

@end
