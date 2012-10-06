/*
	CSCWriteOffAdjustment.h
	The interface definition of properties and methods for the CSCWriteOffAdjustment object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
#import "CSCObject.h"
@class CSCObject;


@interface CSCWriteOffAdjustment : CSCObject
{
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	
}
		
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;

	+ (CSCWriteOffAdjustment*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
