//
//  ViewController.m
//  ScoreKeeperTableView
//
//  Created by Julien Guanzon on 2/7/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "ViewController.h"
#import "SKTableViewDataSource.h"
#import "SKTableViewCell.h"


#import "Players.h"
#import "PlayerController.h"

@interface ViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) SKTableViewDataSource *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollView];
    
    self.title = @"Score Keeper";
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.dataSource = [SKTableViewDataSource new];
    self.tableView.dataSource = self.dataSource;
    [self.dataSource registerTableView:self.tableView];
    
    [self.scrollView addSubview:self.tableView];
    self.scrollView.contentSize = CGSizeMake(self.tableView.frame.size.width, self.tableView.frame.size.height);

    self.dataSource.numberOfRows = [[NSMutableArray alloc] init];
    
    UIBarButtonItem *addPlayer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addPlayer)];
    self.navigationItem.rightBarButtonItem = addPlayer;
    
//    UIButton *saveButton = [[UIButton alloc] initWithFrame:CGRectMake(170, 65, 50, 30)];
//    saveButton.backgroundColor = [UIColor lightGrayColor];
//    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
//        [saveButton addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:saveButton];

}


- (void)addPlayer {
    NSIndexPath *indexPath = [self.dataSource newRow:self.tableView];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end




