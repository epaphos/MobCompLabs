//
//  Book.m


#import "Book.h"


@implementation Book


- (id) init{

    return [self initWithAuthor:@"" title:@"" isbn:@"" course:@"" price:0];
}

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
    
    return [self initWithAuthor:@"Mike" title:@"Good Book" isbn:@"123456789" course:@"fubar" price:arc4random()%100];
}


@end
