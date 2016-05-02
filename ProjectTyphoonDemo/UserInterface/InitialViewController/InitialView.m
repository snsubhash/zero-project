//
//  InitialView.m
//  StarterProjectDemo
//
//  Created by Anish on 05/04/16.
//  Copyright © 2016 happiestminds. All rights reserved.
//

#import "InitialView.h"
#import "CVCell.h"
#import "RootViewController.h"
#import "UIClient.h"

typedef NS_ENUM(NSInteger, ScreenName){
     DatabaseScreen,
     //RealmScreen,
     RealmTableScreen//28Apr2016
};

@interface InitialView() <UICollectionViewDelegateFlowLayout,UICollectionViewDataSource, UIClient>{
    NSArray *titleArray;
}

@end

@implementation InitialView
@synthesize assembly;

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        [self addSubview:self.collectionView];
        
        titleArray = [[NSArray alloc]initWithObjects:@"Database",@"RealmTable", nil];//@"Realm",//28Apr2016 Added RealmTable
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self setupConstraints];
}


- (void)setupConstraints{
    NSDictionary *views = @{@"view":self.collectionView};
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:kNilOptions metrics:nil views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:kNilOptions metrics:nil views:views]];
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return titleArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CVCell *cell = (CVCell *)[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CVCell class]) forIndexPath:indexPath];
   
    cell.titleLabel.text = titleArray[indexPath.row];
    
    return cell;
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case DatabaseScreen:
            [_uiClient loadViewController:(UIViewController *)[self.assembly venueViewController]];
            break;
//        case RealmScreen:// 27Apr2016 for Person
//            [_uiClient loadViewController:(UIViewController *)[self.assembly personViewController]];
//            break;
        case RealmTableScreen:// 28Apr2016 Realm Table
            [_uiClient loadViewController:(UIViewController *)[self.assembly realmTableViewController]];
            break;
        default:
            break;
    }
}

#pragma mark FlowLayout Delegate Methods

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    float cellWidth = screenWidth / 2; //Replace the divisor with the column count requirement. Make sure to have it in float.
    CGSize size = CGSizeMake(cellWidth, cellWidth);
    
    return size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0.0f;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0.0f;
}


-(UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        [layout setMinimumInteritemSpacing:10];
//        [layout setMinimumInteritemSpacing:10];
//        [layout setItemSize:CGSizeMake(100, 100)];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [_collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_collectionView registerClass:[CVCell class] forCellWithReuseIdentifier:NSStringFromClass([CVCell class])];
        [_collectionView setBackgroundColor:[UIColor whiteColor]];
        [_collectionView setDataSource:self];
        [_collectionView setDelegate:self];
    }
    return _collectionView;
}



@end
