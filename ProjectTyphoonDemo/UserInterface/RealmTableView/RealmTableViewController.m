//
//  RealmTableViewController.m
//  ProjectTyphoonDemo
//
//  Created by Subhash on 4/28/16.
//  Copyright © 2016 Happiestminds. All rights reserved.
//

#import "RealmTableViewController.h"
#import "RealmTableView.h"


@interface RealmTableViewController ()
@property (nonatomic,strong)RealmTableView *realmtableView;
@end

@implementation RealmTableViewController

-(void)loadView:(UIView *)view Dao:(id<realmTableDao>)Dao assembly:(ApplicationAssembly *)assembly
{
    _assembly = assembly;
    _realmDao = Dao;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _realmtableView = (RealmTableView *)self.view;
    
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupUI
{
    self.title = @"TableViewExample";
//    self.navigationItem.leftBarButtonItem =
//    [[UIBarButtonItem alloc] initWithTitle:@"BG Add"
//                                     style:UIBarButtonItemStylePlain
//                                    target:self
//                                    action:@selector(backgroundAdd)];
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                  target:self
                                                  action:@selector(add)];
}

-(void)add
{
    RLMResults *array = [_realmDao getRLMResult];
    [_realmtableView addButton:array];
}

-(void)backgroundAdd
{
    [_realmtableView backgroundAddOption];
}
@end
