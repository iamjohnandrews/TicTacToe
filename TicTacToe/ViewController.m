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
    NSTimer *displayComputersMove;
}

@end

@implementation ViewController
@synthesize coordinateInputTextField, topLeftCornerLabel, topMiddleLabel, topRightCornerLabel, middleLeftLabel, middleMiddleLabel, middleRightLabel, bottomLeftCornerLabel, bottomMiddleLabel, bottomRightCornerLabel, headerTitleLabel, theLetterO, theLetterX;

- (void)viewDidLoad
{    
    [super viewDidLoad];
    self.coordinateInputTextField.delegate = self;
    gameBoardCoordinatesArray = @[@"0,0", @"1,0", @"2,0", @"0,1", @"1,1", @"2,1", @"0,2", @"1,2", @"2,2"];
    [self startGame];
}

- (void)startGame
{
    UIAlertView *gamePieceDecision = [[UIAlertView alloc] initWithTitle:@"You Always Get First Move" message:@"You are X" delegate:nil cancelButtonTitle:@"Let's Play" otherButtonTitles:nil];
    [gamePieceDecision show];

    unavailableGameBoardPositionsArray = [NSMutableArray new];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"Player's move is %@", textField.text);
    [textField resignFirstResponder];
    [self showAnyPlayersMove:textField.text markerToBeUsed:@"X"];
    textField.text = nil;
    displayComputersMove = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(figureOutComputersMove) userInfo:nil repeats:NO];
    return NO;
}
#warning make it so that user can not input an occupied cell

- (void)showAnyPlayersMove:(NSString *)usersMove markerToBeUsed:(NSString *)marker
{
    if ([usersMove isEqualToString:@"0,0"] || [usersMove isEqualToString:@"0, 0"]) {
        topLeftCornerLabel.font = [topLeftCornerLabel.font fontWithSize:45.0f];
        topLeftCornerLabel.textColor = [UIColor blackColor];
        topLeftCornerLabel.text = [NSString stringWithFormat:@"%@", marker];
        [unavailableGameBoardPositionsArray addObject:[NSString stringWithFormat:@"%ld",(long)topLeftCornerLabel.tag]];
        
    } else if ([usersMove isEqualToString:@"1,0"] || [usersMove isEqualToString:@"1, 0"]) {
        topMiddleLabel.font = [topMiddleLabel.font fontWithSize:45.0f];
        topMiddleLabel.textColor = [UIColor blackColor];
        topMiddleLabel.text = [NSString stringWithFormat:@"%@", marker];
        [unavailableGameBoardPositionsArray addObject:[NSString stringWithFormat:@"%ld",(long)topMiddleLabel.tag]];
        
    } else if ([usersMove isEqualToString:@"2,0"] || [usersMove isEqualToString:@"2, 0"]) {
        topRightCornerLabel.font = [topRightCornerLabel.font fontWithSize:45.0f];
        topRightCornerLabel.textColor = [UIColor blackColor];
        topRightCornerLabel.text = [NSString stringWithFormat:@"%@", marker];
        [unavailableGameBoardPositionsArray addObject:[NSString stringWithFormat:@"%ld",(long)topRightCornerLabel.tag]];
        
    } else if ([usersMove isEqualToString:@"0,1"] || [usersMove isEqualToString:@"0, 1"]) {
        [unavailableGameBoardPositionsArray addObject:[NSString stringWithFormat:@"%d",middleLeftLabel.tag]];
        middleLeftLabel.font = [middleLeftLabel.font fontWithSize:45.0f];
        middleLeftLabel.textColor = [UIColor blackColor];
        middleLeftLabel.text = [NSString stringWithFormat:@"%@", marker];
        
    } else if ([usersMove isEqualToString:@"1,1"] || [usersMove isEqualToString:@"1, 1"]) {
        middleMiddleLabel.font = [middleMiddleLabel.font fontWithSize:45.0f];
        middleMiddleLabel.textColor = [UIColor blackColor];
        middleMiddleLabel.text = [NSString stringWithFormat:@"%@", marker];
        [unavailableGameBoardPositionsArray addObject:[NSString stringWithFormat:@"%ld",(long)middleMiddleLabel.tag]];
        
    } else if ([usersMove isEqualToString:@"2,1"] || [usersMove isEqualToString:@"2, 1"]) {
        middleRightLabel.font = [middleRightLabel.font fontWithSize:45.0f];
        middleRightLabel.textColor = [UIColor blackColor];
        middleRightLabel.text = [NSString stringWithFormat:@"%@", marker];
        [unavailableGameBoardPositionsArray addObject:[NSString stringWithFormat:@"%ld",(long)middleRightLabel.tag]];
        
    } else if ([usersMove isEqualToString:@"0,2"] || [usersMove isEqualToString:@"0, 2"]) {
        bottomLeftCornerLabel.font = [bottomLeftCornerLabel.font fontWithSize:45.0f];
        bottomLeftCornerLabel.textColor = [UIColor blackColor];
        bottomLeftCornerLabel.text = [NSString stringWithFormat:@"%@", marker];
        [unavailableGameBoardPositionsArray addObject:[NSString stringWithFormat:@"%ld",(long)bottomLeftCornerLabel.tag]];
        
    } else if ([usersMove isEqualToString:@"1,2"] || [usersMove isEqualToString:@"1, 2"]) {
        bottomMiddleLabel.font = [bottomMiddleLabel.font fontWithSize:45.0f];
        bottomMiddleLabel.textColor = [UIColor blackColor];
        bottomMiddleLabel.text = [NSString stringWithFormat:@"%@", marker];
        [unavailableGameBoardPositionsArray addObject:[NSString stringWithFormat:@"%ld",(long)bottomMiddleLabel.tag]];
        
    } else if ([usersMove isEqualToString:@"2,2"] || [usersMove isEqualToString:@"2, 2"]) {
        bottomRightCornerLabel.font = [bottomRightCornerLabel.font fontWithSize:45.0f];
        bottomRightCornerLabel.textColor = [UIColor blackColor];
        bottomRightCornerLabel.text = [NSString stringWithFormat:@"%@", marker];
        [unavailableGameBoardPositionsArray addObject:[NSString stringWithFormat:@"%ld",(long)bottomRightCornerLabel.tag]];
        
    } else {
        UIAlertView *playerMadeWrongEntryAlert = [[UIAlertView alloc] initWithTitle:@"Incorrect Entry" message:@"Please Enter Coordinates in a #,# format" delegate:nil cancelButtonTitle:@"Try Again" otherButtonTitles:nil];
        [playerMadeWrongEntryAlert show];
    }
    //[self catsGame];
    [self eightWaysToWinTicTacToe];
    NSLog(@"taken game board positions are %@", unavailableGameBoardPositionsArray);
}


