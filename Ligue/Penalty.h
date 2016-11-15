//
//  Penalty.h
//  Ligue
//
//  Created by Stepan Paholyk on 11/15/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "Match.h"

@interface Penalty : Match

@property (nonatomic) BOOL firstTeamHit;
@property (nonatomic) BOOL secondTeamHit;
@property (nonatomic) Player* first;
@property (nonatomic) Player* second;


- (instancetype)initWithFirstPlayer:(Player *)first andSecondPlayer:(Player *)second;
- (Player*) resultWithFirstPlayer:(Player *)first andSecondPlayer:(Player *)second;

@end
