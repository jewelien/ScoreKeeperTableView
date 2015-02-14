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
    
});
    return sharedInstance;
}

//
//-(void) saveToDefaults {
//    NSMutableArray *playersDictionary = [NSMutableArray new];
//    for (Players *player in playersDictionary) {
//        [playersDictionary addObject:player];  ///need to add method in players in which we set each key to a property. 
//    }
//    [[NSUserDefaults standardUserDefaults] setObject:playersDictionary forKey:(playersKey)];
//    
//}
//
//-(void) defaultsToArray{
//    NSArray *playersDictionary = [[NSUserDefaults standardUserDefaults] objectForKey:playersKey];
//    NSMutableArray *players = [NSMutableArray new];
//    for (NSDictionary ) {
//        
//    }
//    
//}

@end
