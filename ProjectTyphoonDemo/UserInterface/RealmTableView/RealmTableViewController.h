//
//  RealmTableViewController.h
//  ProjectTyphoonDemo
//
//  Created by Subhash on 4/28/16.
//  Copyright © 2016 Happiestminds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "realmTableDaoImpl.h"

@class ApplicationAssembly;

@interface RealmTableViewController : UIViewController
@property (nonatomic,strong) ApplicationAssembly *assembly;
@property (nonatomic,strong) id <realmTableDao> realmDao;

-(void)loadView:(UIView *)view Dao:(id<realmTableDao>)Dao assembly:(ApplicationAssembly *)assembly;
@end
