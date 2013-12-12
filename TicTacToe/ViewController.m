//
//  ViewController.m
//  TicTacToe
//
//  Created by John Andrews on 12/11/13.
//  Copyright (c) 2013 John Andrews. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize coordinateInputTextField, topLeftCornerLabel, topMiddleLabel, topRightCornerLabel, middleLeftLabel, middleMiddleLabel, middleRightLabel, bottomLeftCornerLabel, bottomMiddleLabel, bottomRightCornerLabel, headerTitleLabel, theLetterO, theLetterX;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.coordinateInputTextField.delegate = self;
    [self userPicksGamePiece];
}

- (void)userPicksGamePiece
{
    UIAlertView *gamePieceDecision = [[UIAlertView alloc] initWithTitle:@"You Always Get First Move" message:@"You are X" delegate:self cancelButtonTitle:@"Let's Play" otherButtonTitles:nil];
    [gamePieceDecision show];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    textField.text = nil;
    return NO;
}

- (void)showingPlayersMove
{
    
    if ([coordinateInputTextField.text isEqualToString:@"0,0"] || [coordinateInputTextField.text isEqualToString:@"0, 0"]) {
        topRightCornerLabel.font = [topRightCornerLabel.font fontWithSize:30.0f];
        topRightCornerLabel.text = [NSString stringWithFormat:@"X"];
    }
    if ([coordinateInputTextField.text isEqualToString:@"1,0"] || [coordinateInputTextField.text isEqualToString:@"1, 0"]) {
        topRightCornerLabel.font = [topRightCornerLabel.font fontWithSize:30.0f];
        topRightCornerLabel.text = [NSString stringWithFormat:@"X"];
    }
    if ([coordinateInputTextField.text isEqualToString:@"2,0"] || [coordinateInputTextField.text isEqualToString:@"2, 0"]) {
        topRightCornerLabel.font = [topRightCornerLabel.font fontWithSize:30.0f];
        topRightCornerLabel.text = [NSString stringWithFormat:@"X"];
    }
    if ([coordinateInputTextField.text isEqualToString:@"0,1"] || [coordinateInputTextField.text isEqualToString:@"0, 1"]) {
        topRightCornerLabel.font = [topRightCornerLabel.font fontWithSize:30.0f];
        topRightCornerLabel.text = [NSString stringWithFormat:@"X"];
    }
    if ([coordinateInputTextField.text isEqualToString:@"1,1"] || [coordinateInputTextField.text isEqualToString:@"1, 1"]) {
        topRightCornerLabel.font = [topRightCornerLabel.font fontWithSize:30.0f];
        topRightCornerLabel.text = [NSString stringWithFormat:@"X"];
    }
    if ([coordinateInputTextField.text isEqualToString:@"2,1"] || [coordinateInputTextField.text isEqualToString:@"2, 1"]) {
        topRightCornerLabel.font = [topRightCornerLabel.font fontWithSize:30.0f];
        topRightCornerLabel.text = [NSString stringWithFormat:@"X"];
    }
    if ([coordinateInputTextField.text isEqualToString:@"0,2"] || [coordinateInputTextField.text isEqualToString:@"0, 2"]) {
        topRightCornerLabel.font = [topRightCornerLabel.font fontWithSize:30.0f];
        topRightCornerLabel.text = [NSString stringWithFormat:@"X"];
    }
    if ([coordinateInputTextField.text isEqualToString:@"1,2"] || [coordinateInputTextField.text isEqualToString:@"1, 2"]) {
        topRightCornerLabel.font = [topRightCornerLabel.font fontWithSize:30.0f];
        topRightCornerLabel.text = [NSString stringWithFormat:@"X"];
    }
    if ([coordinateInputTextField.text isEqualToString:@"2,2"] || [coordinateInputTextField.text isEqualToString:@"2, 2"]) {
        topRightCornerLabel.font = [topRightCornerLabel.font fontWithSize:30.0f];
        topRightCornerLabel.text = [NSString stringWithFormat:@"X"];
    } else {
        UIAlertView *playerMadeWrongEntryAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Enter Coordinates in a #,# format" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
        [playerMadeWrongEntryAlert show];
    }
    
}

@end
