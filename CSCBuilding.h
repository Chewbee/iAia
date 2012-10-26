/*
	CSCBuilding.h
	The interface definition of properties and methods for the CSCBuilding object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
@class CSCPostalAddress;
#import "CSCObject.h"
@class CSCObject;


@interface CSCBuilding : CSCObject
{
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	CSCPostalAddress* _PostalAddress;
	NSDecimalNumber* _SumInsured;
	NSString* _SumInsuredValuation;
	NSString* _SumInsuredValuationLabel;
	int _ConstructionYear;
	int _Floors;
	NSDecimalNumber* _InsuredFurnitureAmount;
	NSString* _LandParcel;
	NSString* _LandRegistry;
	NSDecimalNumber* _SurfaceArea;
	
}
		
	@property (retain, nonatomic) CSCObject* Extension;
	@property (retain, nonatomic) NSMutableArray* ExtensionList;
	@property (retain, nonatomic) CSCPostalAddress* PostalAddress;
	@property (retain, nonatomic) NSDecimalNumber* SumInsured;
	@property (retain, nonatomic) NSString* SumInsuredValuation;
	@property (retain, nonatomic) NSString* SumInsuredValuationLabel;
	@property int ConstructionYear;
	@property int Floors;
	@property (retain, nonatomic) NSDecimalNumber* InsuredFurnitureAmount;
	@property (retain, nonatomic) NSString* LandParcel;
	@property (retain, nonatomic) NSString* LandRegistry;
	@property (retain, nonatomic) NSDecimalNumber* SurfaceArea;

	+ (CSCBuilding*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
