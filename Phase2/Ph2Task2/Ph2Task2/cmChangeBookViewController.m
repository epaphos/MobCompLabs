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
    NSLog(@"%d", [sender tag]);
    if ([sender tag]){ // save
        
        [self saveData];
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
    
    Book *book = [[Book alloc]init];
    self.book = book;
    self.book.title = self.tfTitle.text;
    
//    NSLog(self.tfTitle.text);
    NSLog(@"self.book.title");
    NSLog(self.book.title);
    self.book.price = [self.tfPrice.text integerValue];
    self.book.author = self.tfAuthor.text;
    self.book.course = self.tfCourse.text;
    self.book.isbn = self.tfISBN.text;
    
    

    
    
    
}

- (IBAction)cancleAddBook:(id)sender {
}
@end