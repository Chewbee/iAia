/*
	CSCHealthItem.h
	The interface definition of properties and methods for the CSCHealthItem object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
@class CSCArrayOfHealthAllocation;
@class CSCHealthEstimate;
@class CSCHealthInvoice;
@class CSCLiabilityRequest;
@class CSCPerson;
#import "CSCObject.h"
@class CSCObject;


@interface CSCHealthItem : CSCObject
{
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	NSDecimalNumber* _EffectiveExpenses;
	NSDecimalNumber* _Factor;
	NSString* _MedicalCode;
	NSString* _MedicalCodeDetail;
	NSString* _MedicalCodeLabel;
	NSDate* _MedicalStartDate;
	int _Units;
	NSMutableArray* _AllocationList;
	NSDecimalNumber* _Amount;
	NSString* _CodeModificateur1;
	NSString* _CodeModificateur2;
	NSString* _CodeModificateur3;
	NSString* _CodeModificateur4;
	NSString* _CodeParcours1;
	NSString* _CodeParcours2;
	NSString* _CodePrescription;
	NSString* _CodeRegroupement;
	NSString* _CodeTicketModerateur;
	NSString* _DisciplineMedicoTarifaire;
	NSString* _DomaineCourtSejour;
	CSCHealthEstimate* _Estimate;
	NSDecimalNumber* _InputExpenses;
	CSCHealthInvoice* _Invoice;
	CSCLiabilityRequest* _LiabilityRequest;
	NSString* _LibelleParcours1;
	NSString* _LibelleParcours2;
	NSString* _MedicalCodeReference;
	NSDate* _MedicalEndDate;
	NSString* _MedicalProvider;
	NSString* _ModeTraitement;
	NSString* _NationalAgreementType;
	NSDecimalNumber* _NationalRefundAmount;
	NSDecimalNumber* _NationalRefundBasis;
	NSDecimalNumber* _NationalRefundRate;
	NSString* _NatureAssurance;
	int _No;
	BOOL _OptionCoordination;
	CSCPerson* _Patient;
	int _PatientRank;
	NSString* _Payer;
	NSString* _PrescribingDoctor;
	NSDate* _PrescriptionDate;
	BOOL _Prevention;
	NSString* _QualificationDepense1;
	NSString* _QualificationDepense2;
	NSDecimalNumber* _ReferenceAmount;
	NSDecimalNumber* _SharedAmount;
	NSString* _Specialty;
	NSDecimalNumber* _TarifAutorite;
	NSDecimalNumber* _TarifConvention;
	NSDecimalNumber* _TarifTiers;
	NSString* _TransferCode;
	NSString* _TypePrestation;
	NSDecimalNumber* _UncoveredExpense;
	NSDecimalNumber* _UnitCost;
	int _ZoneTarif;
	
}
		
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) NSDecimalNumber* EffectiveExpenses;
	@property (strong, nonatomic) NSDecimalNumber* Factor;
	@property (strong, nonatomic) NSString* MedicalCode;
	@property (strong, nonatomic) NSString* MedicalCodeDetail;
	@property (strong, nonatomic) NSString* MedicalCodeLabel;
	@property (strong, nonatomic) NSDate* MedicalStartDate;
	@property int Units;
	@property (strong, nonatomic) NSMutableArray* AllocationList;
	@property (strong, nonatomic) NSDecimalNumber* Amount;
	@property (strong, nonatomic) NSString* CodeModificateur1;
	@property (strong, nonatomic) NSString* CodeModificateur2;
	@property (strong, nonatomic) NSString* CodeModificateur3;
	@property (strong, nonatomic) NSString* CodeModificateur4;
	@property (strong, nonatomic) NSString* CodeParcours1;
	@property (strong, nonatomic) NSString* CodeParcours2;
	@property (strong, nonatomic) NSString* CodePrescription;
	@property (strong, nonatomic) NSString* CodeRegroupement;
	@property (strong, nonatomic) NSString* CodeTicketModerateur;
	@property (strong, nonatomic) NSString* DisciplineMedicoTarifaire;
	@property (strong, nonatomic) NSString* DomaineCourtSejour;
	@property (strong, nonatomic) CSCHealthEstimate* Estimate;
	@property (strong, nonatomic) NSDecimalNumber* InputExpenses;
	@property (strong, nonatomic) CSCHealthInvoice* Invoice;
	@property (strong, nonatomic) CSCLiabilityRequest* LiabilityRequest;
	@property (strong, nonatomic) NSString* LibelleParcours1;
	@property (strong, nonatomic) NSString* LibelleParcours2;
	@property (strong, nonatomic) NSString* MedicalCodeReference;
	@property (strong, nonatomic) NSDate* MedicalEndDate;
	@property (strong, nonatomic) NSString* MedicalProvider;
	@property (strong, nonatomic) NSString* ModeTraitement;
	@property (strong, nonatomic) NSString* NationalAgreementType;
	@property (strong, nonatomic) NSDecimalNumber* NationalRefundAmount;
	@property (strong, nonatomic) NSDecimalNumber* NationalRefundBasis;
	@property (strong, nonatomic) NSDecimalNumber* NationalRefundRate;
	@property (strong, nonatomic) NSString* NatureAssurance;
	@property int No;
	@property BOOL OptionCoordination;
	@property (strong, nonatomic) CSCPerson* Patient;
	@property int PatientRank;
	@property (strong, nonatomic) NSString* Payer;
	@property (strong, nonatomic) NSString* PrescribingDoctor;
	@property (strong, nonatomic) NSDate* PrescriptionDate;
	@property BOOL Prevention;
	@property (strong, nonatomic) NSString* QualificationDepense1;
	@property (strong, nonatomic) NSString* QualificationDepense2;
	@property (strong, nonatomic) NSDecimalNumber* ReferenceAmount;
	@property (strong, nonatomic) NSDecimalNumber* SharedAmount;
	@property (strong, nonatomic) NSString* Specialty;
	@property (strong, nonatomic) NSDecimalNumber* TarifAutorite;
	@property (strong, nonatomic) NSDecimalNumber* TarifConvention;
	@property (strong, nonatomic) NSDecimalNumber* TarifTiers;
	@property (strong, nonatomic) NSString* TransferCode;
	@property (strong, nonatomic) NSString* TypePrestation;
	@property (strong, nonatomic) NSDecimalNumber* UncoveredExpense;
	@property (strong, nonatomic) NSDecimalNumber* UnitCost;
	@property int ZoneTarif;

	+ (CSCHealthItem*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
