//
//  SKTableViewCell.m
//  ScoreKeeperTableView
//
//  Created by Julien Guanzon on 2/7/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "SKTableViewCell.h"
#import "ViewController.h"

#import "Players.h"
#import "PlayerController.h"


@interface SKTableViewCell () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *nameField;
@property (nonatomic, strong) UILabel *scoreTracker;
@property (nonatomic, strong) UIStepper *scoreStepper;
@property (nonatomic, strong) Players *player;


@end

@implementation SKTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    float top = 10;
    float labelHeight = 30;

    self.nameField = [[UITextField alloc] initWithFrame:CGRectMake(40, top, 125, labelHeight)];
//    self.nameField.backgroundColor = [UIColor redColor];
    self.nameField.placeholder = @"Name";
    self.nameField.delegate = self;
    [self.contentView addSubview:self.nameField];
    self.nameField.clearButtonMode = YES;

    
    self.scoreTracker = [UILabel new];
    self.scoreTracker.frame = CGRectMake(125 + 10, top, 75, labelHeight);
//    self.scoreTracker.text = @"0";
    self.scoreTracker.text = [NSString stringWithFormat:@"%d", (int)self.scoreStepper.value];
    self.scoreTracker.textAlignment = NSTextAlignmentCenter;
//    scoreCount.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.scoreTracker];
    
        self.scoreStepper = [[UIStepper alloc]initWithFrame:CGRectMake(125 + 75 + 10, top, 100, labelHeight)];
//    self.scoreStepper.backgroundColor = [UIColor orangeColor];
    self.scoreStepper.minimumValue = -100;
    self.scoreStepper.maximumValue = 100;
    [self.contentView addSubview:self.scoreStepper];
    [self.scoreStepper addTarget:self action:@selector(stepperAction:) forControlEvents:UIControlEventValueChanged];
    
    
    
//    UIButton *clearScore = [[UIButton alloc] initWithFrame:CGRectMake(310, top, 50, labelHeight)];
////    clearScore.backgroundColor = [UIColor grayColor];
//    [clearScore setTitle:@"clear" forState:UIControlStateNormal];
//    [clearScore setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [clearScore addTarget:self action:@selector(scoreClear:) forControlEvents:UIControlEventTouchUpInside];
//    [self.contentView addSubview:clearScore];
    
    
    
    
    UIButton *saveButton = [[UIButton alloc] initWithFrame:CGRectMake(320, 10, 50, 30)];
    saveButton.backgroundColor = [UIColor lightGrayColor];
    [saveButton setTitle:@"Save" forState:UIControlStateNormal];
    saveButton.showsTouchWhenHighlighted = YES;
    [saveButton addTarget:self action:@selector(saveAction) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:saveButton];
    
    
    return self;
}

- (void) saveAction {
    Players *player = [[Players alloc] initWithDictionary:@{nameKey:self.nameField, scoreKey:self.scoreTracker}];
    if (self.player) {
        [[PlayerController sharedInstance] replacePlayer:self.player withPlayer:player];
    } else {
        [[PlayerController sharedInstance] addPlayer:player];
    }
    
}



- (void)stepperAction:(UIStepper *)scoreStepper {
    int value = [scoreStepper value];
    int newValue = value * 1;
    self.scoreTracker.text = [NSString stringWithFormat:@"%d", newValue];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}


- (void)scoreClear:(UIButton *)clearScore {
    self.scoreTracker.text = @"0";
    self.scoreStepper.value = 0;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
