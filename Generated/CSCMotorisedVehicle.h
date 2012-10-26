/*
	CSCMotorisedVehicle.h
	The interface definition of properties and methods for the CSCMotorisedVehicle object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
@class CSCPostalAddress;
#import "CSCObject.h"
@class CSCObject;


@interface CSCMotorisedVehicle : CSCObject
{
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	CSCPostalAddress* _PostalAddress;
	NSDecimalNumber* _SumInsured;
	NSString* _SumInsuredValuation;
	NSString* _SumInsuredValuationLabel;
	int _Age;
	BOOL _AlarmSystem;
	BOOL _AntiTheftMarking;
	NSString* _AntiTheftSystem;
	NSString* _AntiTheftSystemLabel;
	NSString* _Color;
	BOOL _Damaged;
	NSDate* _FirstUseDate;
	NSString* _Make;
	NSString* _MakeLabel;
	NSString* _Model;
	NSString* _ModelLabel;
	int _ModelYear;
	NSString* _RegistrationCountry;
	NSString* _RegistrationDocumentNumber;
	NSString* _RegistrationNumber;
	NSString* _SerialNumber;
	BOOL _SumInsuredTax;
	NSString* _VehicleCategory;
	NSString* _VehicleCategoryLabel;
	NSString* _VehicleIdentificationNumber;
	int _Weight;
	int _CubicCapacity;
	BOOL _GearLockDevice;
	NSString* _MotorType;
	NSString* _MotorTypeLabel;
	NSDecimalNumber* _Power;
	int _SeatsPositions;
	NSDecimalNumber* _LadenWeight;
	int _MaximumSpeed;
	NSString* _Type;
	NSString* _TypeLabel;
	
}
		
	@property (retain, nonatomic) CSCObject* Extension;
	@property (retain, nonatomic) NSMutableArray* ExtensionList;
	@property (retain, nonatomic) CSCPostalAddress* PostalAddress;
	@property (retain, nonatomic) NSDecimalNumber* SumInsured;
	@property (retain, nonatomic) NSString* SumInsuredValuation;
	@property (retain, nonatomic) NSString* SumInsuredValuationLabel;
	@property int Age;
	@property BOOL AlarmSystem;
	@property BOOL AntiTheftMarking;
	@property (retain, nonatomic) NSString* AntiTheftSystem;
	@property (retain, nonatomic) NSString* AntiTheftSystemLabel;
	@property (retain, nonatomic) NSString* Color;
	@property BOOL Damaged;
	@property (retain, nonatomic) NSDate* FirstUseDate;
	@property (retain, nonatomic) NSString* Make;
	@property (retain, nonatomic) NSString* MakeLabel;
	@property (retain, nonatomic) NSString* Model;
	@property (retain, nonatomic) NSString* ModelLabel;
	@property int ModelYear;
	@property (retain, nonatomic) NSString* RegistrationCountry;
	@property (retain, nonatomic) NSString* RegistrationDocumentNumber;
	@property (retain, nonatomic) NSString* RegistrationNumber;
	@property (retain, nonatomic) NSString* SerialNumber;
	@property BOOL SumInsuredTax;
	@property (retain, nonatomic) NSString* VehicleCategory;
	@property (retain, nonatomic) NSString* VehicleCategoryLabel;
	@property (retain, nonatomic) NSString* VehicleIdentificationNumber;
	@property int Weight;
	@property int CubicCapacity;
	@property BOOL GearLockDevice;
	@property (retain, nonatomic) NSString* MotorType;
	@property (retain, nonatomic) NSString* MotorTypeLabel;
	@property (retain, nonatomic) NSDecimalNumber* Power;
	@property int SeatsPositions;
	@property (retain, nonatomic) NSDecimalNumber* LadenWeight;
	@property int MaximumSpeed;
	@property (retain, nonatomic) NSString* Type;
	@property (retain, nonatomic) NSString* TypeLabel;

	+ (CSCMotorisedVehicle*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
