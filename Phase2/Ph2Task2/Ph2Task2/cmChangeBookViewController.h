//
//  AddPersonViewController.h
//  Persons
//
//  Created by Olof Torgersson on 2013-11-07.
//  Copyright (c) 2013 Olof Torgersson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Book;

@interface cmChangeBookViewController : UIViewController

@property (nonatomic, strong) Book *book;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;

@end
