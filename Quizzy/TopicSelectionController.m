//
//  TopicSelectionController.m
//  Quizzy
//
//  Created by Ben Anderson on 12/05/2014.
//  Copyright (c) 2014 Ben Anderson. All rights reserved.
//

#import "TopicSelectionController.h"

#import "Storage.h"


#define TOPIC_CELL_IDENTIFIER @"topic cell"
#define TOPIC_SEGUE_IDENTIFIER @"topic segue"


@interface TopicSelectionController ()

@property Topic *selectedTopic;

@end


@implementation TopicSelectionController


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:TOPIC_SEGUE_IDENTIFIER]) {
		TopicController *destination = (TopicController *) segue.destinationViewController;
		destination.delegate = self;
	}
}


- (Topic *)currentTopic
{
	return self.selectedTopic;
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
	return [[Storage sharedStorage] numberOfTopics];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TOPIC_CELL_IDENTIFIER forIndexPath:indexPath];
	Topic *topic = [[Storage sharedStorage] topicForIndexPath:indexPath];
	
	cell.textLabel.text = topic.name;
	
	return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	self.selectedTopic = [[Storage sharedStorage] topicForIndexPath:indexPath];
}


@end
