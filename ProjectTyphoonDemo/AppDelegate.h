//
//  AppDelegate.h
//  ProjectTyphoonDemo
//
//  Created by Subhash on 4/22/16.
//  Copyright © 2016 Happiestminds. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;
@class ApplicationAssembly;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) RootViewController *rootViewController;
@property (strong, nonatomic) ApplicationAssembly *assembly;

@end

