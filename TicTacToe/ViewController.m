//
//  ViewController.m
//  TicTacToe
//
//  Created by John Andrews on 12/11/13.
//  Copyright (c) 2013 John Andrews. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *gameBoardCoordinatesArray;
    NSMutableArray *unavailableGameBoardPositionsArray;    
    NSDictionary *ticTacToeGameBoardPositionsDictionary;
    
    NSTimer *displayComputersMove;
}

@end

@implementation ViewController
@synthesize coordinateInputTextField, topLeftCornerLabel, topMiddleLabel, topRightCornerLabel, middleLeftLabel, middleMiddleLabel, middleRightLabel, bottomLeftCornerLabel, bottomMiddleLabel, bottomRightCornerLabel, headerTitleLabel, theLetterO, theLetterX;

- (void)viewDidLoad
{    
    [super viewDidLoad];
    self.coordinateInputTextField.delegate = self;
    
    [self beingGame];
    
    gameBoardCoordinatesArray = @[@"0,0", @"1,0", @"2,0", @"0,1", @"1,1", @"2,1", @"0,2", @"1,2", @"2,2"];
    
    ticTacToeGameBoardPositionsDictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                             topRightCornerLabel, @"0",
                                             topMiddleLabel, @"1", 
                                             topRightCornerLabel, @"2", 
                                             middleLeftLabel, @"3", 
                                             middleMiddleLabel, @"4", 
                                             middleRightLabel, @"5", 
                                             bottomLeftCornerLabel, @"6", 
                                             bottomMiddleLabel, @"7", 
                                             bottomRightCornerLabel, @"8", nil];
}

- (void)beingGame
{
    UIAlertView *gamePieceDecision = [[UIAlertView alloc] initWithTitle:@"You Always Get First Move" message:@"You are X" delegate:self cancelButtonTitle:@"Let's Play" otherButtonTitles:nil];
    [gamePieceDecision show];

    unavailableGameBoardPositionsArray = [NSMutableArray new];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [self showAnyPlayersMove:textField.text markerToBeUsed:@"X"];
    textField.text = nil;
    return NO;
}


