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

#pragma mark NSCoding and NSCopying

#define kAuthorKey @"author"
#define kTitleKey @"title"
#define kIsbnKey @"isbn"
#define kCourseKey @"course"
#define kPriceKey @"price"


-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.author = [aDecoder decodeObjectForKey:kAuthorKey];
        self.title = [aDecoder decodeObjectForKey:kTitleKey];
        self.isbn = [aDecoder decodeObjectForKey:kIsbnKey];
        self.course = [aDecoder decodeObjectForKey:kCourseKey];
        self.price = [aDecoder decodeIntForKey:kPriceKey];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.author forKey:kAuthorKey];
    [aCoder encodeObject:self.title forKey:kTitleKey];
    [aCoder encodeObject:self.isbn forKey:kIsbnKey];
    [aCoder encodeObject:self.course forKey:kCourseKey];
    [aCoder encodeInt:self.price forKey:kPriceKey];

}

@end
