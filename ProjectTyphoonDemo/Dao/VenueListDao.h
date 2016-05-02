//
//  VenueListDao.h
//  ProjectZeroDemo
//
//  Created by Anish Kumar D on 17/04/16.
//  Copyright © 2016 happiestminds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@protocol VenueListDao <NSObject>

- (RLMResults *)venueList:(NSDictionary *)list;

- (RLMResults *)getAllVenues;

- (void)clearAllVenues;

- (RLMObject *)getVenueForId:(NSString *)venueId;

@end
