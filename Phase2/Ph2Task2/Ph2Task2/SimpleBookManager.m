//
//  SimpleBookManager.m
//  BookDetail
//
//  Created by MSchade on 08/11/13.
//  Copyright (c) 2013 MSchade. All rights reserved.
//

#import "SimpleBookManager.h"
#import "Book.h"

@implementation SimpleBookManager

NSMutableArray *_allBooks;
NSInteger curMinPrice;
NSInteger curMaxPrice;
NSInteger curTotalCost;


- (id)init {
    
    self = [super init];
    if (self) {
        
        _allBooks = [[NSMutableArray alloc] init];
        curMinPrice = 0;
        curMaxPrice = 0;
        curTotalCost = 0;
        
        
        
        //Book *testBook; testBook = [[Book alloc] init];
        
        for (int i = 0; i < 5; i++) {
            [self createBook];
            NSLog(@"%d", i);
        }
        
        
        
    }
    
    return self;
}


- (Book *)createBook {
    Book *book = [[Book alloc] initCoolBook];
    [_allBooks addObject:book];
    
    return book;
}

- (void)addBook:(Book *)b{
    [_allBooks addObject:b];
}

- (NSUInteger) count {
    return [_allBooks count];
}


- (NSArray *)allBooks {
    return (NSArray *)[_allBooks copy];
}

- (Book *)bookAtIndex:(NSUInteger)index{
    return [_allBooks objectAtIndex:index];
}



- (void)removeBook:(Book *)b{
    [_allBooks removeObject:b];
}

- (void)moveBookAtIndex:(NSUInteger)from toIndex:(NSUInteger)to{
    Book *book = [_allBooks objectAtIndex:from];
    [_allBooks removeObjectAtIndex:from];
    [_allBooks insertObject:book atIndex:to];
}
- (NSUInteger) minPrice {
    
    curMinPrice = [[_allBooks objectAtIndex:0] price];
    for (id book in _allBooks) {
        
        if ([book price] < curMinPrice) {
            
            curMinPrice = [book price];
        }
        
    }
    return curMinPrice;
}


- (NSUInteger) maxPrice {
    curMaxPrice = [[_allBooks objectAtIndex:0] price];
    
    for ( id book in _allBooks) {
        
        if ([book price] > curMaxPrice) {
            
            curMaxPrice = [book price];
        }
        
    }
    return curMaxPrice;
}

- (NSUInteger) totalCost {
    curTotalCost = 0;
    for (id book in _allBooks) {
        
        curTotalCost += [book price];
        
    }
    return curTotalCost;
}


- (CGFloat)meanPrice {
    CGFloat calc = (CGFloat)[self totalCost]/(CGFloat)[self count];
    return calc;
}

- (void)saveChanges{
}

@end