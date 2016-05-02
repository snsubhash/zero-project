//
//  RealmTableView.h
//  ProjectTyphoonDemo
//
//  Created by Subhash on 4/28/16.
//  Copyright © 2016 Happiestminds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>
#import "realmTableModel.h"
#import "realmTableDaoImpl.h"

@class ApplicationAssembly;

@interface RealmTableView : UIView
@property (nonatomic, strong)ApplicationAssembly *assembly;
@property (nonatomic, weak)IBOutlet UITableView *realmTableView;

@property (nonatomic, strong) RLMResults *array;
@property (nonatomic, strong) RLMNotificationToken *notification;
@property (nonatomic, strong) realmTableDaoImpl *realmTbl;

- (void)addButton:(RLMResults *)realmDataArray;
- (void)backgroundAddOption;
@end
