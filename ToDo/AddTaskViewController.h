//
//  AddTaskViewController.h
//  ToDo
//
//  Created by Vasanthy Kolluri on 1/18/14.
//  Copyright (c) 2014 Vasanthy Kolluri. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddTaskViewController;

@protocol AddTaskViewControllerDelegate <NSObject>
-(void) addTaskViewController:(AddTaskViewController *)controller newTask:(NSString *)task;
@end

@interface AddTaskViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *taskText;

- (IBAction)DoneButton:(id)sender;
- (IBAction)CancelAction:(id)sender;
@property (nonatomic,weak) id <AddTaskViewControllerDelegate> delegate;

@end
