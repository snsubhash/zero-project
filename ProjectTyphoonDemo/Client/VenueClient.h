//
//  DBClient.h
//  ProjectZeroDemo
//
//  Created by Anish on 15/04/16.
//  Copyright © 2016 happiestminds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>
/**
 * Block protocol for handling asynchronous responses from VenueClient
 */

typedef void(^VenueListReceivedBlock)(RLMResults* venues);

typedef void(^VenueReportErrorBlock)(NSError* error);

/* ====================================================================================================================================== */

/**
 * Protocol specifying the retrieval of News.
 */
@protocol VenueClient <NSObject>

- (void)loadVenuesForLocation:(NSString *)location onSuccess:(VenueListReceivedBlock)successBlock
                  onError:(VenueReportErrorBlock)errorBlock;

@end