//
//  ApplicationAssembly.m
//  StarterProjectDemo
//
//  Created by Anish on 04/04/16.
//  Copyright © 2016 happiestminds. All rights reserved.
//

#import "ApplicationAssembly.h"
#import "AppDelegate.h"
#import "RootViewController.h"
#import "VenueView.h"
#import "VenuesViewController.h"
#import "CoreComponents.h"
#import "PersonViewController.h"
#import "PersonView.h"
#import "RealmTableViewController.h"
#import "RealmTableView.h"

@implementation ApplicationAssembly

- (AppDelegate *)appDelegate
{
    
    return [TyphoonDefinition withClass:[AppDelegate class] configuration:^(TyphoonDefinition *definition)
            {
                [definition injectProperty:@selector(window) with:[self mainWindow]];
                [definition injectProperty:@selector(rootViewController) with:[self rootViewController]];
            }];
}

/**
 * Set up the main window. We don't really need to use DI for this, but it shows an example of injecting a struct.
 */
- (UIWindow *)mainWindow
{
    return [TyphoonDefinition withClass:[UIWindow class] configuration:^(TyphoonDefinition *definition)
            {
                [definition useInitializer:@selector(initWithFrame:) parameters:^(TyphoonMethod *initializer)
                 {
                     [initializer injectParameterWith:[NSValue valueWithCGRect:[[UIScreen mainScreen] bounds]]];
                 }];
                [definition injectProperty:@selector(rootViewController) with:[self rootViewController]];
            }];
    
}

//-------------------------------------------------------------------------------------------

- (RootViewController *)rootViewController
{
    return [TyphoonDefinition withClass:[RootViewController class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(initWithMainContentViewController:assembly:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:[self firstVc]];
            [initializer injectParameterWith:self];
        }];
        definition.scope = TyphoonScopeSingleton;
    }];
}

- (id)storyboard{
    return [TyphoonDefinition withClass:[TyphoonStoryboard class] configuration:^(TyphoonDefinition *definition) {
        [definition useInitializer:@selector(storyboardWithName:factory:bundle:) parameters:^(TyphoonMethod *initializer) {
            [initializer injectParameterWith:@"Main"];
            [initializer injectParameterWith:self];
            [initializer injectParameterWith:[NSBundle mainBundle]];
        }];
    }];
}

#pragma mark Initial View Controller

-(id)firstVc
{
    return [TyphoonDefinition withFactory:[self storyboard] selector:@selector(instantiateViewControllerWithIdentifier:) parameters:^(TyphoonMethod *factoryMethod) {
             [factoryMethod injectParameterWith:@"initalvc"];
    } configuration:^(TyphoonFactoryDefinition *definition) {
        [definition injectProperty:@selector(assembly) with:self];
    }];
}

#pragma mark Venues View Controller
- (VenuesViewController *)venueViewController{
    return [TyphoonDefinition withFactory:[self storyboard] selector:@selector(instantiateViewControllerWithIdentifier:) parameters:^(TyphoonMethod *factoryMethod) {
        [factoryMethod injectParameterWith:@"venuevc"];
    } configuration:^(TyphoonFactoryDefinition *definition) {
        [definition injectProperty:@selector(assembly) with:self];
        [definition injectMethod:@selector(loadView:client:assembly:) parameters:^(TyphoonMethod *method) {
            [method injectParameterWith:[self venueView]];
            [method injectParameterWith:[_coreComponents venueClient]];
            [method injectParameterWith:self];
        }];
    }];
}

- (VenueView *)venueView{
    return [TyphoonDefinition withClass:[VenueView class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(assembly) with:self];
    }];
}

// 27Apr2016 for Person
#pragma mark Person View Controller
- (PersonViewController *)personViewController{
    return [TyphoonDefinition withFactory:[self storyboard] selector:@selector(instantiateViewControllerWithIdentifier:) parameters:^(TyphoonMethod *factoryMethod) {
        [factoryMethod injectParameterWith:@"personvc"];
    } configuration:^(TyphoonFactoryDefinition *definition) {
        [definition injectProperty:@selector(assembly) with:self];
        [definition injectMethod:@selector(loadView:client:assembly:) parameters:^(TyphoonMethod *method) {
            [method injectParameterWith:[self personView]];
            [method injectParameterWith:[_coreComponents personClient]];
            [method injectParameterWith:self];
        }];
    }];
}

- (PersonView *)personView{
    return [TyphoonDefinition withClass:[PersonView class] configuration:^(TyphoonDefinition *definition) {
        [definition injectProperty:@selector(assembly) with:self];
    }];
}

//28Apr2016 for RealmTable
#pragma mark Realm Table View Controller
- (RealmTableViewController *)realmTableViewController
{
    return [TyphoonDefinition withFactory:[self storyboard] selector:@selector(instantiateViewControllerWithIdentifier:) parameters:^(TyphoonMethod *factoryMethod){
        [factoryMethod injectParameterWith:@"realmtablevc"];
    } configuration:^(TyphoonFactoryDefinition *definition) {
        [definition injectProperty:@selector(assembly) with:self];
        [definition injectMethod:@selector(loadView:Dao:assembly:) parameters:^(TyphoonMethod *method){
            [method injectParameterWith:[self realTableView]];
            [method injectParameterWith:[_coreComponents realmTableDao]];
            [method injectParameterWith:self];
        }];
    }];
}

-(RealmTableView *)realTableView{
    return [TyphoonDefinition withClass:[RealmTableView class] configuration:^(TyphoonDefinition *definition){
        [definition injectProperty:@selector(assembly) with:self];
    }];
}

@end
