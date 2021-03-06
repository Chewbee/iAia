/*
	CSCSettlementItem.h
	The interface definition of properties and methods for the CSCSettlementItem object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
#import "CSCObject.h"
@class CSCObject;


@interface CSCSettlementItem : CSCObject
{
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	NSDecimalNumber* _Amount;
	int _Denominator;
	NSString* _DistributionMethod;
	NSString* _DistributionMethodLabel;
	NSDate* _EndDate;
	NSString* _Frequency;
	NSString* _FrequencyLabel;
	NSString* _Identifier;
	NSString* _Label;
	int _Numerator;
	NSDecimalNumber* _Rate;
	NSDate* _StartDate;
	NSString* _Type;
	NSString* _TypeLabel;
	
}
		
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) NSDecimalNumber* Amount;
	@property int Denominator;
	@property (strong, nonatomic) NSString* DistributionMethod;
	@property (strong, nonatomic) NSString* DistributionMethodLabel;
	@property (strong, nonatomic) NSDate* EndDate;
	@property (strong, nonatomic) NSString* Frequency;
	@property (strong, nonatomic) NSString* FrequencyLabel;
	@property (strong, nonatomic) NSString* Identifier;
	@property (strong, nonatomic) NSString* Label;
	@property int Numerator;
	@property (strong, nonatomic) NSDecimalNumber* Rate;
	@property (strong, nonatomic) NSDate* StartDate;
	@property (strong, nonatomic) NSString* Type;
	@property (strong, nonatomic) NSString* TypeLabel;

	+ (CSCSettlementItem*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
