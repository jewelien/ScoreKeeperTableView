//
//  SKTableViewDataSource.h
//  ScoreKeeperTableView
//
//  Created by Julien Guanzon on 2/7/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SKTableViewDataSource : NSObject <UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *numberOfRows;

-(void)registerTableView:(UITableView *)tableView;

-(NSIndexPath *)newRow:(UITableView *)tableView;


@end
