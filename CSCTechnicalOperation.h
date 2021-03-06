/*
	CSCTechnicalOperation.h
	The interface definition of properties and methods for the CSCTechnicalOperation object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
#import "CSCObject.h"
@class CSCObject;


@interface CSCTechnicalOperation : CSCObject
{
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	NSDecimalNumber* _Amount;
	NSDate* _Date;
	NSString* _Type;
	NSString* _TypeLabel;
	NSString* _User;
	
}
		
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) NSDecimalNumber* Amount;
	@property (strong, nonatomic) NSDate* Date;
	@property (strong, nonatomic) NSString* Type;
	@property (strong, nonatomic) NSString* TypeLabel;
	@property (strong, nonatomic) NSString* User;

	+ (CSCTechnicalOperation*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
