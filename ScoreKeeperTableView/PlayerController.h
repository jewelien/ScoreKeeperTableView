//
//  PlayerController.h
//  ScoreKeeperTableView
//
//  Created by Julien Guanzon on 2/13/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Players.h"

@interface PlayerController : NSObject

@property (nonatomic, strong) NSArray *players;

+(PlayerController *)sharedInstance;

//-(void) saveToDefaults;
//-(void) defaultsToArray;

@end
