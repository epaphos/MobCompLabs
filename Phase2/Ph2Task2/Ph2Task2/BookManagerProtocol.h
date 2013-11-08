//
//  BookManagerProtocol.h
//  Task1
//
//  Created by MSchade on 02/11/13.
//  Copyright (c) 2013 MSchade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"


@class Book;
@protocol BookManagerProtocol <NSObject>

- (NSUInteger)count;

- (Book *)bookAtIndex:(NSUInteger)index;

- (Book *)createBook;
- (NSArray *)allBooks;
- (void)removeBook:(Book *)b;

- (void)moveBookAtIndex:(NSUInteger)from toIndex:(NSUInteger)to;

- (NSUInteger)minPrice;
- (NSUInteger)maxPrice;
- (CGFloat)meanPrice;

- (NSUInteger)totalCost;
- (void)saveChanges;

@end



