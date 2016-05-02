//
//  DBViewController.h
//  ProjectZeroDemo
//
//  Created by Anish on 15/04/16.
//  Copyright © 2016 happiestminds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VenueClient.h"

@class ApplicationAssembly;


@interface VenuesViewController : UIViewController
@property (nonatomic, strong)ApplicationAssembly *assembly;

- (void)loadView:(UIView *)view client:(id<VenueClient>)client assembly:(ApplicationAssembly *)assembly;

@end
