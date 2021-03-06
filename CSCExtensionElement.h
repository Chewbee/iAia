/*
	CSCExtensionElement.h
	The interface definition of properties and methods for the CSCExtensionElement object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCArrayOfExtensionElement;
#import "CSCObject.h"
@class CSCObject;


@interface CSCExtensionElement : CSCObject
{
	NSMutableArray* _ExtensionList;
	NSString* _Identifier;
	NSString* _Value;
	
}
		
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) NSString* Identifier;
	@property (strong, nonatomic) NSString* Value;

	+ (CSCExtensionElement*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
