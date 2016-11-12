//
//  Match.m
//  Ligue
//
//  Created by Stepan Paholyk on 11/12/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "Match.h"

@implementation Match

- (NSString*) description
{
    return [NSString stringWithFormat:@"%@ - %@", self.home, self.away];
}

@end
