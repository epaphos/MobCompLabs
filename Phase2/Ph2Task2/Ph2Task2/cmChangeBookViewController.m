//
//  AddPersonViewController.m
//  Persons
//
//  Created by Olof Torgersson on 2013-11-07.
//  Copyright (c) 2013 Olof Torgersson. All rights reserved.
//

#import "cmChangeBookViewController.h"
#import "Book.h"

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
    
    if ([sender tag]){ // save
        [self saveData];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.titleTextField || theTextField == self.authorTextField || theTextField == self.courseTextField || theTextField == self.isbnTextField || theTextField == self.priceTextField) {
        [theTextField resignFirstResponder];
    }
    return YES;
}

- (void)saveData {
    
    self.book.title = self.titleTextField.text;
    self.book.author = self.authorTextField.text;
    self.book.course = self.courseTextField.text;
    self.book.isbn = self.isbnTextField.text;
    self.book.price = [self.priceTextField.text integerValue];
    
    
    
}

- (IBAction)cancleAddBook:(id)sender {
}
@end
