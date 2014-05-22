//
//  Topic.m
//  Quizzy
//
//  Created by Ben Anderson on 12/05/2014.
//  Copyright (c) 2014 Ben Anderson. All rights reserved.
//

#import "Topic.h"


@interface Topic ()

@property (nonatomic, assign) void (^generateQuestionsBlock)(NSMutableDictionary *data);
@property (nonatomic, assign) NSInteger (^numberOfQuestionsBlock)(NSMutableDictionary *data);
@property (nonatomic, assign) Question * (^questionAtIndexBlock)(NSMutableDictionary *data, NSInteger index);

@property NSMutableDictionary *data;

@end


@implementation Topic


- (id)init
{
	self = [super init];
	if (self) {
		self.identifier = 0;
		self.data = [[NSMutableDictionary alloc] init];
	}
	return self;
}


+ (Topic *)topicWithIdentifier:(NSInteger)iden
				  name:(NSString *)name
	  generateQuestionsBlock:(void (^)(NSMutableDictionary *))generateBlock
	  numberOfQuestionsBlock:(NSInteger (^)(NSMutableDictionary *))numQuestionsBlock
	    questionAtIndexBlock:(Question * (^)(NSMutableDictionary *, NSInteger))questionIndexBlock
{
	Topic *topic = [[Topic alloc] init];
	
	topic.identifier = iden;
	topic.name = name;
	topic.generateQuestionsBlock = generateBlock;
	topic.numberOfQuestionsBlock = numQuestionsBlock;
	topic.questionAtIndexBlock = questionIndexBlock;
	
	return topic;
}


- (void)generateQuestions
{
	self.generateQuestionsBlock(self.data);
}


- (NSInteger)numberOfQuestions
{
	return self.numberOfQuestionsBlock(self.data);
}


- (Question *)questionAtIndex:(NSInteger)index
{
	return self.questionAtIndexBlock(self.data, index);
}


@end
