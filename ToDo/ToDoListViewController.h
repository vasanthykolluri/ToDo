//
//  ToDoListViewController.h
//  ToDo
//
//  Created by Vasanthy Kolluri on 1/18/14.
//  Copyright (c) 2014 Vasanthy Kolluri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddTaskViewController.h"

@interface ToDoListViewController : UITableViewController <AddTaskViewControllerDelegate>

- (IBAction)EditButtonPressed:(id)sender;


@end
