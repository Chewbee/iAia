/*
	CSCHealthEstimate.h
	The interface definition of properties and methods for the CSCHealthEstimate object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
@class CSCHealthParty;
@class CSCArrayOfPartyRole;
@class CSCArrayOfHealthItem;
#import "CSCObject.h"
@class CSCObject;


@interface CSCHealthEstimate : CSCObject
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
	NSMutableArray* _ItemList;
	NSDate* _NotificationDate;
	NSString* _Status;
	NSDecimalNumber* _TotalAmount;
	NSString* _Type;
	NSString* _User;
	
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
	@property (strong, nonatomic) NSMutableArray* ItemList;
	@property (strong, nonatomic) NSDate* NotificationDate;
	@property (strong, nonatomic) NSString* Status;
	@property (strong, nonatomic) NSDecimalNumber* TotalAmount;
	@property (strong, nonatomic) NSString* Type;
	@property (strong, nonatomic) NSString* User;

	+ (CSCHealthEstimate*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
