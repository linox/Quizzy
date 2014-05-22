//
//  Statistics.h
//  Quizzy
//
//  Created by Ben Anderson on 12/05/2014.
//  Copyright (c) 2014 Ben Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Question.h"


#define SAVE_FILE_NAME @"quizzy_save_file"


@interface Statistics : NSObject

+ (Statistics *)sharedStatistics;

- (void)save;
- (void)load;

- (void)answerQuestion:(NSInteger)questionID inTopic:(NSInteger)topicID asCorrect:(BOOL)correct;

- (NSInteger)questionsAnsweredInTopic:(NSInteger)topicID;
- (NSInteger)questionsCorrectInTopic:(NSInteger)topicID;
- (NSInteger)questionsIncorrectInTopic:(NSInteger)topicID;

- (BOOL)isQuestionCorrect:(NSInteger)questionID inTopic:(NSInteger)topicID;

@end
