//
//  TopicStatistics.h
//  Quizzy
//
//  Created by Ben Anderson on 12/05/2014.
//  Copyright (c) 2014 Ben Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TopicStatistics : NSObject <NSCoding>

@property NSInteger identifier;
@property (readonly, nonatomic) NSInteger answeredCount;
@property (readonly, nonatomic) NSInteger answeredCorrectlyCount;
@property (readonly) NSInteger answeredIncorrectlyCount;

- (void)answerQuestion:(NSInteger)questionID correctly:(BOOL)correct;

- (BOOL)isQuestionCorrect:(NSInteger)questionID;

@end
