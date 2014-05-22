//
//  Storage.m
//  Quizzy
//
//  Created by Ben Anderson on 12/05/2014.
//  Copyright (c) 2014 Ben Anderson. All rights reserved.
//

#import "Storage.h"


@interface Storage ()

@property NSMutableArray *topics;

@end


@implementation Storage


// ------------------------------------------------- //
#pragma mark - Generation
// ------------------------------------------------- //


- (id)init
{
	self = [super init];
	if (self) {
		self.topics = [[NSMutableArray alloc] init];
		
		Topic *t = [Topic topicWithIdentifier:0
							   name:@"Addition"
				   generateQuestionsBlock:^(NSMutableDictionary *data) {
			NSMutableArray *questions = [[NSMutableArray alloc] init];
			
			for (int i = 0; i < 10; i++) {
			// Add the first question
			[questions addObject:[Question questionWithIdentifier:0
									    generateBlock:^(NSMutableDictionary *data) {
				[data setObject:@(arc4random_uniform(20)) forKey:@"first"];
				[data setObject:@(arc4random_uniform(20)) forKey:@"second"];
										    
			} displayTextBlock:^NSString *(NSMutableDictionary *data) {
				NSString *first = ((NSNumber *) [data objectForKey:@"first"]).description;
				NSString *second = ((NSNumber *) [data objectForKey:@"second"]).description;
				
				return [NSString stringWithFormat:@"%@ + %@ =", first, second];
				
			} numberOfAnswersBlock:^NSInteger(NSMutableDictionary *data) {
				return 4;
				
			} answerAtIndexBlock:^NSString *(NSMutableDictionary *data, NSInteger index) {
				if (index == 0) {
					return @(53).description;
				} else if (index == 1) {
					return @(100).description;
				} else if (index == 2) {
					return @(((NSNumber *) [data objectForKey:@"first"]).integerValue + ((NSNumber *) [data objectForKey:@"second"]).integerValue).description;
				} else {
					return @(32).description;
				}
				
			} validateAnswerBlock:^BOOL(NSMutableDictionary *data, NSInteger index) {
				return index == 2;
			}]];
			}
			
			[data setObject:questions forKey:@"questions"];
					   
		} numberOfQuestionsBlock:^NSInteger(NSMutableDictionary *data) {
			return ((NSMutableArray *) [data objectForKey:@"questions"]).count;
			
		} questionAtIndexBlock:^Question *(NSMutableDictionary *data, NSInteger index) {
			return [((NSMutableArray *) [data objectForKey:@"questions"]) objectAtIndex:index];
		}];
		
		[self.topics addObject:t];
	}
	return self;
}


+ (Storage *)sharedStorage
{
	static Storage *shared = NULL;
	
	if (!shared) {
		shared = [[Storage alloc] init];
	}
	
	return shared;
}



// ------------------------------------------------- //
#pragma mark - Topics
// ------------------------------------------------- //


- (NSInteger)numberOfTopics
{
	return self.topics.count;
}


- (Topic *)topicForIndexPath:(NSIndexPath *)path
{
	return [self.topics objectAtIndex:path.row];
}


@end
