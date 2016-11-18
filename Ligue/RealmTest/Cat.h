//
//  Cat.h
//  Ligue
//
//  Created by Stepan Paholyk on 11/18/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import <Realm/Realm.h>

@interface Cat : RLMObject
<# Add properties here to define the model #>
@end

// This protocol enables typed collections. i.e.:
// RLMArray<Cat>
RLM_ARRAY_TYPE(Cat)
