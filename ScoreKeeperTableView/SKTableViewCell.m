//
//  SKTableViewCell.m
//  ScoreKeeperTableView
//
//  Created by Julien Guanzon on 2/7/15.
//  Copyright (c) 2015 Julien Guanzon. All rights reserved.
//

#import "SKTableViewCell.h"
#import "ViewController.h"

@interface SKTableViewCell () <UITextFieldDelegate>

@property (nonatomic, strong) UILabel *scoreTracker;
@property (nonatomic, strong) UIStepper *scoreStepper;

@end

@implementation SKTableViewCell

- (void)awakeFromNib {
    // Initialization code
}


- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    float top = 10;
    float labelHeight = 30;

    UITextField *nameField = [[UITextField alloc] initWithFrame:CGRectMake(40, top, 125, labelHeight)];
//    nameField.backgroundColor = [UIColor redColor];
    nameField.placeholder = @"Name";
    nameField.delegate = self;
    [self.contentView addSubview:nameField];
    nameField.clearButtonMode = YES;

    
    self.scoreTracker = [UILabel new];
    self.scoreTracker.frame = CGRectMake(125 + 10, top, 75, labelHeight);
    self.scoreTracker.text = @"0";
    self.scoreTracker.textAlignment = NSTextAlignmentCenter;
//    scoreCount.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.scoreTracker];
    
        self.scoreStepper = [[UIStepper alloc]initWithFrame:CGRectMake(125 + 75 + 10, top, 100, labelHeight)];
//    self.scoreStepper.backgroundColor = [UIColor orangeColor];
    self.scoreStepper.minimumValue = -100;
    self.scoreStepper.maximumValue = 100;
    [self.contentView addSubview:self.scoreStepper];
    [self.scoreStepper addTarget:self action:@selector(stepperAction:) forControlEvents:UIControlEventValueChanged];
    
    
    
    UIButton *clearScore = [[UIButton alloc] initWithFrame:CGRectMake(310, top, 50, labelHeight)];
//    clearScore.backgroundColor = [UIColor grayColor];
    [clearScore setTitle:@"clear" forState:UIControlStateNormal];
    [clearScore setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [clearScore addTarget:self action:@selector(scoreClear:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:clearScore];
    
    
    return self;
}

- (void)stepperAction:(UIStepper *)scoreStepper {
    int value = [scoreStepper value];
    self.scoreTracker.text = [NSString stringWithFormat:@"%d", value];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}




- (void)scoreClear:(UIButton *)clearScore {
    self.scoreTracker.text = @"0";
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
