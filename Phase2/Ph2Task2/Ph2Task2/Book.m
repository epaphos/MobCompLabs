//
//  Book.m
//  Task1
//
//  Created by MSchade on 03/11/13.
//  Copyright (c) 2013 MSchade. All rights reserved.
//

#import "Book.h"


@implementation Book


/*
 
 also implement init and call the one below with default values
 
 */
- (id)  initWithAuthor:(NSString *)theAuthor
                 title:(NSString *)theTitle
                  isbn:(NSString *)theIsbn
                course:(NSString *)theCourse
                 price:(NSInteger)thePrice
{
    
    self = [super init];
    if(self) {
        //Init Code:
        _author = [theAuthor copy];
        _title = [theTitle copy];
        _isbn = [theIsbn copy];
        _course = [theCourse copy];
        _price = thePrice;
        
    }
    
    return self;
}

- (id) initCoolBook{
//    self = [super init];
//    if(self) {
//     
//    }
    return [self initWithAuthor:@"Mike" title:@"Good Book" isbn:@"123456789" course:@"fubar" price:arc4random()%100];
}


@end
