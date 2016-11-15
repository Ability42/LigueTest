//
//  Penalty.m
//  Ligue
//
//  Created by Stepan Paholyk on 11/15/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "Penalty.h"

@implementation Penalty

- (instancetype)initWithFirstPlayer:(Player *)first andSecondPlayer:(Player *)second
{
    self = [super init];
    if (self) {
        self.first = first;
        self.second = second;
    }
    return self;
}


- (Player*) resultWithFirstPlayer:(Player *)first andSecondPlayer:(Player *)second{
    
    Player *winner = nil;
    
    if (self.firstTeamHit != self.secondTeamHit) {
        if (self.firstTeamHit < self.secondTeamHit) {
            winner = second;
        } else if (self.firstTeamHit > self.secondTeamHit) {
            winner = first;
        }
    } else {
        NSLog(@"Penalty must ended with winner!");
    }
    return winner;
}
@end
