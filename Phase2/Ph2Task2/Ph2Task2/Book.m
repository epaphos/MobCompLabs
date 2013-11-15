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

//The following code (hash and isEqual) tried to 
//- (NSUInteger)hash{
//    
//    return 0;
//}

//this is supposed to compare two books
//- (BOOL)isEqual:(id)otherObject{
//    
//    NSLog(@"isEqual");
//    NSLog(_author);
//    NSLog([(Book *)otherObject author]);
//    NSLog(_title);
//    NSLog([(Book *)otherObject title]);
//    NSLog(_isbn);
//    NSLog([(Book *)otherObject isbn]);
//    if ([_author isEqualToString:[(Book *)otherObject author]] && [_title isEqualToString:[(Book *)otherObject title]] && [_isbn isEqualToString:[(Book *)otherObject isbn]]){
//        NSLog(@"yes");
//    return YES;
//    }
////    if (self == otherObject) {
////        NSLog(@"yes");
////        return YES;
////    }
//    else {
//        NSLog(@"no");
//        return NO;
//    }
//}

- (id) initCoolBook{
//    self = [super init];
//    if(self) {
//     
//    }
    return [self initWithAuthor:@"Mike" title:@"Good Book" isbn:@"123456789" course:@"fubar" price:arc4random()%100];
}


@end
