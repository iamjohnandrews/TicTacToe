//
//  ViewController.h
//  TicTacToe
//
//  Created by John Andrews on 12/11/13.
//  Copyright (c) 2013 John Andrews. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *coordinateInputTextField;

@property (weak, nonatomic) IBOutlet UILabel *topLeftCornerLabel;

@property (weak, nonatomic) IBOutlet UILabel *topMiddleLabel;

@property (weak, nonatomic) IBOutlet UILabel *topRightCornerLabel;

@property (weak, nonatomic) IBOutlet UILabel *middleLeftLabel;

@property (weak, nonatomic) IBOutlet UILabel *middleMiddleLabel;

@property (weak, nonatomic) IBOutlet UILabel *middleRightLabel;

@property (weak, nonatomic) IBOutlet UILabel *bottomLeftCornerLabel;

@property (weak, nonatomic) IBOutlet UILabel *bottomMiddleLabel;

@property (weak, nonatomic) IBOutlet UILabel *bottomRightCornerLabel;

@property (weak, nonatomic) IBOutlet UILabel *headerTitleLabel;

@end
