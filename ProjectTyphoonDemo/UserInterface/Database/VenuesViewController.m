//
//  DBViewController.m
//  ProjectZeroDemo
//
//  Created by Anish on 15/04/16.
//  Copyright © 2016 happiestminds. All rights reserved.
//

#import "VenuesViewController.h"
#import "ApplicationAssembly.h"
#import "VenueView.h"
#import <Realm/Realm.h>

@interface VenuesViewController () <VenueUIClient> {
    id <VenueClient> _dbClient;
    NSString *placeName;
    VenueView *venueView;
}

@end

@implementation VenuesViewController



- (void)loadView:(UIView *)view client:(id<VenueClient>)client assembly:(ApplicationAssembly *)assembly
{
        _dbClient = client;
        _assembly = assembly;
        self.title = @"Realm";
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self refreshData];
//    self.navigationController.navigationBarHidden = true;
    venueView = (VenueView *) self.view;
    [venueView setVenueUIClient:self];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//-------------------------------------------------------------------------------------------
#pragma mark - Private Methods
//-------------------------------------------------------------------------------------------
- (void)getAllVenuesForLocation:(NSString *)location{
    
    [_dbClient loadVenuesForLocation:location onSuccess:^(RLMResults *venues) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [venueView setVenueList:venues];
        });
        
    } onError:^(NSError *error) {
        NSLog(@"Error %@",error);
        
    }];
}

- (void)refreshData
{
   
}

@end
