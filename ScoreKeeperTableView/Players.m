//
//  Players.m
//  ScoreKeeperTableView
//
//  Created by Julien Guanzon on 2/13/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "Players.h"

@implementation Players


- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    self.name = dictionary[nameKey];
    self.score = dictionary[scoreKey];
    return self;
}

- (NSDictionary *)playersDictionary {
    NSMutableDictionary *playersDictionary = [NSMutableDictionary new];
    playersDictionary[nameKey] = self.name;
    [playersDictionary setObject:self.score forKey:scoreKey];
    return playersDictionary;
}




@end
