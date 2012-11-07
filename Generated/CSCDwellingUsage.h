/*
	CSCDwellingUsage.h
	The interface definition of properties and methods for the CSCDwellingUsage object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
#import "CSCObject.h"
@class CSCObject;


@interface CSCDwellingUsage : CSCObject
{
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	NSString* _FloodArea;
	
}
		
	@property (retain, nonatomic) CSCObject* Extension;
	@property (retain, nonatomic) NSMutableArray* ExtensionList;
	@property (retain, nonatomic) NSString* FloodArea;

	+ (CSCDwellingUsage*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end