/*
	CSCHealthBenefit.h
	The interface definition of properties and methods for the CSCHealthBenefit object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
@class CSCHealthParty;
@class CSCArrayOfPartyRole;
@class CSCArrayOfHealthItem;
@class CSCArrayOfMessage;
@class CSCArrayOfSignedStatement;
#import "CSCObject.h"
@class CSCObject;


@interface CSCHealthBenefit : CSCObject
{
	NSString* _DisplayId;
	NSDate* _EffectiveDate;
	NSDate* _EndDate;
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	NSDate* _StartDate;
	NSString* _Identifier;
	CSCHealthParty* _Issuer;
	NSMutableArray* _RoleList;
	NSString* _CheckLevel;
	NSDate* _EditionDate;
	NSMutableArray* _ItemList;
	NSDate* _MedicalEndDate;
	NSDate* _MedicalStartDate;
	NSMutableArray* _MessageList;
	NSDate* _NotificationDate;
	NSDate* _PaymentDate;
	BOOL _RetourNoemie;
	NSMutableArray* _SignedStatementList;
	int _SignedStatements;
	NSDecimalNumber* _TotalAmount;
	NSString* _Type;
	
}
		
	@property (strong, nonatomic) NSString* DisplayId;
	@property (strong, nonatomic) NSDate* EffectiveDate;
	@property (strong, nonatomic) NSDate* EndDate;
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) NSDate* StartDate;
	@property (strong, nonatomic) NSString* Identifier;
	@property (strong, nonatomic) CSCHealthParty* Issuer;
	@property (strong, nonatomic) NSMutableArray* RoleList;
	@property (strong, nonatomic) NSString* CheckLevel;
	@property (strong, nonatomic) NSDate* EditionDate;
	@property (strong, nonatomic) NSMutableArray* ItemList;
	@property (strong, nonatomic) NSDate* MedicalEndDate;
	@property (strong, nonatomic) NSDate* MedicalStartDate;
	@property (strong, nonatomic) NSMutableArray* MessageList;
	@property (strong, nonatomic) NSDate* NotificationDate;
	@property (strong, nonatomic) NSDate* PaymentDate;
	@property BOOL RetourNoemie;
	@property (strong, nonatomic) NSMutableArray* SignedStatementList;
	@property int SignedStatements;
	@property (strong, nonatomic) NSDecimalNumber* TotalAmount;
	@property (strong, nonatomic) NSString* Type;

	+ (CSCHealthBenefit*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
