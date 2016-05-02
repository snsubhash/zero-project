//
//  DBClientBasicImpl.m
//  ProjectZeroDemo
//
//  Created by Anish on 15/04/16.
//  Copyright © 2016 happiestminds. All rights reserved.
//

#import "VenueClientBasicImpl.h"
#import "VenueClient.h"
#import <AFNetworking/AFNetworking.h>


@interface VenueClientBasicImpl(){
    NSURLSession *session;
    NSMutableDictionary *params;
}
@end

@implementation VenueClientBasicImpl


- (void)injectClientId:(NSString *)clientId clientSecret:(NSString *)clientSecret{
    if (!params) {
        params = [NSMutableDictionary new];
        [params setValue:clientId forKey:@"client_id"];
        [params setValue:clientSecret forKey:@"client_secret"];
        [params setValue:@20140101 forKey:@"v"];
        [params setValue:@50 forKey:@"limit"];
    }
}

//NSData *apiResponse = [[NSData alloc] initWithContentsOfURL:
//[NSURL URLWithString:[NSString stringWithFormat:@"https://api.foursquare.com/v2/venues/search?near=San%@Francisco&client_id=%@&client_secret=%@&v=20140101&//limit=50", @"%20", clientID, clientSecret]]];


- (void)loadVenuesForLocation:(NSString *)location onSuccess:(VenueListReceivedBlock)successBlock
                    onError:(VenueReportErrorBlock)errorBlock{
    
    [params setValue:location forKey:@"near"];
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:self.serviceUrl parameters:params error:nil];
    
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            errorBlock(error);
        } else {
          // NSLog(@"%@ %@", response, responseObject);
            RLMResults *results = [_venueListDao venueList:responseObject];
            dispatch_async(dispatch_get_main_queue(), ^
            {
                 successBlock(results);
            });
        }
    }];
    [dataTask resume];
}



@end
