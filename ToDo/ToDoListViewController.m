//
//  ToDoListViewController.m
//  ToDo
//
//  Created by Vasanthy Kolluri on 1/18/14.
//  Copyright (c) 2014 Vasanthy Kolluri. All rights reserved.
//

#import "ToDoListViewController.h"
#import "TaskCell.h"

@interface ToDoListViewController ()

@property(nonatomic, strong) NSMutableArray *tasks;

@end

@implementation ToDoListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *saved_tasks = [userDefaults objectForKey:@"tasks_key"];
    
    if (saved_tasks == nil) {
        self.tasks = [[NSMutableArray alloc] init];
    }
    else {
        self.tasks = saved_tasks;
    }
    
    UINib *taskCellNib = [UINib nibWithNibName:@"TaskCell" bundle:nil];
    [self.tableView registerNib:taskCellNib forCellReuseIdentifier:@"TaskCell"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"TaskCell";
    TaskCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.TaskTextField.text = [self.tasks objectAtIndex:indexPath.row];
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        // Delete the row from the data source
        [self.tasks removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setObject:self.tasks forKey:@"tasks_key"];
        [userDefaults synchronize];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSString *movedTask = [self.tasks objectAtIndex:fromIndexPath.row];
    [self.tasks removeObjectAtIndex:fromIndexPath.row];
    [self.tasks insertObject:movedTask atIndex:toIndexPath.row];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.tasks forKey:@"tasks_key"];
    [userDefaults synchronize];
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}



#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"AddTaskSegue"]) {
        AddTaskViewController *atvc = (AddTaskViewController *)segue.destinationViewController;
        atvc.delegate = self;
    }
}

- (void)addTaskViewController:(AddTaskViewController *)controller newTask:(NSString *)task
{
    if (task.length == 0)
        return;
    
    [self.tasks addObject:task];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.tasks forKey:@"tasks_key"];
    [userDefaults synchronize];
}

- (IBAction)EditButtonPressed:(id)sender {

    if (self.tasks.count == 0 && !self.editing) {
        return;
    }
    
    self.editing = !self.editing;
    
    if (self.editing) {
       [sender setTitle:@"Done"];
    } else {
       [sender setTitle:@"Edit"];
    }
}
@end

