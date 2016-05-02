//
//  PersonClientBasicImpl.m
//  ProjectTyphoonDemo
//
//  Created by Subhash on 4/27/16.
//  Copyright © 2016 Happiestminds. All rights reserved.
//

#import "PersonClientBasicImpl.h"

@interface PersonClientBasicImpl()
{
    NSMutableDictionary *params;
}
@end

@implementation PersonClientBasicImpl

- (void)injectClientId:(NSString *)clientId clientSecret:(NSString *)clientSecret{
    if (!params) {
        params = [NSMutableDictionary new];
        [params setValue:clientId forKey:@"client_id"];
        [params setValue:clientSecret forKey:@"client_secret"];
        [params setValue:@20140101 forKey:@"v"];
        [params setValue:@50 forKey:@"limit"];
    }
}

- (void)loadPersonData
{
    RLMRealm *personData = [_personListDao personList];
    NSLog(@"person data %@",personData);
}
@end
