//
//  realmTableModel.h
//  ProjectTyphoonDemo
//
//  Created by Subhash on 4/28/16.
//  Copyright © 2016 Happiestminds. All rights reserved.
//

#import <Realm/Realm.h>

@interface realmTableModel : RLMObject
@property NSString *title;
@property NSDate   *date;
@end
