//
//  Quiz.h
//  QuoteQuiz
//
//  Created by Alexandre HUMEAU on 12/01/14.
//  Copyright (c) 2014 Alexandre HUMEAU. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Quiz : NSObject

@property (nonatomic, retain) NSMutableArray * movieArray; // Previous Property
@property (nonatomic, assign) NSInteger correctCount;
@property (nonatomic, assign) NSInteger incorrectCount;
@property (nonatomic, assign) NSInteger quizCount;
@property (nonatomic, readonly, strong) NSString * quote;
@property (nonatomic, readonly, strong) NSString * ans1;
@property (nonatomic, readonly, strong) NSString * ans2;
@property (nonatomic, readonly, strong) NSString * ans3;

-(id) initWithQuiz:(NSString*)plistName; // Previous Method
-(void) nextQuestion: (NSUInteger) idx;
-(BOOL) checkQuestion: (NSUInteger) question forAnswer: (NSUInteger) answer;

@end
