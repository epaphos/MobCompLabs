//
//  cmMasterViewController.h
//  Ph2Task3
//
//  Created by Cyrill Averbeck on 2013-11-15.
//  Copyright (c) 2013 Cyrill Averbeck. All rights reserved.
//

#import <UIKit/UIKit.h>

@class cmDetailViewController;

@interface cmMasterViewController : UITableViewController

@property (strong, nonatomic) cmDetailViewController *detailViewController;

@end
