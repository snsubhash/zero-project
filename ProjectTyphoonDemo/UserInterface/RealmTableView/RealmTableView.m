//
//  RealmTableView.m
//  ProjectTyphoonDemo
//
//  Created by Subhash on 4/28/16.
//  Copyright © 2016 Happiestminds. All rights reserved.
//

#import "RealmTableView.h"


// Realm model object
@interface DemoObject : RLMObject
@property NSString *title;
@property NSDate   *date;
@end

@implementation DemoObject
// None needed
@end

static NSString * const kCellID    = @"cell";
static NSString * const kTableName = @"table";

@implementation RealmTableView
//@synthesize DemoObject;

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSFileManager defaultManager] removeItemAtURL:[RLMRealmConfiguration defaultConfiguration].fileURL error:nil];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:kCellID];
    }
    
//    DemoObject *object = self.array[indexPath.row];
//    cell.textLabel.text = object.title;
//    cell.detailTextLabel.text = object.date.description;

    DemoObject *object = self.array[indexPath.row];
    cell.textLabel.text = object.title;
    cell.detailTextLabel.text = object.date.description;
    
    return cell;
}

- (void)addButton:(RLMResults *)realmDataArray
{
    /*RLMRealm *realm = RLMRealm.defaultRealm;
    [realm beginWriteTransaction];
    [DemoObject createInRealm:realm withValue:@[[self randomString], [self randomDate]]];
    [realm commitWriteTransaction];
    
    RLMResults *results = [DemoObject allObjectsInRealm:realm];
    self.array = results;
     */
    
    self.array = realmDataArray;
    [self.realmTableView reloadData];
}

- (void)backgroundAddOption
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    // Import many items in a background thread
    dispatch_async(queue, ^{
        // Get new realm and table since we are in a new thread
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        for (NSInteger index = 0; index < 5; index++) {
            // Add row via dictionary. Order is ignored.
            [DemoObject createInRealm:realm withValue:@{@"title": [self randomString],
                                                        @"date": [self randomDate]}];
        }
        [realm commitWriteTransaction];
    });
}

#pragma - Helpers

- (NSString *)randomString
{
    return [NSString stringWithFormat:@"Title %d", arc4random()];
}

- (NSDate *)randomDate
{
    return [NSDate dateWithTimeIntervalSince1970:arc4random()];
}

@end
