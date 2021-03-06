/*
	CSCMoneyOut.h
	The interface definition of properties and methods for the CSCMoneyOut object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
@class CSCPostalAddress;
#import "CSCObject.h"
@class CSCObject;


@interface CSCMoneyOut : CSCObject
{
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	NSDate* _PaymentDate;
	NSString* _PaymentType;
	NSString* _PaymentTypeLabel;
	CSCPostalAddress* _PostalAddress;
	NSString* _Status;
	
}
		
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) NSDate* PaymentDate;
	@property (strong, nonatomic) NSString* PaymentType;
	@property (strong, nonatomic) NSString* PaymentTypeLabel;
	@property (strong, nonatomic) CSCPostalAddress* PostalAddress;
	@property (strong, nonatomic) NSString* Status;

	+ (CSCMoneyOut*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
