/*
	CSCError.h
	The interface definition of properties and methods for the CSCError object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCArrayOfString;
#import "CSCObject.h"
@class CSCObject;


@interface CSCError : CSCObject
{
	NSString* _Code;
	NSString* _Level;
	NSString* _Message;
	NSMutableArray* _MessageDetailList;
	NSString* _Source;
	
}
		
	@property (strong, nonatomic) NSString* Code;
	@property (strong, nonatomic) NSString* Level;
	@property (strong, nonatomic) NSString* Message;
	@property (strong, nonatomic) NSMutableArray* MessageDetailList;
	@property (strong, nonatomic) NSString* Source;

	+ (CSCError*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
