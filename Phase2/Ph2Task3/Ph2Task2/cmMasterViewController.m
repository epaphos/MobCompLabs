//
//  cmMasterViewController.m
//  Ph2Task2
//
//  Created by Cyrill Averbeck on 2013-11-08.
//  Copyright (c) 2013 Cyrill Averbeck. All rights reserved.
//

#import "cmMasterViewController.h"
#import "cmChangeBookViewController.h"
#import "cmDetailViewController.h"
#import "SimpleBookManager.h"
#import "Book.h"
#import "cmChangeBookViewController.h"

@interface cmMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation cmMasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

//    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (cmDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}
- (void)viewDidAppear:(BOOL)animated
{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    //[_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.bookManager count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSUInteger index = indexPath.row;

    NSString *string = [[self.bookManager bookAtIndex:index] title];
    
    cell.textLabel.text = string;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        _bookManager = [SimpleBookManager sharedSimpleBookManager];
        [self.bookManager removeBook:[self.bookManager bookAtIndex:indexPath.row]];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        NSDate *object = _objects[indexPath.row];
        self.detailViewController.detailItem = object;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Book *object = [self.bookManager bookAtIndex:indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
        [[segue destinationViewController] setDetailViewBookManager:self.bookManager];
        NSLog(@"showDetail");
    } else if ([sender tag]==1){
        
        UINavigationController *navController = [segue destinationViewController];
        cmChangeBookViewController *changeBookController = [[navController viewControllers] objectAtIndex:0];

        [changeBookController setBook:[[SimpleBookManager sharedSimpleBookManager] createBook]]; //hand reference to new book to change book controller
        
    }
}

- (IBAction)unwindAddBookCancel:(UIStoryboardSegue*)sender {

    //Nothing needs to be done here
    NSLog(@"in undwindAddBookCancel");
    cmChangeBookViewController *controller = (cmChangeBookViewController *)sender.sourceViewController;
    if (controller != nil){
        [self.bookManager removeBook:controller.book];
        NSLog(@"%@", controller.book.title);
        [[self tableView]  reloadData];
    }


}

- (IBAction)unwindAddBookDone:(UIStoryboardSegue*)sender {
    
    NSLog(@"in undwindAddBookDone");
    cmChangeBookViewController *controller = (cmChangeBookViewController *)sender.sourceViewController;
    if (controller != nil){
//    [self.bookManager addBook:controller.book];
    NSLog(@"%@", controller.book.title);
    [[self tableView]  reloadData];
    }    

}

@end
