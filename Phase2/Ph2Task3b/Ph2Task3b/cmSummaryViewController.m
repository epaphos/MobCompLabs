//
//  ViewController.m
//  Summary
//
//  Created by MSchade on 08/11/13.
//  Copyright (c) 2013 MSchade. All rights reserved.
//

#import "cmSummaryViewController.h"
#import "SimpleBookManager.h"

@interface cmSummaryViewController ()

- (void)displaySummary;


@end

@implementation cmSummaryViewController




- (void)viewDidLoad
{
    [super viewDidLoad];
    [self displaySummary];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated
{
    [self displaySummary];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) displaySummary{
    _bookMan = [SimpleBookManager sharedSimpleBookManager];
    self.totalCostLable.text = [NSString stringWithFormat:@"%d €", [self.bookMan totalCost]];
    self.maxPriceLable.text = [NSString stringWithFormat:@"%d €", [self.bookMan maxPrice]];
    self.minPriceLable.text = [NSString stringWithFormat:@"%d €", [self.bookMan minPrice]];
    self.avPriceLable.text = [NSString stringWithFormat:@"%.2f €", [self.bookMan meanPrice]];
    self.countLable.text = [NSString stringWithFormat:@"%d books in our library", [self.bookMan count]];
    
}

@end
