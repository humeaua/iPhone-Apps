//
//  ViewController.h
//  QuoteGen
//
//  Created by Alexandre HUMEAU on 11/01/14.
//  Copyright (c) 2014 Alexandre HUMEAU. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) NSArray *myQuotes;

@property (nonatomic, strong) NSMutableArray *movieQuotes;
@property (nonatomic, strong) IBOutlet UITextView *quoteText;

- (IBAction)quoteButtonTapped:(id)sender;

@property (nonatomic, strong) IBOutlet UISegmentedControl *quoteOpt;

@end
