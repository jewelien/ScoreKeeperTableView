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
    [self.tableView registerClass:[SKTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.scrollView addSubview:self.tableView];
    
    self.scrollView.contentSize = CGSizeMake(self.tableView.frame.size.width, self.tableView.frame.size.height);
    
}






- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
