//
//  TopicStatistics.m
//  Quizzy
//
//  Created by Ben Anderson on 12/05/2014.
//  Copyright (c) 2014 Ben Anderson. All rights reserved.
//

#import "TopicStatistics.h"

#import "QuestionStatistics.h"


@interface TopicStatistics ()

@property NSMutableDictionary *questions;

@property (readwrite) NSInteger answeredCount;
@property (readwrite) NSInteger answeredCorrectlyCount;

@end


@implementation TopicStatistics


- (id)init
{
	self = [super init];
	if (self) {
		self.questions = [[NSMutableDictionary alloc] init];
		self.answeredCount = 0;
		self.answeredCorrectlyCount = 0;
	}
	return self;
}



// ------------------------------------------------- //
#pragma mark - Encoding
// ------------------------------------------------- //


- (id)initWithCoder:(NSCoder *)decoder
{
	self = [super init];
	if (self) {
		self.questions = [decoder decodeObjectForKey:@"questions"];
		self.answeredCount = ((NSNumber *) [decoder decodeObjectForKey:@"answered"]).integerValue;
		self.answeredCorrectlyCount = ((NSNumber *) [decoder decodeObjectForKey:@"answered correctly"]).integerValue;
	}
	return self;
}


- (void)encodeWithCoder:(NSCoder *)coder
{
	[coder encodeObject:@(self.answeredCount) forKey:@"answered"];
	[coder encodeObject:@(self.answeredCorrectlyCount) forKey:@"answered correctly"];
	[coder encodeObject:self.questions forKey:@"questions"];
}



// ------------------------------------------------- //
#pragma mark - Statistics
// ------------------------------------------------- //


- (NSInteger)answeredCount
{
	NSInteger total = 0;
	
	for (NSString *key in self.questions) {
		QuestionStatistics *q = [self.questions objectForKey:key];
		total += q.answeredCount;
	}
	
	return total;
}


- (NSInteger)answeredCorrectlyCount
{
	NSInteger total = 0;
	
	for (NSString *key in self.questions) {
		QuestionStatistics *q = [self.questions objectForKey:key];
		total += q.answeredCorrectlyCount;
	}
	
	return total;
}


- (NSInteger)answeredIncorrectlyCount
{
	return self.answeredCount - self.answeredCorrectlyCount;
}


- (void)answerQuestion:(NSInteger)questionID correctly:(BOOL)correct
{
	QuestionStatistics *q = [self.questions objectForKey:@(questionID).description];
	
	if (!q) {
		q = [[QuestionStatistics alloc] init];
		[self.questions setObject:q forKey:@(questionID).description];
	}
	
	[q answer:correct];
}


- (BOOL)isQuestionCorrect:(NSInteger)questionID
{
	QuestionStatistics *q = [self.questions objectForKey:@(questionID).description];
	
	if (q) {
		return q.answeredCorrectlyCount >= 1;
	} else {
		return NO;
	}
}


@end
