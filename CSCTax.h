/*
	CSCTax.h
	The interface definition of properties and methods for the CSCTax object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
#import "CSCObject.h"
@class CSCObject;


@interface CSCTax : CSCObject
{
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	NSDecimalNumber* _Amount;
	BOOL _Applicable;
	NSDecimalNumber* _Basis;
	NSString* _Identifier;
	NSDecimalNumber* _Rate;
	
}
		
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) NSDecimalNumber* Amount;
	@property BOOL Applicable;
	@property (strong, nonatomic) NSDecimalNumber* Basis;
	@property (strong, nonatomic) NSString* Identifier;
	@property (strong, nonatomic) NSDecimalNumber* Rate;

	+ (CSCTax*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
