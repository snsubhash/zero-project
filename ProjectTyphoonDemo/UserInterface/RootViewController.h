//
//  RootViewController.h
//  StarterProjectDemo
//
//  Created by Anish on 04/04/16.
//  Copyright © 2016 happiestminds. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ApplicationAssembly;
@class VenuesViewController;
@class PersonViewController;
@class RealmTableViewController;

@interface RootViewController : UINavigationController{
    ApplicationAssembly *_assembly;
    
}

//@property (nonatomic,strong)UINavigationController *navigator;

- (instancetype)initWithMainContentViewController:(UIViewController *)mainContentViewController assembly:(ApplicationAssembly *)assembly;


- (void)loadViewController:(UIViewController *)controller;

- (void)showDatabaseViewController:(VenuesViewController *)vc;

- (void)showPersonViewController:(PersonViewController *)vc;

- (void)showRealmTableViewController:(RealmTableViewController *)vc;

@end
