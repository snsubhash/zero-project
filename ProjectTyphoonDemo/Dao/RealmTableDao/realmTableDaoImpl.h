//
//  realmTableDaoImpl.h
//  ProjectTyphoonDemo
//
//  Created by Subhash on 4/28/16.
//  Copyright © 2016 Happiestminds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@protocol realmTableDao <NSObject>

-(RLMResults *)getRLMResult;

@end
@interface realmTableDaoImpl : NSObject

@end
