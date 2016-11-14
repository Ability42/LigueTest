//
//  Stage.m
//  Ligue
//
//  Created by Stepan Paholyk on 11/14/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "Stage.h"

@implementation Stage

- (instancetype)initWithHomePlayer:(Player*)home andAwayPlayer:(Player*)away
{
    self = [super init];
    if (self) {
        self.home = home;
        self.away = away;
    }
    return self;
}

- (NSString*)description
{
    return [NSString stringWithFormat:@"%@ %lu:%lu %@", self.home, (unsigned long)self.homeGoals, (unsigned long)self.awayGoals,self.away];
}
@end
