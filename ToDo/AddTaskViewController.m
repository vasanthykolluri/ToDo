//
//  AddTaskViewController.m
//  ToDo
//
//  Created by Vasanthy Kolluri on 1/18/14.
//  Copyright (c) 2014 Vasanthy Kolluri. All rights reserved.
//

#import "AddTaskViewController.h"


@interface AddTaskViewController ()
@end

@implementation AddTaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)DoneButton:(id)sender {
    NSLog(@"Done Action");
    NSString *task = (NSString *) self.taskText.text;
    [self.delegate addTaskViewController:self newTask:task];
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (IBAction)CancelAction:(id)sender {
    NSLog(@"Cancel Action");
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
