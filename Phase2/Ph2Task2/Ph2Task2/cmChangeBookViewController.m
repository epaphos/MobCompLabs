//
//  AddPersonViewController.m
//  Persons
//
//  Created by Olof Torgersson on 2013-11-07.
//  Copyright (c) 2013 Olof Torgersson. All rights reserved.
//

#import "cmChangeBookViewController.h"
#import "Book.h"
#import "cmMasterViewController.h"
#import "cmAppDelegate.h"

@interface cmChangeBookViewController ()

- (void)saveData;

@end

@implementation cmChangeBookViewController

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    NSLog(@"Exit add");
    NSLog(@"%d", [sender tag]);
    if ([sender tag]){ // save
        
        [self saveData];
    }
}

- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
    NSLog(@"shouldPerformSegueWithIdentifier");
    NSLog(@"%d", [sender tag]);
    
    if ([self.tfTitle.text length]<2 && [sender tag]){

        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Title empty" message:@"You mus fill in a title" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancel",nil];
        UIAlertView *aV = [[UIAlertView alloc] init];
        
        [alertView show];
        NSLog(@"Alert Started");
        return NO;
    } else {
        return YES;
    }


}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {

    NSLog(@"shouldReturn");
    if (theTextField == self.tfTitle || theTextField == self.tfAuthor) {

        [theTextField resignFirstResponder];
    }
    return YES;
}

- (void)saveData {
    

    NSLog(@"saveDataInChangeController");
    
//    if ([self.tfTitle.text length]<2){
//
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"An alert" message:@"The message" delegate:self cancelButtonTitle:@"Cancel title" otherButtonTitles:@"OK", @"Second",nil];
//        [alertView show];
//         NSLog(@"Alert Started");
        //[alertView release];
        
        //        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Title empty" message:@"You must fill in a title" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok",nil];
//        [alertView show];
//        
//    }
    Book *book = [[Book alloc]init];
    self.book = book;
    self.book.title = self.tfTitle.text;
    
//    NSLog(self.tfTitle.text);
    NSLog(@"self.book.title");
    NSLog(@"%@", self.book.title);
    self.book.price = [self.tfPrice.text integerValue];
    self.book.author = self.tfAuthor.text;
    self.book.course = self.tfCourse.text;
    self.book.isbn = self.tfISBN.text;
    [(UINavigationController *)self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"master"] animated:YES];
    
}

- (IBAction)cancleAddBook:(id)sender {
}

- (IBAction) showAlert {
   
    if ([self.tfTitle.text length]<2){
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Title empty" message:@"You mus fill in a title" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:@"Cancle",nil];
    [alertView show];
    NSLog(@"Alert Started");
    }
    else{
    NSLog(@"Save Data");
//    [self saveData];
//        [self performSegueWithIdentifier: @"SegueToScene1" sender: self];
    }
	
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Cancel"])
    {
         NSLog(@"Cancel");
        [self.navigationController pushViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"master"] animated:YES];
    }
}



- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
      NSLog(@" did Dismiss");
    if (buttonIndex == 0) {
        NSLog(@"Cancel Tapped.");
    }
    else if (buttonIndex == 1) {
        NSLog(@"OK Tapped. Hello World!");
    }
}
@end
