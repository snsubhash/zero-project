//
//  DBClientBasicImpl.h
//  ProjectZeroDemo
//
//  Created by Anish on 15/04/16.
//  Copyright © 2016 happiestminds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VenueListDao.h"


@interface VenueClientBasicImpl : NSObject

@property(nonatomic, strong) NSString* serviceUrl;
@property (nonatomic,strong) id<VenueListDao> venueListDao;

- (void)injectClientId:(NSString *)clientId clientSecret:(NSString *)clientSecret;

@end
