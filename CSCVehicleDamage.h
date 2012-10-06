/*
	CSCVehicleDamage.h
	The interface definition of properties and methods for the CSCVehicleDamage object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
@class CSCInsuranceCertificate;
@class CSCArrayOfString;
@class CSCArrayOfString;
@class CSCArrayOfString;
@class CSCVehicleUsage;
@class CSCDriver;
@class CSCVehicleUsage;
@class CSCPerson;
@class CSCArrayOfString;
@class CSCArrayOfString;
#import "CSCObject.h"
@class CSCObject;


@interface CSCVehicleDamage : CSCObject
{
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	CSCInsuranceCertificate* _Certificate;
	NSMutableArray* _CircumstanceLabelList;
	NSMutableArray* _CircumstanceList;
	NSMutableArray* _DamageList;
	CSCVehicleUsage* _DeclaredUsage;
	CSCDriver* _Driver;
	CSCVehicleUsage* _EffectiveUsage;
	BOOL _IdentifiedDriver;
	NSString* _ImpactPoint;
	CSCPerson* _Owner;
	NSMutableArray* _Remark;
	NSMutableArray* _VisibleDamageList;
	
}
		
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) CSCInsuranceCertificate* Certificate;
	@property (strong, nonatomic) NSMutableArray* CircumstanceLabelList;
	@property (strong, nonatomic) NSMutableArray* CircumstanceList;
	@property (strong, nonatomic) NSMutableArray* DamageList;
	@property (strong, nonatomic) CSCVehicleUsage* DeclaredUsage;
	@property (strong, nonatomic) CSCDriver* Driver;
	@property (strong, nonatomic) CSCVehicleUsage* EffectiveUsage;
	@property BOOL IdentifiedDriver;
	@property (strong, nonatomic) NSString* ImpactPoint;
	@property (strong, nonatomic) CSCPerson* Owner;
	@property (strong, nonatomic) NSMutableArray* Remark;
	@property (strong, nonatomic) NSMutableArray* VisibleDamageList;

	+ (CSCVehicleDamage*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
