//
//  VenueView.m
//  ProjectZeroDemo
//
//  Created by Anish on 15/04/16.
//  Copyright © 2016 happiestminds. All rights reserved.
//

#import "VenueView.h"
#import "Venue.h"


@interface VenueView () <UISearchBarDelegate>{
    RLMResults *_venueList;
    NSString *locationName;
    UIActivityIndicatorView *_activityIndicator;
}

@end

@implementation VenueView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

- (void)setVenueList:(RLMResults *)venues{
    dispatch_async(dispatch_get_main_queue(), ^{
        [self hideActivityIndicator];
        _venueList = venues;
        [self.venueTableView reloadData];
    });
}



- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    if (searchBar.text.length > 0) {
        [searchBar resignFirstResponder];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self showActivityIndicator];
        });
        [self.venueUIClient getAllVenuesForLocation:searchBar.text];
    }
}

- (void)showActivityIndicator{
    if (!_activityIndicator) {
        _activityIndicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _activityIndicator.frame = CGRectMake(self.venueTableView.frame.size.width/2, self.venueTableView.frame.size.height/2, 24, 24);
        [self.venueTableView addSubview:_activityIndicator];
    }
    [_activityIndicator startAnimating];

}

- (void)hideActivityIndicator{
    if (_activityIndicator) {
        [_activityIndicator stopAnimating];
        [_activityIndicator removeFromSuperview];
        _activityIndicator = nil;
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _venueList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    Venue *venue;
    if ([_venueList count] > indexPath.row)
    {
        venue = [_venueList objectAtIndex:indexPath.row];
    }

    static NSString *reuseIdentifier = @"venuecell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    
    cell.textLabel.text = venue.name;
    
    
    return cell;
}


@end
