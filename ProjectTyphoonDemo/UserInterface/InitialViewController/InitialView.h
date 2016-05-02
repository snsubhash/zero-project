//
//  InitialView.h
//  StarterProjectDemo
//
//  Created by Anish on 05/04/16.
//  Copyright © 2016 happiestminds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApplicationAssembly.h"
#import "UIClient.h"

@interface InitialView : UIView

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong)ApplicationAssembly *assembly;
@property (nonatomic, weak)id <UIClient> uiClient;
@end
