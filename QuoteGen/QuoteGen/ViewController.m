//
//  ViewController.m
//  QuoteGen
//
//  Created by Alexandre HUMEAU on 11/01/14.
//  Copyright (c) 2014 Alexandre HUMEAU. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 1 - Add array of personal quotes
    self.myQuotes = @[
                      @"Live and let live",
                      @"Don't cry over spilt milk",
                      @"Always look on the bright side of life",
                      @"Nobody's perfect",
                      @"Can't see the woods for the trees",
                      @"Better to have loved and lost then not loved at all",
                      @"The early bird catches the worm",
                      @"As slow as a wet week"
                      ];
    
    // 2 - Load movie quotes
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"quotes" ofType:@"plist"];
    self.movieQuotes= [NSMutableArray arrayWithContentsOfFile:plistCatPath];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)quoteButtonTapped:(id)sender {
    // 1 - Get number of rows in array
    //int array_tot = [self.myQuotes count];
    int array_tot = [self.movieQuotes count];
    // 2 - Get random index
    int index = (arc4random() % array_tot);
    // 3 - Get the quote string for the index
    //NSString *my_quote = self.myQuotes[index];
    NSString *my_quote = self.movieQuotes[index][@"quote"];
    NSString *my_film = self.movieQuotes[index][@"source"];
    NSString *my_category = self.movieQuotes[index][@"category"];
    // 4 - Display the quote in the text view
    self.quoteText.text = [NSString stringWithFormat:@"Quote:\n\n ""%@"" \n\n Film : %@ \n\n Category : %@",  my_quote, my_film, my_category];
}

@end
