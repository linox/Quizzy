//
//  QuestionStatistics.h
//  Quizzy
//
//  Created by Ben Anderson on 12/05/2014.
//  Copyright (c) 2014 Ben Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface QuestionStatistics : NSObject <NSCoding>

@property NSInteger identifier;
@property (readonly) NSInteger answeredCount;
@property (readonly) NSInteger answeredCorrectlyCount;
@property (readonly) NSInteger answeredIncorrectlyCount;

- (void)answer:(BOOL)correct;

@end
