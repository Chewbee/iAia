/*
	CSCBillItem.h
	The interface definition of properties and methods for the CSCBillItem object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
#import "CSCObject.h"
@class CSCObject;


@interface CSCBillItem : CSCObject
{
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	NSDecimalNumber* _Amount;
	NSDecimalNumber* _BasisAmount;
	NSDecimalNumber* _DepreciationFactor;
	NSString* _Description;
	NSDate* _EndDate;
	NSString* _Identifier;
	NSString* _Label;
	NSDecimalNumber* _PurchaseAmount;
	NSDate* _PurchaseDate;
	NSDecimalNumber* _Rate;
	NSDate* _StartDate;
	NSString* _Type;
	
}
		
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) NSDecimalNumber* Amount;
	@property (strong, nonatomic) NSDecimalNumber* BasisAmount;
	@property (strong, nonatomic) NSDecimalNumber* DepreciationFactor;
	@property (strong, nonatomic) NSString* Description;
	@property (strong, nonatomic) NSDate* EndDate;
	@property (strong, nonatomic) NSString* Identifier;
	@property (strong, nonatomic) NSString* Label;
	@property (strong, nonatomic) NSDecimalNumber* PurchaseAmount;
	@property (strong, nonatomic) NSDate* PurchaseDate;
	@property (strong, nonatomic) NSDecimalNumber* Rate;
	@property (strong, nonatomic) NSDate* StartDate;
	@property (strong, nonatomic) NSString* Type;

	+ (CSCBillItem*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