- (void)showAnyPlayersMove:(NSString *)usersMove markerToBeUsed:(NSString *)marker
{
    NSLog(@"User's move was %@", usersMove);
    if ([usersMove isEqualToString:@"0,0"] || [usersMove isEqualToString:@"0, 0"]) {
        topLeftCornerLabel.font = [topLeftCornerLabel.font fontWithSize:45.0f];
        topLeftCornerLabel.textColor = [UIColor blackColor];
        topLeftCornerLabel.text = [NSString stringWithFormat:@"%@", marker];
        [unavailableGameBoardPositionsArray addObject:[NSString stringWithFormat:@"%ld",(long)topLeftCornerLabel.tag]];
        displayComputersMove = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(figureOutComputersMove) userInfo:nil repeats:NO];
        
    } else if ([usersMove isEqualToString:@"1,0"] || [usersMove isEqualToString:@"1, 0"]) {
        topMiddleLabel.font = [topMiddleLabel.font fontWithSize:45.0f];
        topMiddleLabel.textColor = [UIColor blackColor];
        topMiddleLabel.text = [NSString stringWithFormat:@"%@", marker];
        [unavailableGameBoardPositionsArray addObject:[NSString stringWithFormat:@"%ld",(long)topMiddleLabel.tag]];
        displayComputersMove = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(figureOutComputersMove) userInfo:nil repeats:NO];
        
    } else if ([usersMove isEqualToString:@"2,0"] || [usersMove isEqualToString:@"2, 0"]) {
        topRightCornerLabel.font = [topRightCornerLabel.font fontWithSize:45.0f];
        topRightCornerLabel.textColor = [UIColor blackColor];
        topRightCornerLabel.text = [NSString stringWithFormat:@"%@", marker];
        [unavailableGameBoardPositionsArray addObject:[NSString stringWithFormat:@"%ld",(long)topRightCornerLabel.tag]];
        displayComputersMove = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(figureOutComputersMove) userInfo:nil repeats:NO];
        
    } else if ([usersMove isEqualToString:@"0,1"] || [usersMove isEqualToString:@"0, 1"]) {
        middleLeftLabel.font = [middleLeftLabel.font fontWithSize:45.0f];
        middleLeftLabel.textColor = [UIColor blackColor];
        middleLeftLabel.text = [NSString stringWithFormat:@"%@", marker];
        [unavailableGameBoardPositionsArray addObject:[NSString stringWithFormat:@"%ld",(long)middleLeftLabel.tag]];
        displayComputersMove = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(figureOutComputersMove) userInfo:nil repeats:NO];
        
    } else if ([usersMove isEqualToString:@"1,1"] || [usersMove isEqualToString:@"1, 1"]) {
        middleMiddleLabel.font = [middleMiddleLabel.font fontWithSize:45.0f];
        middleMiddleLabel.textColor = [UIColor blackColor];
        middleMiddleLabel.text = [NSString stringWithFormat:@"%@", marker];
        [unavailableGameBoardPositionsArray addObject:[NSString stringWithFormat:@"%ld",(long)middleMiddleLabel.tag]];
        displayComputersMove = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(figureOutComputersMove) userInfo:nil repeats:NO];
        
    } else if ([usersMove isEqualToString:@"2,1"] || [usersMove isEqualToString:@"2, 1"]) {
        middleRightLabel.font = [middleRightLabel.font fontWithSize:45.0f];
        middleRightLabel.textColor = [UIColor blackColor];
        middleRightLabel.text = [NSString stringWithFormat:@"%@", marker];
        [unavailableGameBoardPositionsArray addObject:[NSString stringWithFormat:@"%ld",(long)middleRightLabel.tag]];
        displayComputersMove = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(figureOutComputersMove) userInfo:nil repeats:NO];
        
    } else if ([usersMove isEqualToString:@"0,2"] || [usersMove isEqualToString:@"0, 2"]) {
        bottomLeftCornerLabel.font = [bottomLeftCornerLabel.font fontWithSize:45.0f];
        bottomLeftCornerLabel.textColor = [UIColor blackColor];
        bottomLeftCornerLabel.text = [NSString stringWithFormat:@"%@", marker];
        [unavailableGameBoardPositionsArray addObject:[NSString stringWithFormat:@"%ld",(long)bottomLeftCornerLabel.tag]];
        displayComputersMove = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(figureOutComputersMove) userInfo:nil repeats:NO];
        
    } else if ([usersMove isEqualToString:@"1,2"] || [usersMove isEqualToString:@"1, 2"]) {
        bottomMiddleLabel.font = [bottomMiddleLabel.font fontWithSize:45.0f];
        bottomMiddleLabel.textColor = [UIColor blackColor];
        bottomMiddleLabel.text = [NSString stringWithFormat:@"%@", marker];
        [unavailableGameBoardPositionsArray addObject:[NSString stringWithFormat:@"%ld",(long)bottomMiddleLabel.tag]];
        displayComputersMove = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(figureOutComputersMove) userInfo:nil repeats:NO];
        
    } else if ([usersMove isEqualToString:@"2,2"] || [usersMove isEqualToString:@"2, 2"]) {
        bottomRightCornerLabel.font = [bottomRightCornerLabel.font fontWithSize:45.0f];
        bottomRightCornerLabel.textColor = [UIColor blackColor];
        bottomRightCornerLabel.text = [NSString stringWithFormat:@"%@", marker];
        [unavailableGameBoardPositionsArray addObject:[NSString stringWithFormat:@"%ld",(long)bottomRightCornerLabel.tag]];
        displayComputersMove = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(figureOutComputersMove) userInfo:nil repeats:NO];
        
    } else {
        UIAlertView *playerMadeWrongEntryAlert = [[UIAlertView alloc] initWithTitle:@"Incorrect Entry" message:@"Please Enter Coordinates in a #,# format" delegate:self cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
        [playerMadeWrongEntryAlert show];
    }
    NSLog(@"taken game board positions are %@", unavailableGameBoardPositionsArray);
    
    //call method to check if person has tic tac toe*****
    
    
}

