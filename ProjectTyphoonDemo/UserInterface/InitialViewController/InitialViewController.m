//
//  InitialViewController.m
//  StarterProjectDemo
//
//  Created by Anish on 05/04/16.
//  Copyright © 2016 happiestminds. All rights reserved.
//

#import "InitialViewController.h"
#import "VenuesViewController.h"
#import "PersonViewController.h"
#import "RealmTableViewController.h"

@interface InitialViewController () <UIClient>

@end

@implementation InitialViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    InitialView *initView = (InitialView *)self.view;
    initView.uiClient = self;
    [initView setAssembly:_assembly];
}

- (void)loadViewController:(UIViewController *)controller{
    
    RootViewController *rootViewController = [_assembly rootViewController];
    
    if([controller isKindOfClass:[VenuesViewController class]]){
        [rootViewController showDatabaseViewController:(VenuesViewController *)controller];
    }
    
    // 27Apr2016 for Person
    if ([controller isKindOfClass:[PersonViewController class]]) {
        [rootViewController showPersonViewController:(PersonViewController *)controller];
    }
    
    // 28Apr2016 for RealmTable
    if ([controller isKindOfClass:[RealmTableViewController class]]) {
        [rootViewController showRealmTableViewController:(RealmTableViewController *)controller];
    }
}

@end
