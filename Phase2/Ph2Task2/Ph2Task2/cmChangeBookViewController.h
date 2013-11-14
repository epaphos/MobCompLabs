//
//  AddPersonViewController.h
//  Persons
//
//  Created by Olof Torgersson on 2013-11-07.
//  Copyright (c) 2013 Olof Torgersson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Book;

@interface cmChangeBookViewController : UIViewController <UIAlertViewDelegate>

@property (nonatomic, strong) Book *book;
@property (strong, nonatomic) id prefilledFields;

@property (weak, nonatomic) IBOutlet UITextField *tfAuthor;
@property (weak, nonatomic) IBOutlet UITextField *tfTitle;
@property (weak, nonatomic) IBOutlet UITextField *tfCourse;
@property (weak, nonatomic) IBOutlet UITextField *tfISBN;
@property (weak, nonatomic) IBOutlet UITextField *tfPrice;


- (IBAction) showAlert;
- (void)prefilledFieldssss:(id)newDetailItem;


@end
