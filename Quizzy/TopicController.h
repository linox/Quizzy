//
//  TopicController.h
//  Quizzy
//
//  Created by Ben Anderson on 12/05/2014.
//  Copyright (c) 2014 Ben Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Topic.h"
#import "SPQuestionController.h"


@protocol TopicControllerDelegate <NSObject>

- (Topic *)currentTopic;

@end


@interface TopicController : UITableViewController <SPQuestionControllerDelegate>

@property id<TopicControllerDelegate> delegate;

- (IBAction)cancelRevision:(UIStoryboardSegue *)segue;

@end
