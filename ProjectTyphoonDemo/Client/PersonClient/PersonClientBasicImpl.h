//
//  PersonClientBasicImpl.h
//  ProjectTyphoonDemo
//
//  Created by Subhash on 4/27/16.
//  Copyright © 2016 Happiestminds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonListDao.h"

@interface PersonClientBasicImpl : NSObject
@property(nonatomic, strong) NSString* serviceUrl;
@property (nonatomic,strong) id<PersonListDao> personListDao;

- (void)injectClientId:(NSString *)clientId clientSecret:(NSString *)clientSecret;
@end
