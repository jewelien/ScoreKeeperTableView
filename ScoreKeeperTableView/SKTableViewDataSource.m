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

-(void)registerTableView:(UITableView *)tableView {
    [tableView registerClass:[SKTableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numberOfRows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectedIndex = indexPath;
    return cell;
}

-(NSIndexPath *)newRow:(UITableView *)tableView {
    SKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    [self.numberOfRows addObject:cell];
    NSInteger insertRow = [self.numberOfRows indexOfObject:cell];
    NSIndexPath *indexPath  = [NSIndexPath indexPathForRow:insertRow inSection:0];
    return indexPath;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        SKTableViewCell *cell = self.numberOfRows[indexPath.row];
        [self.numberOfRows removeObject:cell];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }

}



@end
