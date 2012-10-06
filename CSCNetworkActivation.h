/*
	CSCNetworkActivation.h
	The interface definition of properties and methods for the CSCNetworkActivation object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
@class CSCHealthFormula;
#import "CSCObject.h"
@class CSCObject;


@interface CSCNetworkActivation : CSCObject
{
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	CSCHealthFormula* _Formula;
	BOOL _Insured;
	BOOL _MemberCheck;
	BOOL _ThirdPartyPayer;
	
}
		
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) CSCHealthFormula* Formula;
	@property BOOL Insured;
	@property BOOL MemberCheck;
	@property BOOL ThirdPartyPayer;

	+ (CSCNetworkActivation*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
