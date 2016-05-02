//
//  RootViewController.m
//  StarterProjectDemo
//
//  Created by Anish on 04/04/16.
//  Copyright © 2016 happiestminds. All rights reserved.
//

#import "RootViewController.h"
#import "ApplicationAssembly.h"
#import "VenuesViewController.h"
#import "PersonViewController.h"
#import "RealmTableViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController


- (instancetype)initWithMainContentViewController:(UIViewController *)mainContentViewController assembly:(ApplicationAssembly *)assembly{
    self = [super initWithNibName:nil bundle:nil];
    if (self)
    {
        _assembly = assembly;
        
        if (mainContentViewController) {
            [self makeNavigationControllerWithRoot:mainContentViewController];
        }
    }
    return self;
}

- (id)init
{
    return [self initWithMainContentViewController:nil assembly:nil];
}

- (void)loadViewController:(UIViewController *)controller{
    [self pushViewController:controller animated:YES];
}

- (void)showDatabaseViewController:(VenuesViewController *)vc{
    [self pushViewController:vc animated:YES];
}

- (void)showPersonViewController:(PersonViewController *)vc{
    [self pushViewController:vc animated:YES];
}

//28Apr2016
- (void)showRealmTableViewController:(RealmTableViewController *)vc{
    [self pushViewController:vc animated:YES];
}

//-------------------------------------------------------------------------------------------
#pragma mark - Private Methods
//-------------------------------------------------------------------------------------------

- (void)makeNavigationControllerWithRoot:(UIViewController *)root
{
    [self pushViewController:root animated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
