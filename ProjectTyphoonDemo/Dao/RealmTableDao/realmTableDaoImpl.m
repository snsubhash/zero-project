//
//  realmTableDaoImpl.m
//  ProjectTyphoonDemo
//
//  Created by Subhash on 4/28/16.
//  Copyright © 2016 Happiestminds. All rights reserved.
//

#import "realmTableDaoImpl.h"
#import "realmTableModel.h"

@implementation realmTableDaoImpl

-(RLMResults *)getRLMResult
{
    RLMRealm *realm = RLMRealm.defaultRealm;
    [realm beginWriteTransaction];
    [realmTableModel createInRealm:realm withValue:@[[self randomString],[self randomDate]]];
    [realm commitWriteTransaction];
    
    RLMResults *result = [realmTableModel allObjects];
    return result;
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
