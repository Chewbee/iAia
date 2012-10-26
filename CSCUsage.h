/*
	CSCUsage.h
	The interface definition of properties and methods for the CSCUsage object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
@class CSCAutomobileUsage;
@class CSCBuildingUsage;
@class CSCDwellingUsage;
@class CSCTruckUsage;
#import "CSCObject.h"
@class CSCObject;


@interface CSCUsage : CSCObject
{
	NSString* _DisplayId;
	NSDate* _EffectiveDate;
	NSDate* _EndDate;
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	NSDate* _StartDate;
	CSCAutomobileUsage* _AutomobileUsage;
	CSCBuildingUsage* _BuildingUsage;
	NSString* _Code;
	CSCDwellingUsage* _DwellingUsage;
	NSString* _Label;
	CSCTruckUsage* _TruckUsage;
	
}
		
	@property (retain, nonatomic) NSString* DisplayId;
	@property (retain, nonatomic) NSDate* EffectiveDate;
	@property (retain, nonatomic) NSDate* EndDate;
	@property (retain, nonatomic) CSCObject* Extension;
	@property (retain, nonatomic) NSMutableArray* ExtensionList;
	@property (retain, nonatomic) NSDate* StartDate;
	@property (retain, nonatomic) CSCAutomobileUsage* AutomobileUsage;
	@property (retain, nonatomic) CSCBuildingUsage* BuildingUsage;
	@property (retain, nonatomic) NSString* Code;
	@property (retain, nonatomic) CSCDwellingUsage* DwellingUsage;
	@property (retain, nonatomic) NSString* Label;
	@property (retain, nonatomic) CSCTruckUsage* TruckUsage;

	+ (CSCUsage*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
