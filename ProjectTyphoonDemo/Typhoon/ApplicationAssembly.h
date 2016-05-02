//
//  ApplicationAssembly.h
//  StarterProjectDemo
//
//  Created by Anish on 04/04/16.
//  Copyright © 2016 happiestminds. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import "TyphoonAssembly.h"
#import "RootViewController.h"

@class AppDelegate;
@class CoreComponents;
@class VenuesViewController;
@class PersonViewController;

@interface ApplicationAssembly : TyphoonAssembly

@property(nonatomic, strong, readonly) CoreComponents *coreComponents;

- (AppDelegate *)appDelegate;

- (RootViewController *)rootViewController;

- (VenuesViewController *)venueViewController;

- (PersonViewController *)personViewController;

- (RealmTableViewController *)realmTableViewController;

@end
