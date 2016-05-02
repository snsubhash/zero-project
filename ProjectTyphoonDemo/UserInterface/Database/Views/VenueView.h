//
//  VenueView.h
//  ProjectZeroDemo
//
//  Created by Anish on 15/04/16.
//  Copyright © 2016 happiestminds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIClient.h"
#import <Realm/Realm.h>

@class ApplicationAssembly;

@protocol VenueUIClient <NSObject>

- (void)getAllVenuesForLocation:(NSString *)location;

@end


@interface VenueView : UIView {
    
}
@property (nonatomic, weak)IBOutlet UISearchBar *_searchBar;
@property (nonatomic, weak)IBOutlet UITableView *venueTableView;
@property (nonatomic, strong)ApplicationAssembly *assembly;
@property (nonatomic, weak)id <UIClient> uiClient;
@property (nonatomic, weak)id <VenueUIClient> venueUIClient;

- (void)setVenueList:(RLMResults *)venues;

@end
