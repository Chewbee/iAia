/*
	CSCFault.h
	The interface definition of properties and methods for the CSCFault object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
#import "CSCObject.h"
@class CSCObject;


@interface CSCFault : CSCObject
{
	NSString* _StackTrace;
	
}
		
	@property (strong, nonatomic) NSString* StackTrace;

	+ (CSCFault*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