- (void)figureOutComputersMove
{   
    BOOL moveWorks = NO;
    while ((moveWorks = YES)) {
        int randomComputerMove = arc4random() % 8;
        if (![unavailableGameBoardPositionsArray containsObject:[NSString stringWithFormat:@"%d", randomComputerMove]]) { 
            NSLog(@"Random selection (%d) is NOT in the unavailableGameBoardPositionsArray", randomComputerMove);
            NSLog(@"Computers Move is %@", [gameBoardCoordinatesArray objectAtIndex:randomComputerMove]);
            [self showAnyPlayersMove:[gameBoardCoordinatesArray objectAtIndex:randomComputerMove] markerToBeUsed:@"O"];
            moveWorks = NO;
            break;
        } else {
            NSLog(@"random selection (%d) is in the array", randomComputerMove);
            randomComputerMove++;
        }
    }
    
}

- (void)eightWaysToWinTicTacToe
{
    if ([topLeftCornerLabel.text isEqualToString:topMiddleLabel.text] && [topMiddleLabel.text isEqualToString: topRightCornerLabel.text]) {
        UIAlertView *playerWonGame = [[UIAlertView alloc] initWithTitle:@"Winner" message:@"Player [X|O] won!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [playerWonGame show];
    } else if ([middleLeftLabel.text isEqualToString:middleMiddleLabel.text] && [middleMiddleLabel.text isEqualToString: middleRightLabel.text]) {
        UIAlertView *playerWonGame = [[UIAlertView alloc] initWithTitle:@"Winner" message:@"Player [X|O] won!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [playerWonGame show];
    } else if ([bottomLeftCornerLabel.text isEqualToString:bottomMiddleLabel.text] && [bottomMiddleLabel.text isEqualToString: bottomRightCornerLabel.text]) {
        UIAlertView *playerWonGame = [[UIAlertView alloc] initWithTitle:@"Winner" message:@"Player [X|O] won!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [playerWonGame show];
    } else if ([topLeftCornerLabel.text isEqualToString:middleLeftLabel.text] && [middleLeftLabel.text isEqualToString: bottomLeftCornerLabel.text]) {
        UIAlertView *playerWonGame = [[UIAlertView alloc] initWithTitle:@"Winner" message:@"Player [X|O] won!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [playerWonGame show];
    } else if ([topMiddleLabel.text isEqualToString:middleMiddleLabel.text] && [middleMiddleLabel.text isEqualToString: bottomMiddleLabel.text]) {
        UIAlertView *playerWonGame = [[UIAlertView alloc] initWithTitle:@"Winner" message:@"Player [X|O] won!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [playerWonGame show];
    } else if ([topRightCornerLabel.text isEqualToString:middleRightLabel.text] && [middleRightLabel.text isEqualToString: bottomRightCornerLabel.text]) {
        UIAlertView *playerWonGame = [[UIAlertView alloc] initWithTitle:@"Winner" message:@"Player [X|O] won!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [playerWonGame show];
    } else if ([topLeftCornerLabel.text isEqualToString:middleMiddleLabel.text] && [middleMiddleLabel.text isEqualToString: bottomRightCornerLabel.text]) {
        UIAlertView *playerWonGame = [[UIAlertView alloc] initWithTitle:@"Winner" message:@"Player [X|O] won!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [playerWonGame show];
    } else if ([topRightCornerLabel.text isEqualToString:middleMiddleLabel.text] && [middleMiddleLabel.text isEqualToString: bottomLeftCornerLabel.text]) {
        UIAlertView *playerWonGame = [[UIAlertView alloc] initWithTitle:@"Winner" message:@"Player [X|O] won!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [playerWonGame show];
    } 
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [self resetGameBoard];
    }
}

- (void)catsGame
{
    if (unavailableGameBoardPositionsArray.count - 1 == 8) {
        UIAlertView *catsGame = [[UIAlertView alloc] initWithTitle:@"Cat's Game" message:@"Stalemate!" delegate:self cancelButtonTitle:@"Play Again" otherButtonTitles:nil];
        [catsGame show];
    }
}

- (void)resetGameBoard
{
    topRightCornerLabel.text = [gameBoardCoordinatesArray objectAtIndex:0];
    topRightCornerLabel.font = [topRightCornerLabel.font fontWithSize:17.0f];
    topRightCornerLabel.textColor = [UIColor lightGrayColor];
    
    topMiddleLabel.text = [gameBoardCoordinatesArray objectAtIndex:1];
    topMiddleLabel.font = [topMiddleLabel.font fontWithSize:17.0f];
    topMiddleLabel.textColor = [UIColor lightGrayColor];
    
    topLeftCornerLabel.text = [gameBoardCoordinatesArray objectAtIndex:2];
    topLeftCornerLabel.font = [topLeftCornerLabel.font fontWithSize:17.0f];
    topLeftCornerLabel.textColor = [UIColor lightGrayColor];
    
    middleLeftLabel.text = [gameBoardCoordinatesArray objectAtIndex:3];
    middleLeftLabel.font = [middleLeftLabel.font fontWithSize:17.0f];
    middleLeftLabel.textColor = [UIColor lightGrayColor];
    
    middleMiddleLabel.text = [gameBoardCoordinatesArray objectAtIndex:4];
    middleMiddleLabel.font = [middleMiddleLabel.font fontWithSize:17.0f];
    middleMiddleLabel.textColor = [UIColor lightGrayColor];
    
    middleRightLabel.text = [gameBoardCoordinatesArray objectAtIndex:5];
    middleRightLabel.font = [middleRightLabel.font fontWithSize:17.0f];
    middleRightLabel.textColor = [UIColor lightGrayColor];
    
    bottomLeftCornerLabel.text = [gameBoardCoordinatesArray objectAtIndex:6];
    bottomLeftCornerLabel.font = [bottomLeftCornerLabel.font fontWithSize:17.0f];
    bottomLeftCornerLabel.textColor = [UIColor lightGrayColor];
    
    bottomMiddleLabel.text = [gameBoardCoordinatesArray objectAtIndex:7];
    bottomMiddleLabel.font = [bottomMiddleLabel.font fontWithSize:17.0f];
    bottomMiddleLabel.textColor = [UIColor lightGrayColor];
    
    bottomRightCornerLabel.text = [gameBoardCoordinatesArray objectAtIndex:8];
    bottomRightCornerLabel.font = [bottomRightCornerLabel.font fontWithSize:17.0f];
    bottomRightCornerLabel.textColor = [UIColor lightGrayColor];
    
    [self startGame];
}




@end
