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
    if (self.quiz.correctCount)
    {
        self.statusLabel.text = [NSString stringWithFormat:@"Quiz Done - Score %d%%", self.quiz.quizCount / self.quiz.correctCount];
    }
    else
    {
        self.statusLabel.text = @"Quiz Done - Score: 0%";
    }
    [self.startButton setTitle:@"Try Again" forState:UIControlStateNormal];
    self.quizIndex = 999;
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
    
    if (self.quiz.tipCount < 3)
    {
        self.infoButton.hidden = NO;
    }
    else
    {
        self.infoButton.hidden = YES;
    }
}

- (void)checkAnswer
{
    if ([self.quiz checkQuestion:self.quizIndex forAnswer:_answer])
    {
        if (self.answer == 1)
        {
            self.answer1Label.backgroundColor = [UIColor greenColor];
        }
        else if (self.answer == 2)
        {
            self.answer2Label.backgroundColor = [UIColor greenColor];
        }
        else if (self.answer == 3)
        {
            self.answer3Label.backgroundColor = [UIColor greenColor];
        }
    }
    else
    {
        if (self.answer == 1)
        {
            self.answer1Label.backgroundColor = [UIColor redColor];
        }
        else if (self.answer == 2)
        {
            self.answer2Label.backgroundColor = [UIColor redColor];
        }
        else if (self.answer == 3)
        {
            self.answer3Label.backgroundColor = [UIColor redColor];
        }
    }
    
    self.statusLabel.text = [NSString stringWithFormat:@"Correct: %d Incorrect: %d",self.quiz.correctCount, self.quiz.incorrectCount];
    
    //  Remove the button so that we cannot click anymore
    self.answer1Button.hidden = YES;
    self.answer2Button.hidden = YES;
    self.answer3Button.hidden = YES;
    
    self.startButton.hidden = NO;
    
    [self.startButton setTitle:@"Next" forState:UIControlStateNormal];
}

- (IBAction)ans1Action:(id)sender
{
    self.answer = 1;
    [self checkAnswer];
}

- (IBAction)ans2Action:(id)sender
{
    self.answer = 2;
    [self checkAnswer];
}

- (IBAction)ans3Action:(id)sender
{
    self.answer = 3;
    [self checkAnswer];
}

- (IBAction)startAgain:(id)sender
{
    [self nextQuizItem];
}

- (void)quizTipDidFinish:(QuizTipViewController *) controller {
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"TipModal"]) {
        QuizTipViewController * detailViewController = (QuizTipViewController *) segue.destinationViewController;
        detailViewController.delegate = self;
        detailViewController.tipText = self.quiz.tip;
    }
}

@end
