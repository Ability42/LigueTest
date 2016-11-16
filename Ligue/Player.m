//
//  Player.m
//  Ligue
//
//  Created by Stepan Paholyk on 11/12/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "Player.h"

@interface Player ()


@end

@implementation Player

#pragma mark - Initialization

- (instancetype)initWithName:(NSString*)name andClub:(Club*)club
{
    self = [super init];
    if (self) {
        self.name = name;
        self.club = club;
    }
    return self;
}


#pragma mark - Lazy Init

- (NSString*) description {
    return [NSString stringWithFormat:@"%@(%@)", self.name, self.club.title];
}


@end
