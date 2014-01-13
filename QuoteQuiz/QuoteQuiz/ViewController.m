//
//  ViewController.m
//  QuoteQuiz
//
//  Created by Alexandre HUMEAU on 12/01/14.
//  Copyright (c) 2014 Alexandre HUMEAU. All rights reserved.
//

#import "ViewController.h"

@class Quiz;

@interface ViewController ()

/*
 Remember that the IBOutlet keyword means that this is an object that can be linked to an interface element.
 */

@property (weak, nonatomic) IBOutlet UILabel * questionLabel;
@property (weak, nonatomic) IBOutlet UILabel * answer1Label;
@property (weak, nonatomic) IBOutlet UILabel * answer2Label;
@property (weak, nonatomic) IBOutlet UILabel * answer3Label;
@property (weak, nonatomic) IBOutlet UIButton * answer1Button;
@property (weak, nonatomic) IBOutlet UIButton * answer2Button;
@property (weak, nonatomic) IBOutlet UIButton * answer3Button;
@property (weak, nonatomic) IBOutlet UIImageView * movie1;
@property (weak, nonatomic) IBOutlet UIImageView * movie2;
@property (weak, nonatomic) IBOutlet UIImageView * movie3;
@property (weak, nonatomic) IBOutlet UILabel * statusLabel;
@property (weak, nonatomic) IBOutlet UIButton * startButton;
@property (weak, nonatomic) IBOutlet UIButton * infoButton;

@property (assign, nonatomic) NSInteger answer;

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.quizIndex = 999;
    self.quiz = [[Quiz alloc] initWithQuiz:@"quotes"];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self nextQuizItem];
    //  Put the color of question label the same as answers
    self.questionLabel.backgroundColor = [UIColor colorWithRed:51/255.0 green:133/255.0 blue:238/255.0 alpha:1.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)quizDone
{
    // More later
}

- (void)nextQuizItem
{
    if (self.quizIndex == 999)
    {
        self.quizIndex = 0;
        self.statusLabel.text = @"";
    }
    else if ((self.quiz.quizCount-1) > self.quizIndex)
    {
        self.quizIndex++;
    }
    else
    {
        self.quizIndex = 0;
        self.statusLabel.text = @"";
    }
    
    if (self.quiz.quizCount >= self.quizIndex + 1)
    {
        [self.quiz nextQuestion:self.quizIndex];
        self.questionLabel.text = self.quiz.quote;
        self.answer1Label.text = self.quiz.ans1;
        self.answer2Label.text = self.quiz.ans2;
        self.answer3Label.text = self.quiz.ans3;
    }
    else
    {
        self.quizIndex = 0;
        [self quizDone];
    }
    
    // reset fields for next question
    self.answer1Label.backgroundColor = [UIColor colorWithRed:51/255.0 green:133/255.0 blue:238/255.0 alpha:1.0];
    self.answer2Label.backgroundColor = [UIColor colorWithRed:51/255.0 green:133/255.0 blue:238/255.0 alpha:1.0];
    self.answer3Label.backgroundColor = [UIColor colorWithRed:51/255.0 green:133/255.0 blue:238/255.0 alpha:1.0];
    
    self.answer1Button.hidden = NO;
    self.answer2Button.hidden = NO;
    self.answer3Button.hidden = NO;
}

@end
