//
//  Venue.h
//  ProjectZeroDemo
//
//  Created by Anish on 15/04/16.
//  Copyright © 2016 happiestminds. All rights reserved.
//

#import <Realm/Realm.h>
#import "VenueLocation.h"

@interface Venue : RLMObject
@property NSString * foursquareID;
@property NSString * name;
@property VenueLocation  *location;//(nonatomic,readwrite,strong) VenueLocation *location;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Venue>
RLM_ARRAY_TYPE(Venue)
