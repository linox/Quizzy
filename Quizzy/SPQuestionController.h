//
//  SPQuestionController.h
//  Quizzy
//
//  Created by Ben Anderson on 12/05/2014.
//  Copyright (c) 2014 Ben Anderson. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Topic.h"
#import "Question.h"


@protocol SPQuestionControllerDelegate <NSObject>

- (Topic *)currentTopic;
- (void)revisionComplete;

@end


@interface SPQuestionController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property id<SPQuestionControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIProgressView *scoreProgressView;
@property (weak, nonatomic) IBOutlet UIProgressView *timeProgressView;

@property (weak, nonatomic) IBOutlet UILabel *questionNumber;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *questionDescription;
@property (weak, nonatomic) IBOutlet UITableView *answersTableView;

@end
