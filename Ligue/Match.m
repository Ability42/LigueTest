//
//  Match.m
//  Ligue
//
//  Created by Stepan Paholyk on 11/12/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "Match.h"

@implementation Match

- (void) resetScoreToZero {
    self.homeGoals = 0;
    self.awayGoals = 0;
}

- (instancetype)initWithHomePlayer:(Player*)home andAwayPlayer:(Player*)away
{
    self = [super init];
    if (self) {
        self.home = home;
        self.away = away;
        self.homeGoals = -1;
        self.awayGoals = -1;
    }
    return self;
}

- (NSString*)description
{
    if (self.homeGoals == -1 && self.awayGoals == -1) {
        
        return [NSString stringWithFormat:@"%@ not played yet:not played yet %@", self.home, self.away];
        
    } else {
    
        return [NSString stringWithFormat:@"%@ %lu:%lu %@", self.home, (unsigned long)self.homeGoals, (unsigned long)self.awayGoals,self.away];
    }
}

@end
