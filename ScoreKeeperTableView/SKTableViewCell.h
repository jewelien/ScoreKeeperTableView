//
//  SKTableViewCell.h
//  ScoreKeeperTableView
//
//  Created by Julien Guanzon on 2/7/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SKTableViewCell : UITableViewCell

@property (nonatomic, strong) UITextField *nameField;
@property (nonatomic, strong) UILabel *scoreTracker;
@property (nonatomic, strong) UIStepper *scoreStepper;

@property (nonatomic, strong) NSIndexPath *selectedIndex;

@end
