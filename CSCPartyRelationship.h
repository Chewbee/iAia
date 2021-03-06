/*
	CSCPartyRelationship.h
	The interface definition of properties and methods for the CSCPartyRelationship object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
@class CSCOrganization;
@class CSCPerson;
@class CSCOrganization;
@class CSCPerson;
#import "CSCObject.h"
@class CSCObject;


@interface CSCPartyRelationship : CSCObject
{
	NSString* _DisplayId;
	NSDate* _EffectiveDate;
	NSDate* _EndDate;
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	NSDate* _StartDate;
	NSString* _Domain;
	NSString* _Identifier;
	NSString* _Label;
	CSCOrganization* _Organization;
	CSCPerson* _Person;
	CSCOrganization* _SourceOrganization;
	CSCPerson* _SourcePerson;
	NSString* _Type;
	
}
		
	@property (strong, nonatomic) NSString* DisplayId;
	@property (strong, nonatomic) NSDate* EffectiveDate;
	@property (strong, nonatomic) NSDate* EndDate;
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) NSDate* StartDate;
	@property (strong, nonatomic) NSString* Domain;
	@property (strong, nonatomic) NSString* Identifier;
	@property (strong, nonatomic) NSString* Label;
	@property (strong, nonatomic) CSCOrganization* Organization;
	@property (strong, nonatomic) CSCPerson* Person;
	@property (strong, nonatomic) CSCOrganization* SourceOrganization;
	@property (strong, nonatomic) CSCPerson* SourcePerson;
	@property (strong, nonatomic) NSString* Type;

	+ (CSCPartyRelationship*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
