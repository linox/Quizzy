//
//  SPQuestionController.m
//  Quizzy
//
//  Created by Ben Anderson on 12/05/2014.
//  Copyright (c) 2014 Ben Anderson. All rights reserved.
//

#import "SPQuestionController.h"

#import "Storage.h"
#import "Statistics.h"


#define ANSWER_CELL_IDENTIFIER @"answer cell"


@interface SPQuestionController ()

@property NSInteger currentQuestionIndex;
@property NSInteger score;

- (void)nextQuestion;
- (void)saveCurrentQuestionWithSelection:(NSInteger)selected;

- (Question *)currentQuestion;

@end


@implementation SPQuestionController


- (void)viewDidLoad
{
	self.currentQuestionIndex = -1;
	self.score = 0;
	
	[self nextQuestion];
}



// ------------------------------------------------- //
#pragma mark - Question Management
// ------------------------------------------------- //


- (void)nextQuestion
{
	self.currentQuestionIndex++;
	
	if (self.currentQuestionIndex >= [[self.delegate currentTopic] numberOfQuestions]) {
		[self.delegate revisionComplete];
	} else {
		[self.currentQuestion generateQuestion];
		
		self.navigationItem.title = [NSString stringWithFormat:@"Question %@", @(self.currentQuestionIndex + 1).description];
		self.questionNumber.text = [NSString stringWithFormat:@"Question %@", @(self.currentQuestionIndex + 1).description];
		self.timeLabel.hidden = YES;
		self.scoreLabel.text = [NSString stringWithFormat:@"Score: %@", @(self.score).description];
		
		self.questionDescription.text = [self currentQuestion].displayText;
		
		[self.answersTableView reloadData];
	}
}


- (void)saveCurrentQuestionWithSelection:(NSInteger)selected
{
	BOOL correct = [[self currentQuestion] validateAnswer:selected];
	
	[[Statistics sharedStatistics] answerQuestion:[self currentQuestion].identifier
							  inTopic:[self.delegate currentTopic].identifier
							asCorrect:correct];
}



// ------------------------------------------------- //
#pragma mark - Delegate Methods
// ------------------------------------------------- //


- (Question *)currentQuestion
{
	return [[self.delegate currentTopic] questionAtIndex:self.currentQuestionIndex];
}



// ------------------------------------------------- //
#pragma mark - Table View Data Source Methods
// ------------------------------------------------- //


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self currentQuestion].numberOfAnswers;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ANSWER_CELL_IDENTIFIER forIndexPath:indexPath];
	cell.textLabel.text = [[self currentQuestion] answerAtIndex:indexPath.row];
	
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[self saveCurrentQuestionWithSelection:indexPath.row];
	[self nextQuestion];
}


@end
