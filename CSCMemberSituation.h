/*
	CSCMemberSituation.h
	The interface definition of properties and methods for the CSCMemberSituation object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
@class CSCArrayOfString;
@class CSCArrayOfString;
@class CSCArrayOfString;
@class CSCArrayOfString;
@class CSCOrganization;
@class CSCArrayOfPersonalIncome;
@class CSCInsuredGroup;
@class CSCPerson;
#import "CSCObject.h"
@class CSCObject;


@interface CSCMemberSituation : CSCObject
{
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	NSString* _Categorie;
	NSString* _CategorieLabel;
	NSString* _Classement;
	NSString* _ClassementLabel;
	NSString* _CollectiveAgreement;
	NSString* _CollectiveAgreementLabel;
	NSMutableArray* _DisagreementLabelList;
	NSMutableArray* _DisagreementList;
	NSMutableArray* _EmployeeStatusLabelList;
	NSMutableArray* _EmployeeStatusList;
	CSCOrganization* _Employer;
	NSString* _EmploymentContract;
	NSString* _EmploymentContractLabel;
	NSDate* _EndDate;
	NSString* _EndMotive;
	NSString* _EndMotiveLabel;
	NSString* _HealthOption;
	NSString* _HealthRatingOption;
	NSDate* _HiringDate;
	NSMutableArray* _IncomeList;
	CSCInsuredGroup* _InsuredGroup;
	NSString* _JobPosition;
	NSString* _JobPositionLabel;
	BOOL _MultipleEmployers;
	BOOL _MultipleOccupations;
	CSCPerson* _Person;
	NSString* _ProfessionCode;
	NSString* _ProfessionLabel;
	NSString* _RegistrationNumber;
	NSString* _RiskProtectionOption;
	int _SalaryGrading;
	NSDate* _StartDate;
	NSString* _StartMotive;
	NSString* _StartMotiveLabel;
	NSString* _Status;
	NSString* _StatutCategoriel;
	NSString* _StatutCategorielLabel;
	NSString* _StatutProfessionnel;
	NSString* _StatutProfessionnelLabel;
	NSString* _WorkingTime;
	NSString* _WorkingTimeLabel;
	NSDecimalNumber* _WorkingTimeRate;
	
}
		
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) NSString* Categorie;
	@property (strong, nonatomic) NSString* CategorieLabel;
	@property (strong, nonatomic) NSString* Classement;
	@property (strong, nonatomic) NSString* ClassementLabel;
	@property (strong, nonatomic) NSString* CollectiveAgreement;
	@property (strong, nonatomic) NSString* CollectiveAgreementLabel;
	@property (strong, nonatomic) NSMutableArray* DisagreementLabelList;
	@property (strong, nonatomic) NSMutableArray* DisagreementList;
	@property (strong, nonatomic) NSMutableArray* EmployeeStatusLabelList;
	@property (strong, nonatomic) NSMutableArray* EmployeeStatusList;
	@property (strong, nonatomic) CSCOrganization* Employer;
	@property (strong, nonatomic) NSString* EmploymentContract;
	@property (strong, nonatomic) NSString* EmploymentContractLabel;
	@property (strong, nonatomic) NSDate* EndDate;
	@property (strong, nonatomic) NSString* EndMotive;
	@property (strong, nonatomic) NSString* EndMotiveLabel;
	@property (strong, nonatomic) NSString* HealthOption;
	@property (strong, nonatomic) NSString* HealthRatingOption;
	@property (strong, nonatomic) NSDate* HiringDate;
	@property (strong, nonatomic) NSMutableArray* IncomeList;
	@property (strong, nonatomic) CSCInsuredGroup* InsuredGroup;
	@property (strong, nonatomic) NSString* JobPosition;
	@property (strong, nonatomic) NSString* JobPositionLabel;
	@property BOOL MultipleEmployers;
	@property BOOL MultipleOccupations;
	@property (strong, nonatomic) CSCPerson* Person;
	@property (strong, nonatomic) NSString* ProfessionCode;
	@property (strong, nonatomic) NSString* ProfessionLabel;
	@property (strong, nonatomic) NSString* RegistrationNumber;
	@property (strong, nonatomic) NSString* RiskProtectionOption;
	@property int SalaryGrading;
	@property (strong, nonatomic) NSDate* StartDate;
	@property (strong, nonatomic) NSString* StartMotive;
	@property (strong, nonatomic) NSString* StartMotiveLabel;
	@property (strong, nonatomic) NSString* Status;
	@property (strong, nonatomic) NSString* StatutCategoriel;
	@property (strong, nonatomic) NSString* StatutCategorielLabel;
	@property (strong, nonatomic) NSString* StatutProfessionnel;
	@property (strong, nonatomic) NSString* StatutProfessionnelLabel;
	@property (strong, nonatomic) NSString* WorkingTime;
	@property (strong, nonatomic) NSString* WorkingTimeLabel;
	@property (strong, nonatomic) NSDecimalNumber* WorkingTimeRate;

	+ (CSCMemberSituation*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
