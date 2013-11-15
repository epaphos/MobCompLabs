//
//  cmDetailViewController.m
//  Ph2Task2
//
//  Created by Cyrill Averbeck on 2013-11-08.
//  Copyright (c) 2013 Cyrill Averbeck. All rights reserved.
//
#import "Book.h"
#import "SimpleBookManager.h"
#import "cmDetailViewController.h"
#import "cmChangeBookViewController.h"
#import "cmMasterViewController.h"

@interface cmDetailViewController () {

}

@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)updateDetailItem;

@property (strong, nonatomic) Book *book;

@end

@implementation cmDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        _book = (Book *)newDetailItem;
        // Update the view.
        [self updateDetailItem];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)updateDetailItem
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.lblTitle.text = [self.book title];
        self.lblAuthor.text = [self.book author];
        self.lblCourse.text = [self.book course];
        self.lblISBN.text = [self.book isbn];
        self.lblPrice.text = [NSString stringWithFormat:@"%d $",[self.book price]];
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

- (void)viewDidAppear:(BOOL)animated
{
    [self updateDetailItem];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    UINavigationController *navController = [segue destinationViewController];
    cmChangeBookViewController *changeBookController = [[navController viewControllers] objectAtIndex:0];
    
    [changeBookController setBook:_book];
    
    //    NSLog(@"showDetail %@", [changeBookController description]);
}

- (IBAction)unwindAddBookCancel:(UIStoryboardSegue*)sender{
    //nothing to do here
}

- (IBAction)unwindAddBookDone:(UIStoryboardSegue*)sender{
    
    //    NSLog(@"in undwindAddBookDone");
    [self updateDetailItem];
    
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
