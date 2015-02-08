//
//  SKTableViewDataSource.m
//  ScoreKeeperTableView
//
//  Created by Julien Guanzon on 2/7/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "SKTableViewDataSource.h"
#import "SKTableViewCell.h"
#import "ViewController.h"

@implementation SKTableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectedIndex = indexPath;
    return cell;
}

@end
