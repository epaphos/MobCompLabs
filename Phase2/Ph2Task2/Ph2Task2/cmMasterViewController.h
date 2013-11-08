//
//  cmMasterViewController.h
//  Ph2Task2
//
//  Created by Cyrill Averbeck on 2013-11-08.
//  Copyright (c) 2013 Cyrill Averbeck. All rights reserved.
//

#import <UIKit/UIKit.h>

@class cmDetailViewController;
@class SimpleBookManager;

@interface cmMasterViewController : UITableViewController

@property (strong, nonatomic) cmDetailViewController *detailViewController;
@property (strong, nonatomic) SimpleBookManager *bookManager;

@end
