//
//  Book.h


#import <Foundation/Foundation.h>

@interface Book : NSObject {

}

@property (copy) NSString *author;
@property (copy) NSString *title;
@property (copy) NSString *isbn;
@property (copy) NSString *course;
@property (nonatomic, assign) NSInteger price;

-(id) initWithAuthor: (NSString*) author title: (NSString*) title isbn: (NSString*) isbn course: (NSString*) course price: (NSInteger) price;
-(id) initCoolBook;

@end
