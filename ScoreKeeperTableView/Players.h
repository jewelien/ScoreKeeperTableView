//
//  Players.h
//  ScoreKeeperTableView
//
//  Created by Julien Guanzon on 2/13/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *nameKey = @"name";
static NSString *scoreKey = @"score";


@interface Players : NSObject


@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) NSString *score;

- (id)initWithDictionary:(NSDictionary *)dictionary;
- (NSDictionary *)playersDictionary;

@end
