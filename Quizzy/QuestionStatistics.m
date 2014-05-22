//
//  QuestionStatistics.m
//  Quizzy
//
//  Created by Ben Anderson on 12/05/2014.
//  Copyright (c) 2014 Ben Anderson. All rights reserved.
//

#import "QuestionStatistics.h"


@interface QuestionStatistics ()

@property (readwrite) NSInteger answeredCount;
@property (readwrite) NSInteger answeredCorrectlyCount;

@end


@implementation QuestionStatistics


- (id)init
{
	self = [super init];
	if (self) {
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
		self.answeredCount = ((NSNumber *) [decoder decodeObjectForKey:@"answered"]).integerValue;
		self.answeredCorrectlyCount = ((NSNumber *) [decoder decodeObjectForKey:@"answered correctly"]).integerValue;
	}
	return self;
}


- (void)encodeWithCoder:(NSCoder *)coder
{
	[coder encodeObject:@(self.answeredCount) forKey:@"answered"];
	[coder encodeObject:@(self.answeredCorrectlyCount) forKey:@"answered correctly"];
}



// ------------------------------------------------- //
#pragma mark - Statistics
// ------------------------------------------------- //


- (NSInteger)answeredIncorrectlyCount
{
	return self.answeredCount - self.answeredCorrectlyCount;
}


- (void)answer:(BOOL)correct
{
	self.answeredCount++;
	
	if (correct) {
		self.answeredCorrectlyCount++;
	}
}


@end
