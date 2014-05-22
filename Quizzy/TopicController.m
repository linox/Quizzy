//
//  TopicController.m
//  Quizzy
//
//  Created by Ben Anderson on 12/05/2014.
//  Copyright (c) 2014 Ben Anderson. All rights reserved.
//

#import "TopicController.h"

#import "SPQuestionController.h"


#define QUESTION_SEGUE_IDENTIFIER @"questions segue"


@implementation TopicController


- (void)viewDidLoad
{
	self.navigationItem.title = [self.delegate currentTopic].name;
}


- (IBAction)cancelRevision:(UIStoryboardSegue *)segue
{
	
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:QUESTION_SEGUE_IDENTIFIER]) {
		[[self.delegate currentTopic] generateQuestions];
		
		SPQuestionController *destination = (SPQuestionController *) ((UINavigationController *) segue.destinationViewController).topViewController;
		destination.delegate = self;
	}
}



// ------------------------------------------------- //
#pragma mark - Delegate Methods
// ------------------------------------------------- //


- (Topic *)currentTopic
{
	return [self.delegate currentTopic];
}


- (void)revisionComplete
{
	[self dismissViewControllerAnimated:YES completion:nil];
}


@end
