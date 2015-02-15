//
//  PlayerController.m
//  ScoreKeeperTableView
//
//  Created by Julien Guanzon on 2/13/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "PlayerController.h"

static NSString *const playersKey = @"players";

@implementation PlayerController


+(PlayerController *)sharedInstance {
    __block PlayerController *sharedInstance = nil;
    static dispatch_once_t onceToken;
dispatch_once(&onceToken, ^{
    sharedInstance = [[PlayerController alloc] init];
    [sharedInstance defaultsToArray];
});
    return sharedInstance;
}

-(void)addPlayer:(Players *)player {
    NSMutableArray *mutableArray = [[NSMutableArray alloc] initWithArray:self.players];
    [mutableArray addObject:player];
    self.players = mutableArray;
    [self saveToDefaults];
}

-(void)replacePlayer:(NSDictionary *)oldPlayer withPlayer:(NSDictionary *)newPlayer {
    if (!oldPlayer || !newPlayer) {
        return;
    }
    NSMutableArray *mutableArray = self.players.mutableCopy;
    if ([mutableArray containsObject:oldPlayer]) {
        NSInteger oldPlayerIndex = [mutableArray indexOfObject:oldPlayer];
        [mutableArray replaceObjectAtIndex:oldPlayerIndex withObject:newPlayer];
    }
    self.players = mutableArray;
    [self saveToDefaults];
    
}



-(void) saveToDefaults {
    NSMutableArray *playersDictionaries = [NSMutableArray new];
    for (Players *player in playersDictionaries) {
        [playersDictionaries addObject:[player playersDictionary]];  ///need to add method in players in which we set each key to a property.
    }
    [[NSUserDefaults standardUserDefaults] setObject:playersDictionaries forKey:(playersKey)];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void) defaultsToArray{
    NSArray *playersDictionary = [[NSUserDefaults standardUserDefaults] objectForKey:playersKey];
    NSMutableArray *players = [NSMutableArray new];
    for (NSDictionary *player in playersDictionary ) {
        [players addObject:[[Players alloc] initWithDictionary:player]];
    }
    self.players = playersDictionary;
}

@end
