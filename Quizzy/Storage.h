//
//  Storage.h
//  Quizzy
//
//  Created by Ben Anderson on 12/05/2014.
//  Copyright (c) 2014 Ben Anderson. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Topic.h"


@interface Storage : NSObject

+ (Storage *)sharedStorage;

- (NSInteger)numberOfTopics;
- (Topic *)topicForIndexPath:(NSIndexPath *)path;

@end
