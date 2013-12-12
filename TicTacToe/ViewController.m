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

- (BOOL)userEntryTextFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self showPlayersMove:textField.text];
    textField.text = nil;
    return NO;
}

- (void)showPlayersMove:(NSString *)usersMove
{
    NSLog(@"User's move was %@", usersMove);
    if ([usersMove isEqualToString:@"0,0"] || [usersMove isEqualToString:@"0, 0"]) {
        topLeftCornerLabel.font = [topLeftCornerLabel.font fontWithSize:45.0f];
        topLeftCornerLabel.textColor = [UIColor blackColor];
        topLeftCornerLabel.text = [NSString stringWithFormat:@"X"];
    } 
    if ([usersMove isEqualToString:@"1,0"] || [usersMove isEqualToString:@"1, 0"]) {
        topLeftCornerLabel.font = [topLeftCornerLabel.font fontWithSize:45.0f];
        topLeftCornerLabel.textColor = [UIColor blackColor];
        topLeftCornerLabel.text = [NSString stringWithFormat:@"X"];
    }
    if ([usersMove isEqualToString:@"2,0"] || [usersMove isEqualToString:@"2, 0"]) {
        topLeftCornerLabel.font = [topLeftCornerLabel.font fontWithSize:45.0f];
        topLeftCornerLabel.textColor = [UIColor blackColor];
        topLeftCornerLabel.text = [NSString stringWithFormat:@"X"];
    }
    if ([usersMove isEqualToString:@"0,1"] || [usersMove isEqualToString:@"0, 1"]) {
        topLeftCornerLabel.font = [topLeftCornerLabel.font fontWithSize:45.0f];
        topLeftCornerLabel.textColor = [UIColor blackColor];
        topLeftCornerLabel.text = [NSString stringWithFormat:@"X"];
    }
    if ([usersMove isEqualToString:@"1,1"] || [usersMove isEqualToString:@"1, 1"]) {
        topLeftCornerLabel.font = [topLeftCornerLabel.font fontWithSize:45.0f];
        topLeftCornerLabel.textColor = [UIColor blackColor];
        topLeftCornerLabel.text = [NSString stringWithFormat:@"X"];
    }
    if ([usersMove isEqualToString:@"2,1"] || [usersMove isEqualToString:@"2, 1"]) {
        topLeftCornerLabel.font = [topLeftCornerLabel.font fontWithSize:45.0f];
        topLeftCornerLabel.textColor = [UIColor blackColor];
        topLeftCornerLabel.text = [NSString stringWithFormat:@"X"];
    }
    if ([usersMove isEqualToString:@"0,2"] || [usersMove isEqualToString:@"0, 2"]) {
        topLeftCornerLabel.font = [topLeftCornerLabel.font fontWithSize:45.0f];
        topLeftCornerLabel.textColor = [UIColor blackColor];
        topLeftCornerLabel.text = [NSString stringWithFormat:@"X"];
    }
    if ([usersMove isEqualToString:@"1,2"] || [usersMove isEqualToString:@"1, 2"]) {
        topLeftCornerLabel.font = [topLeftCornerLabel.font fontWithSize:45.0f];
        topLeftCornerLabel.textColor = [UIColor blackColor];
        topLeftCornerLabel.text = [NSString stringWithFormat:@"X"];
    }
    if ([usersMove isEqualToString:@"2,2"] || [usersMove isEqualToString:@"2, 2"]) {
        topLeftCornerLabel.font = [topLeftCornerLabel.font fontWithSize:45.0f];
        topLeftCornerLabel.textColor = [UIColor blackColor];
        topLeftCornerLabel.text = [NSString stringWithFormat:@"X"];
    } else {
        UIAlertView *playerMadeWrongEntryAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Please Enter Coordinates in a #,# format" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
        [playerMadeWrongEntryAlert show];
    }
    //call method to check if person has tic tac toe
    
    //call method for computer's turn
    
}

- (void)showComputersMove
{
    //use arc$random and the tables tag number
    //check if the label text isEqualToX first
}

/*
- (BOOL)checkIfTicTacToeWinner
{
    if (<#condition#>) {
        UIAlertView *playerWonGame = [[UIAlertView alloc] initWithTitle:@"Winner" message:@"Player [X|O] won!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [playerWonGame show];
        return YES;
    } 
    if (    ){
        UIAlertView *catsGame = [[UIAlertView alloc] initWithTitle:@"Cat's Game" message:@"Stalemate!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [catsGame show];
        return NO;
    } else {
        return NO;
    }
}*/

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self restartGame];
    } 
    
}

- (void)restartGame
{
    
}

@end
