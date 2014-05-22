//
//  Question.m
//  Quizzy
//
//  Created by Ben Anderson on 12/05/2014.
//  Copyright (c) 2014 Ben Anderson. All rights reserved.
//

#import "Question.h"


@interface Question ()

@property (nonatomic, assign) void (^generateQuestionBlock)(NSMutableDictionary *data);
@property (nonatomic, assign) NSString * (^displayTextBlock)(NSMutableDictionary *data);
@property (nonatomic, assign) NSInteger (^numberOfAnswersBlock)(NSMutableDictionary *data);
@property (nonatomic, assign) NSString * (^answerAtIndexBlock)(NSMutableDictionary *data, NSInteger index);
@property (nonatomic, assign) BOOL (^validateAnswerBlock)(NSMutableDictionary *data, NSInteger userAnswer);

@property NSMutableDictionary *data;

@end


@implementation Question


- (id)init
{
	self = [super init];
	if (self) {
		self.identifier = 0;
		self.data = [[NSMutableDictionary alloc] init];
	}
	return self;
}


+ (Question *)questionWithIdentifier:(NSInteger)iden
			     generateBlock:(void (^)(NSMutableDictionary *))generateBlock
			  displayTextBlock:(NSString * (^)(NSMutableDictionary *))displayBlock
		    numberOfAnswersBlock:(NSInteger (^)(NSMutableDictionary *))numAnswersBlock
			answerAtIndexBlock:(NSString * (^)(NSMutableDictionary *, NSInteger))answerIndexBlock
		  validateAnswerBlock:(BOOL (^)(NSMutableDictionary *, NSInteger))validateBlock
{
	Question *q = [[Question alloc] init];

	q.identifier = iden;
	q.generateQuestionBlock = generateBlock;
	q.displayTextBlock = displayBlock;
	q.numberOfAnswersBlock = numAnswersBlock;
	q.answerAtIndexBlock = answerIndexBlock;
	q.validateAnswerBlock = validateBlock;
	
	return q;
}


- (void)generateQuestion
{
	self.generateQuestionBlock(self.data);
}


- (NSString *)displayText
{
	return self.displayTextBlock(self.data);
}


- (NSInteger)numberOfAnswers
{
	return self.numberOfAnswersBlock(self.data);
}


- (NSString *)answerAtIndex:(NSInteger)index
{
	return self.answerAtIndexBlock(self.data, index);
}


- (BOOL)validateAnswer:(NSInteger)selection
{
	return self.validateAnswerBlock(self.data, selection);
}


@end
