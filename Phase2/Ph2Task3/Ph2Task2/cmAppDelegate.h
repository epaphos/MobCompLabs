//
//  cmAppDelegate.h
//  Ph2Task2
//
//  Created by Cyrill Averbeck on 2013-11-08.
//  Copyright (c) 2013 Cyrill Averbeck. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SimpleBookManager;

@interface cmAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SimpleBookManager *bookManager;

@end
