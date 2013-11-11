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

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *authorTextField;
@property (weak, nonatomic) IBOutlet UITextField *courseTextField;
@property (weak, nonatomic) IBOutlet UITextField *isbnTextField;
@property (weak, nonatomic) IBOutlet UITextField *priceTextField;




@end
