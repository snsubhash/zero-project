//
//  DogModel.h
//  ProjectTyphoonDemo
//
//  Created by Subhash on 4/26/16.
//  Copyright © 2016 Happiestminds. All rights reserved.
//

#import <Realm/Realm.h>
#import "PersonModel.h"

@interface DogModel : RLMObject

@property NSString *name;
@property NSInteger age;
//@property PersonModel *owner;

@end

//RLM_ARRAY_TYPE(DogModel)
