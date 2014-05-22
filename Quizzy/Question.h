//
//  Question.h
//  Quizzy
//
//  Created by Ben Anderson on 12/05/2014.
//  Copyright (c) 2014 Ben Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Question : NSObject

@property NSInteger identifier;

- (void)generateQuestion;
- (NSString *)displayText;
- (NSInteger)numberOfAnswers;
- (NSString *)answerAtIndex:(NSInteger)index;
- (BOOL)validateAnswer:(NSInteger)selection;


+ (Question *)questionWithIdentifier:(NSInteger)iden
			     generateBlock:(void (^)(NSMutableDictionary *))generateBlock
			  displayTextBlock:(NSString * (^)(NSMutableDictionary *))displayBlock
		    numberOfAnswersBlock:(NSInteger (^)(NSMutableDictionary *))numAnswersBlock
			answerAtIndexBlock:(NSString * (^)(NSMutableDictionary *, NSInteger))answerIndexBlock
		     validateAnswerBlock:(BOOL (^)(NSMutableDictionary *, NSInteger))validateBlock;

@end
