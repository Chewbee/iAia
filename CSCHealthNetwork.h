/*
	CSCHealthNetwork.h
	The interface definition of properties and methods for the CSCHealthNetwork object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
@class CSCHealthFormula;
@class CSCNetworkActivation;
@class CSCNetworkActivation;
@class CSCNetworkActivation;
#import "CSCObject.h"
@class CSCObject;


@interface CSCHealthNetwork : CSCObject
{
	NSString* _DisplayId;
	NSDate* _EffectiveDate;
	NSDate* _EndDate;
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	NSDate* _StartDate;
	CSCHealthFormula* _CalculationFormula;
	NSString* _Category;
	CSCNetworkActivation* _DataEntryCase;
	NSString* _Identifier;
	NSString* _Label;
	CSCNetworkActivation* _NoemieCase;
	CSCNetworkActivation* _ThirdPartyCase;
	
}
		
	@property (strong, nonatomic) NSString* DisplayId;
	@property (strong, nonatomic) NSDate* EffectiveDate;
	@property (strong, nonatomic) NSDate* EndDate;
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) NSDate* StartDate;
	@property (strong, nonatomic) CSCHealthFormula* CalculationFormula;
	@property (strong, nonatomic) NSString* Category;
	@property (strong, nonatomic) CSCNetworkActivation* DataEntryCase;
	@property (strong, nonatomic) NSString* Identifier;
	@property (strong, nonatomic) NSString* Label;
	@property (strong, nonatomic) CSCNetworkActivation* NoemieCase;
	@property (strong, nonatomic) CSCNetworkActivation* ThirdPartyCase;

	+ (CSCHealthNetwork*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