- (void)figureOutComputersMove
{   
    //computer has to figure out if there is already an X in tic tac to box
    int randomComputerMove = arc4random() % 8;
    int cycleThroughTagNumbers = 0;
    while (randomComputerMove != [[unavailableGameBoardPositionsArray objectAtIndex:cycleThroughTagNumbers] integerValue]) {
        NSLog(@"Computers Move is %@", [gameBoardCoordinatesArray objectAtIndex:randomComputerMove]);
        [self showAnyPlayersMove:[gameBoardCoordinatesArray objectAtIndex:randomComputerMove] markerToBeUsed:@"O"];
        cycleThroughTagNumbers++;
    }
}

- (void)eightWaysToWinTicTacToe
{
    if ([topLeftCornerLabel.text isEqualToString:topMiddleLabel.text] && [topMiddleLabel.text isEqualToString: topRightCornerLabel.text]) {
        UIAlertView *playerWonGame = [[UIAlertView alloc] initWithTitle:@"Winner" message:@"Player [X|O] won!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [playerWonGame show];
    }
    if ([middleLeftLabel.text isEqualToString:middleMiddleLabel.text] && [middleMiddleLabel.text isEqualToString: middleRightLabel.text]) {
        UIAlertView *playerWonGame = [[UIAlertView alloc] initWithTitle:@"Winner" message:@"Player [X|O] won!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [playerWonGame show];
    }
    if ([bottomLeftCornerLabel.text isEqualToString:bottomMiddleLabel.text] && [bottomMiddleLabel.text isEqualToString: bottomRightCornerLabel.text]) {
        UIAlertView *playerWonGame = [[UIAlertView alloc] initWithTitle:@"Winner" message:@"Player [X|O] won!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [playerWonGame show];
    }
    if ([topLeftCornerLabel.text isEqualToString:middleLeftLabel.text] && [middleLeftLabel.text isEqualToString: bottomLeftCornerLabel.text]) {
        UIAlertView *playerWonGame = [[UIAlertView alloc] initWithTitle:@"Winner" message:@"Player [X|O] won!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [playerWonGame show];
    }
    if ([topMiddleLabel.text isEqualToString:middleMiddleLabel.text] && [middleMiddleLabel.text isEqualToString: bottomMiddleLabel.text]) {
        UIAlertView *playerWonGame = [[UIAlertView alloc] initWithTitle:@"Winner" message:@"Player [X|O] won!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [playerWonGame show];
    }
    if ([topRightCornerLabel.text isEqualToString:middleRightLabel.text] && [middleRightLabel.text isEqualToString: bottomRightCornerLabel.text]) {
        UIAlertView *playerWonGame = [[UIAlertView alloc] initWithTitle:@"Winner" message:@"Player [X|O] won!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [playerWonGame show];
    }
    if ([topLeftCornerLabel.text isEqualToString:middleMiddleLabel.text] && [middleMiddleLabel.text isEqualToString: bottomRightCornerLabel.text]) {
        UIAlertView *playerWonGame = [[UIAlertView alloc] initWithTitle:@"Winner" message:@"Player [X|O] won!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [playerWonGame show];
    }
    if ([topRightCornerLabel.text isEqualToString:middleMiddleLabel.text] && [middleMiddleLabel.text isEqualToString: bottomLeftCornerLabel.text]) {
        UIAlertView *playerWonGame = [[UIAlertView alloc] initWithTitle:@"Winner" message:@"Player [X|O] won!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [playerWonGame show];
    } else {
        NSLog(@"No winner yet");
    }
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
}
*/

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
