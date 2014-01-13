//
//  ViewController.h
//  QuoteQuiz
//
//  Created by Alexandre HUMEAU on 12/01/14.
//  Copyright (c) 2014 Alexandre HUMEAU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Quiz.h"

@interface ViewController : UIViewController

- (IBAction)ans1Action:(id)sender;
- (IBAction)ans2Action:(id)sender;
- (IBAction)ans3Action:(id)sender;
- (IBAction)startAgain:(id)sender;

@property (nonatomic, assign) NSInteger quizIndex;
@property (nonatomic, strong) Quiz * quiz;

@end
