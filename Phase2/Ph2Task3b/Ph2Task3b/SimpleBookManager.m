//
//  SimpleBookManager.m
//  Task1
//
//  Created by MSchade on 03/11/13.
//  Copyright (c) 2013 MSchade. All rights reserved.
//

#import "SimpleBookManager.h"
#import "Book.h"

@interface SimpleBookManager() {
    
    NSMutableArray *_allBooks;
    NSInteger curMinPrice;
    NSInteger curMaxPrice;
    NSInteger curTotalCost;
}

@end
@implementation SimpleBookManager


+ (SimpleBookManager *)sharedSimpleBookManager
{
    static SimpleBookManager *sharedManager;
    static dispatch_once_t once;
    
    dispatch_once(&once, ^{
        sharedManager = [[self alloc] init];
    });
    return sharedManager;
}



- (id)init {
    
    self = [super init];
    if (self) {
        
        _allBooks = [[NSMutableArray alloc] init];
        
        [self loadData];
        
        if ([_allBooks count]==0){
        for (int i = 0; i < 5; i++) {

            [self addBook:[[Book alloc] initCoolBook] ];
        }
        
        }
        
    }
    
    return self;
}


- (Book *)createBook {
    Book *book = [[Book alloc] init];
    
    NSLog(@"createBook %@", [_allBooks description]);
    [_allBooks addObject:book];
    
    return book;
}


- (NSUInteger) count {
    return [_allBooks count];
}

- (void) addBook:(Book *)b {
    [_allBooks addObject:b];

}
- (NSArray *)allBooks {
    return (NSArray *)[_allBooks copy];
}

- (Book *)bookAtIndex:(NSUInteger)index{
    return [_allBooks objectAtIndex:index];
}

- (void)removeBook:(Book *)b{
    NSLog(@"removeBook from index");
    NSLog([NSString stringWithFormat:@"%d",[_allBooks indexOfObject:b] ]);
//    for (id object in _allBooks)
//    {
//        if (b==)
//    }

    [_allBooks removeObject:b];

}
- (void)removeBookAtIndex:(NSUInteger)ind{
    [_allBooks removeObjectAtIndex:ind];
}
- (void)insertBook:(Book *)book atIndex:(NSUInteger)ind{
    [_allBooks insertObject:book atIndex:ind];
}
- (void)moveBookAtIndex:(NSUInteger)from toIndex:(NSUInteger)to{
    Book *book = [_allBooks objectAtIndex:from];
    [_allBooks removeObjectAtIndex:from];
    [_allBooks insertObject:book atIndex:to];
}

- (NSUInteger) minPrice {
    curMinPrice = 0;
    curMinPrice = [[_allBooks objectAtIndex:0] price];
    for (id book in _allBooks) {
        
        if ([book price] < curMinPrice) {
            
            curMinPrice = [book price];
        }
        
    }
    return curMinPrice;
}


- (NSUInteger) maxPrice {
    curMaxPrice = 0;
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

#define kFileName @"Books.data"

- (NSString *)pathInDocumentDirectory:(NSString *)fileName {
    
    NSArray *documentDirectories =  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *documentDirectory = [documentDirectories objectAtIndex:0];
    
    return [documentDirectory stringByAppendingPathComponent:fileName];
}

- (NSString *)bookStoreDataPath {
    
    return [self pathInDocumentDirectory:kFileName];
    
}

- (void)loadData {
    
    _allBooks = [NSKeyedUnarchiver unarchiveObjectWithFile:[self bookStoreDataPath]];
    
    if (!_allBooks) {
        
        // Means that data could not be loaded, which for instance would happen the first time
        _allBooks = [[NSMutableArray alloc] init];
    }
    _allBooks = [NSMutableArray arrayWithArray:_allBooks];
    
}

- (BOOL)saveChanges{
    return [NSKeyedArchiver archiveRootObject:self.allBooks toFile:[self bookStoreDataPath]];

}

@end

