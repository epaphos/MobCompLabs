//
//  ViewController.h
//  Summary
//
//  Created by MSchade on 08/11/13.
//  Copyright (c) 2013 MSchade. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleBookManager.h"

@interface cmSummaryViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *totalCostLable;
@property (weak, nonatomic) IBOutlet UILabel *maxPriceLable;
@property (weak, nonatomic) IBOutlet UILabel *minPriceLable;
@property (weak, nonatomic) IBOutlet UILabel *avPriceLable;
@property (weak, nonatomic) IBOutlet UILabel *countLable;
@property (strong, nonatomic) SimpleBookManager *bookMan;
/*
 
 Make this a poperty which is strong or the book manager will disappear
 
 */
@end
