/*
	CSCHealthInsurer.h
	The interface definition of properties and methods for the CSCHealthInsurer object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
#import "CSCObject.h"
@class CSCObject;


@interface CSCHealthInsurer : CSCObject
{
	NSString* _DisplayId;
	NSDate* _EffectiveDate;
	NSDate* _EndDate;
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	NSDate* _StartDate;
	NSString* _Address;
	NSString* _DisplayId1;
	NSString* _EMailAddress;
	NSString* _FaxNumber;
	NSString* _HeadquartersIdentifier;
	NSString* _HeadquartersName;
	NSString* _Identifier;
	NSString* _Name;
	NSString* _NumeroAMC;
	NSString* _NumeroPrefectoral;
	NSString* _NumeroRNM;
	NSString* _PhoneNumber;
	
}
		
	@property (retain, nonatomic) NSString* DisplayId;
	@property (retain, nonatomic) NSDate* EffectiveDate;
	@property (retain, nonatomic) NSDate* EndDate;
	@property (retain, nonatomic) CSCObject* Extension;
	@property (retain, nonatomic) NSMutableArray* ExtensionList;
	@property (retain, nonatomic) NSDate* StartDate;
	@property (retain, nonatomic) NSString* Address;
	@property (retain, nonatomic) NSString* DisplayId1;
	@property (retain, nonatomic) NSString* EMailAddress;
	@property (retain, nonatomic) NSString* FaxNumber;
	@property (retain, nonatomic) NSString* HeadquartersIdentifier;
	@property (retain, nonatomic) NSString* HeadquartersName;
	@property (retain, nonatomic) NSString* Identifier;
	@property (retain, nonatomic) NSString* Name;
	@property (retain, nonatomic) NSString* NumeroAMC;
	@property (retain, nonatomic) NSString* NumeroPrefectoral;
	@property (retain, nonatomic) NSString* NumeroRNM;
	@property (retain, nonatomic) NSString* PhoneNumber;

	+ (CSCHealthInsurer*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end