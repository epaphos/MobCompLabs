//
//  cmDetailViewController.m
//  Ph2Task2
//
//  Created by Cyrill Averbeck on 2013-11-08.
//  Copyright (c) 2013 Cyrill Averbeck. All rights reserved.
//

#import "cmDetailViewController.h"
#import "Book.h"
#import "cmChangeBookViewController.h"

@interface cmDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
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
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
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

- (IBAction)unwindAddBookCancel:(UIStoryboardSegue*)sender{
    //nothing here yet
}

- (IBAction)unwindAddBookDone:(UIStoryboardSegue*)sender{
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
//    if ([[segue identifier] isEqualToString:@"editBook"]) {

        Book *object = _book;
        [[segue destinationViewController] setPrefilledFields:_detailItem];
        NSLog(@"showDetail");
//    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
