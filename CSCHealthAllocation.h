/*
	CSCHealthAllocation.h
	The interface definition of properties and methods for the CSCHealthAllocation object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
@class CSCCoverage;
@class CSCHealthFormula;
#import "CSCObject.h"
@class CSCObject;


@interface CSCHealthAllocation : CSCObject
{
	NSString* _DisplayId;
	NSDate* _EffectiveDate;
	NSDate* _EndDate;
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	NSDate* _StartDate;
	NSDecimalNumber* _Amount;
	NSString* _ContractNumber;
	CSCCoverage* _Coverage;
	CSCHealthFormula* _Formula;
	int _RejectionCode;
	NSString* _RejectionCodeLabel;
	
}
		
	@property (strong, nonatomic) NSString* DisplayId;
	@property (strong, nonatomic) NSDate* EffectiveDate;
	@property (strong, nonatomic) NSDate* EndDate;
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) NSDate* StartDate;
	@property (strong, nonatomic) NSDecimalNumber* Amount;
	@property (strong, nonatomic) NSString* ContractNumber;
	@property (strong, nonatomic) CSCCoverage* Coverage;
	@property (strong, nonatomic) CSCHealthFormula* Formula;
	@property int RejectionCode;
	@property (strong, nonatomic) NSString* RejectionCodeLabel;

	+ (CSCHealthAllocation*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
