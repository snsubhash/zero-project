//
//  CoreComponents.m
//  StarterProjectDemo
//
//  Created by Anish on 04/04/16.
//  Copyright © 2016 happiestminds. All rights reserved.
//

#import "CoreComponents.h"
#import "VenueClientBasicImpl.h"
#import "VenueListDaoImple.h"
#import "PersonClientBasicImpl.h"
#import "PersonListDaoImple.h"


@implementation CoreComponents

- (id <VenueClient>)venueClient{
    return [TyphoonDefinition withClass:[VenueClientBasicImpl class] configuration:^(TyphoonDefinition *definition)
            {
                [definition injectProperty:@selector(serviceUrl) with:TyphoonConfig(@"foursquare.url")];
                [definition injectProperty:@selector(venueListDao) with:[self venueListDao]];
                [definition injectMethod:@selector(injectClientId:clientSecret:) parameters:^(TyphoonMethod *method) {
                    [method injectParameterWith:TyphoonConfig(@"foursquare_client_id")];
                    [method injectParameterWith:TyphoonConfig(@"foursquare_client_secret")];
                }];
            }];
}

- (id<VenueListDao>)venueListDao{
    return [TyphoonDefinition withClass:[VenueListDaoImple class] configuration:^(TyphoonDefinition *definition){
        
    }];
}

- (id <PersonClient>)personClient{
    return [TyphoonDefinition withClass:[PersonClientBasicImpl class] configuration:^(TyphoonDefinition *definition)
            {
                [definition injectProperty:@selector(serviceUrl) with:TyphoonConfig(@"foursquare.url")];
                [definition injectProperty:@selector(personListDao) with:[self personListDao]];
                [definition injectMethod:@selector(injectClientId:clientSecret:) parameters:^(TyphoonMethod *method) {
                    [method injectParameterWith:TyphoonConfig(@"foursquare_client_id")];
                    [method injectParameterWith:TyphoonConfig(@"foursquare_client_secret")];
                }];
            }];
}

- (id<PersonListDao>)personListDao{
    return [TyphoonDefinition withClass:[PersonListDaoImple class] configuration:^(TyphoonDefinition *definition){
        
    }];
}

- (id<realmTableDao>)realmTableDao
{
    return [TyphoonDefinition withClass:[realmTableDaoImpl class]];
}

#pragma mark - For Unit Testing Purpose

- (id)config
{
    return [TyphoonDefinition withConfigName:@"Configuration.plist"];
}

@end
