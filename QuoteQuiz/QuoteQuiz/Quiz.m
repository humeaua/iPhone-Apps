//
//  Quiz.m
//  QuoteQuiz
//
//  Created by Alexandre HUMEAU on 12/01/14.
//  Copyright (c) 2014 Alexandre HUMEAU. All rights reserved.
//

#import "Quiz.h"

@implementation Quiz

- (id)initWithQuiz:(NSString*)plistName
{
    /*
     Super useful comment 
     
     Note: Why should you use self when setting and getting data for a property? That’s because self is similar to the “this” keyword in other languages, and refers to the object upon which the method is running. This is now mandatory from Xcode 4.5 — don’t forget or you’ll run into build errors!
     */
    if ((self = [super init]))
    {
        NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:plistName ofType:@"plist"];
        self.movieArray = [NSMutableArray arrayWithContentsOfFile:plistCatPath];
    }
    return self;
}

@end
