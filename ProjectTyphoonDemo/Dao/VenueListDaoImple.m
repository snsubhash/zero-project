//
//  VenueListDaoImple.m
//  ProjectZeroDemo
//
//  Created by Anish Kumar D on 17/04/16.
//  Copyright © 2016 happiestminds. All rights reserved.
//

#import "VenueListDaoImple.h"
#import <Realm/Realm.h>
#import "Venue.h"

@implementation VenueListDaoImple



- (RLMResults *)venueList:(NSDictionary *)venues{
    
     RLMRealm *defaultRealm = [RLMRealm defaultRealm];
    
    // Ensure we start with an empty database
    [[NSFileManager defaultManager] removeItemAtPath:defaultRealm.path error:nil];
    
    if (venues.allKeys.count <= 0) {
        return nil;
    }
    
    NSArray *venueList = venues[@"response"][@"venues"];
    // Open the default Realm file
    
    // Begin a write transaction to save to the default Realm
    [defaultRealm beginWriteTransaction];
    [defaultRealm deleteAllObjects];
    for (id venue in venueList) {
        // Store the foursquare venue name and id in a Realm Object
//        RLMResults *results = [Venue objectsInRealm:defaultRealm where:@"foursquareID == %@",venue[@"id"]];
//        if (results.count > 0) {
//            continue;
//        }
        Venue *newVenue = [[Venue alloc] init];
        newVenue.foursquareID = venue[@"id"];
        newVenue.name = venue[@"name"];
        
        VenueLocation *location = [[VenueLocation alloc]init];
        
        NSDictionary *venueLocation = venue[@"location"];
        location.latitude = [venueLocation[@"lat"]doubleValue];
        location.longitude = [venueLocation[@"lng"]doubleValue];
        location.postalCode = venueLocation[@"postalCode"];
        location.cc = venueLocation[@"cc"];
        location.state = venueLocation[@"state"];
        location.country = venueLocation[@"country"];
        
        newVenue.location = location;
        
        // Add the Venue object to the default Realm
        // (alternatively you could serialize the API response as an NSArray and call addObjectsFromArray)
        [defaultRealm addObject:newVenue];
    }
    
    // Persist all the Venues with a single commit
    [defaultRealm commitWriteTransaction];
    
    // Show all the venues that were persisted
    NSLog(@"Here are all the venues persisted to the default Realm: \n\n %@",
          [[Venue allObjects] description]);
    
    return [Venue allObjects];
}



- (RLMResults *)getAllVenues{
    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
    RLMResults *otherResults = [Venue objectsInRealm:defaultRealm withPredicate:nil];
    return otherResults;
}


- (void)clearAllVenues{
    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
    [defaultRealm deleteAllObjects];
}

- (RLMObject *)getVenueForId:(NSString *)venueId{
    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
    RLMResults *results = [Venue objectsInRealm:defaultRealm where:@"foursquareID == %@",venueId];
    if (results.count > 0) {
        return results.lastObject;
    }
    return nil;
}

@end
