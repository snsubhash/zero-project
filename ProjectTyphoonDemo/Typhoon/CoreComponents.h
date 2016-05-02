//
//  CoreComponents.h
//  StarterProjectDemo
//
//  Created by Anish on 04/04/16.
//  Copyright © 2016 happiestminds. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import "VenueClient.h"
#import "VenueListDao.h"
#import "PersonClient.h"
#import "PersonListDao.h"
#import "realmTableDaoImpl.h"

@interface CoreComponents : TyphoonAssembly

- (id <VenueClient>)venueClient;

- (id<VenueListDao>)venueListDao;

- (id <PersonClient>)personClient;

- (id<PersonListDao>)personListDao;

- (id<realmTableDao>)realmTableDao;
@end
