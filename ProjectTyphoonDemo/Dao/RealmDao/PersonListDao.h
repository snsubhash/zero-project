//
//  PersonListDao.h
//  ProjectTyphoonDemo
//
//  Created by Subhash on 4/27/16.
//  Copyright © 2016 Happiestminds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@protocol PersonListDao <NSObject>

- (RLMRealm *)personList;

@end
