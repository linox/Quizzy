//
//  Statistics.m
//  Quizzy
//
//  Created by Ben Anderson on 12/05/2014.
//  Copyright (c) 2014 Ben Anderson. All rights reserved.
//

#import "Statistics.h"

#import "TopicStatistics.h"


@interface Statistics ()

@property NSDictionary *topics;

- (NSString *)savePath;

@end


@implementation Statistics


// ------------------------------------------------- //
#pragma mark - Initialisation
// ------------------------------------------------- //


- (id)init
{
	self = [super init];
	if (self) {
		self.topics = [[NSDictionary alloc] init];
	}
	return self;
}


+ (Statistics *)sharedStatistics
{
	static Statistics *shared = NULL;
	
	if (!shared) {
		shared = [[Statistics alloc] init];
	}
	
	return shared;
}



// ------------------------------------------------- //
#pragma mark - Saving and Loading
// ------------------------------------------------- //


- (NSString *)savePath
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *path = [documentsDirectory stringByAppendingPathComponent:SAVE_FILE_NAME];
	return path;
}


- (void)save
{
	[NSKeyedArchiver archiveRootObject:self.topics toFile:self.savePath];
}


- (void)load
{
	self.topics = [NSKeyedUnarchiver unarchiveObjectWithFile:self.savePath];
}



// ------------------------------------------------- //
#pragma mark - Statistics
// ------------------------------------------------- //


- (void)answerQuestion:(NSInteger)questionID inTopic:(NSInteger)topicID asCorrect:(BOOL)correct
{
	TopicStatistics *t = [self.topics objectForKey:@(topicID).description];
	[t answerQuestion:questionID correctly:correct];
}


- (NSInteger)questionsAnsweredInTopic:(NSInteger)topicID
{
	TopicStatistics *t = [self.topics objectForKey:@(topicID).description];
	
	if (t) {
		return t.answeredCount;
	} else {
		return 0;
	}
}


- (NSInteger)questionsCorrectInTopic:(NSInteger)topicID
{
	TopicStatistics *t = [self.topics objectForKey:@(topicID).description];
	
	if (t) {
		return t.answeredCorrectlyCount;
	} else {
		return 0;
	}
}


- (NSInteger)questionsIncorrectInTopic:(NSInteger)topicID
{
	TopicStatistics *t = [self.topics objectForKey:@(topicID).description];
	
	if (t) {
		return t.answeredIncorrectlyCount;
	} else {
		return 0;
	}
}


- (BOOL)isQuestionCorrect:(NSInteger)questionID inTopic:(NSInteger)topicID
{
	TopicStatistics *t = [self.topics objectForKey:@(topicID).description];
	
	if (t) {
		return [t isQuestionCorrect:questionID];
	} else {
		return NO;
	}
}


@end
