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

@property (nonatomic, assign) NSInteger quizIndex;
@property (nonatomic, strong) Quiz * quiz;

@end
