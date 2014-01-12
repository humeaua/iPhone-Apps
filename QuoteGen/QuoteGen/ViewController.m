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

-(IBAction)quoteButtonTapped:(id)sender
{
    // 1 - Get personal quotes when the final segment is selected
    if (self.quoteOpt.selectedSegmentIndex == 2)
    {
        // 1.1 - Get number of rows in array
        int array_tot = [self.myQuotes count];
        // 1.2 - Get random index
        int index = (arc4random() % array_tot);
        // 1.3 - Get the quote string for the index
        NSString *my_quote = self.myQuotes[index];
        // 1.4 - Display the quote in the text view
        self.quoteText.text = [NSString stringWithFormat:@"Quote:\n\n%@",  my_quote];
    }
    // 2 - Get movie quotes
    else
    {
        // 2.1 - determine category
        NSString *selectedCategory = @"classic";
        if (self.quoteOpt.selectedSegmentIndex == 1)
        {
            selectedCategory = @"modern";
        }
        // 2.2 - filter array by category using predicate
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", selectedCategory];
        NSArray *filteredArray = [self.movieQuotes filteredArrayUsingPredicate:predicate];
        // 2.3 - get total number in filtered array
        int array_tot = [filteredArray count];
        // 2.4 - as a safeguard only get quote when the array has rows in it
        if (array_tot > 0)
        {
            // 2.5 - get random index
            int index = (arc4random() % array_tot);
            // 2.6 - get the quote string for the index
            NSString *quote = filteredArray[index][@"quote"];
            NSString *movie = filteredArray[index][@"source"];
            self.quoteText.text = [NSString stringWithFormat:@"Movie \"%@\" \n\nFilm : %@",  quote, movie];
        }
        else
        {
            self.quoteText.text = [NSString stringWithFormat:@"No quotes to display."];
        }
    }
}

@end
