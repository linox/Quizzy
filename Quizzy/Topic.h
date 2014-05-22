//
//  Topic.h
//  Quizzy
//
//  Created by Ben Anderson on 12/05/2014.
//  Copyright (c) 2014 Ben Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Question.h"


@interface Topic : NSObject

@property NSInteger identifier;
@property NSString *name;


- (void)generateQuestions;
- (NSInteger)numberOfQuestions;
- (Question *)questionAtIndex:(NSInteger)index;


+ (Topic *)topicWithIdentifier:(NSInteger)iden
				  name:(NSString *)name
	  generateQuestionsBlock:(void (^)(NSMutableDictionary *))generateBlock
	  numberOfQuestionsBlock:(NSInteger (^)(NSMutableDictionary *))numQuestionsBlock
	    questionAtIndexBlock:(Question * (^)(NSMutableDictionary *, NSInteger))questionIndexBlock;

@end
