//
//  SimpleBookManager.h
//  BookDetail
//
//  Created by MSchade on 08/11/13.
//  Copyright (c) 2013 MSchade. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BookManagerProtocol.h"

@class book;
@interface SimpleBookManager : NSObject <BookManagerProtocol> {

}

- (void)addBook:(Book *)b;

@end
