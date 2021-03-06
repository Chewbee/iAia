/*
	CSCAllocation.h
	The interface definition of properties and methods for the CSCAllocation object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
@class CSCCoverageFund;
#import "CSCObject.h"
@class CSCObject;


@interface CSCAllocation : CSCObject
{
	NSString* _DisplayId;
	NSDate* _EffectiveDate;
	NSDate* _EndDate;
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	NSDate* _StartDate;
	NSDecimalNumber* _Amount;
	CSCCoverageFund* _CoverageFund;
	NSDate* _ProjectionDate;
	NSDecimalNumber* _Rate;
	NSDecimalNumber* _Threshold;
	NSDecimalNumber* _Units;
	
}
		
	@property (strong, nonatomic) NSString* DisplayId;
	@property (strong, nonatomic) NSDate* EffectiveDate;
	@property (strong, nonatomic) NSDate* EndDate;
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) NSDate* StartDate;
	@property (strong, nonatomic) NSDecimalNumber* Amount;
	@property (strong, nonatomic) CSCCoverageFund* CoverageFund;
	@property (strong, nonatomic) NSDate* ProjectionDate;
	@property (strong, nonatomic) NSDecimalNumber* Rate;
	@property (strong, nonatomic) NSDecimalNumber* Threshold;
	@property (strong, nonatomic) NSDecimalNumber* Units;

	+ (CSCAllocation*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
