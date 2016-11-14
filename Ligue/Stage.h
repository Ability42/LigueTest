//
//  Stage.h
//  Ligue
//
//  Created by Stepan Paholyk on 11/14/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "Match.h"

@interface Stage : Match

- (instancetype)initWithHomePlayer:(Player*)home andAwayPlayer:(Player*)away;

@end
