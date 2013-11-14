//
//  cmDetailViewController.h
//  Ph2Task2
//
//  Created by Cyrill Averbeck on 2013-11-08.
//  Copyright (c) 2013 Cyrill Averbeck. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cmDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property NSInteger index;
@property (weak, nonatomic) IBOutlet UILabel *lblAuthor;
@property (weak, nonatomic) IBOutlet UILabel *lblCourse;
@property (weak, nonatomic) IBOutlet UILabel *lblISBN;
@property (weak, nonatomic) IBOutlet UILabel *lblPrice;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) SimpleBookManager *detailViewBookManager;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

- (IBAction)unwindAddBookCancel:(UIStoryboardSegue*)sender;
- (IBAction)unwindAddBookDone:(UIStoryboardSegue*)sender;

@end
