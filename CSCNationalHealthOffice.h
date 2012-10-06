/*
	CSCNationalHealthOffice.h
	The interface definition of properties and methods for the CSCNationalHealthOffice object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
@class CSCHealthAddressee;
@class CSCHealthAddressee;
@class CSCHealthAddressee;
@class CSCHealthAddressee;
@class CSCHealthAddressee;
@class CSCHealthAddressee;
@class CSCHealthAddressee;
@class CSCHealthAddressee;
#import "CSCObject.h"
@class CSCObject;


@interface CSCNationalHealthOffice : CSCObject
{
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	CSCHealthAddressee* _CmuA;
	CSCHealthAddressee* _CmuB;
	CSCHealthAddressee* _MutualisationA;
	CSCHealthAddressee* _MutualisationB;
	CSCHealthAddressee* _ProcedureA;
	CSCHealthAddressee* _ProcedureB;
	CSCHealthAddressee* _ReferentA;
	CSCHealthAddressee* _ReferentB;
	
}
		
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) CSCHealthAddressee* CmuA;
	@property (strong, nonatomic) CSCHealthAddressee* CmuB;
	@property (strong, nonatomic) CSCHealthAddressee* MutualisationA;
	@property (strong, nonatomic) CSCHealthAddressee* MutualisationB;
	@property (strong, nonatomic) CSCHealthAddressee* ProcedureA;
	@property (strong, nonatomic) CSCHealthAddressee* ProcedureB;
	@property (strong, nonatomic) CSCHealthAddressee* ReferentA;
	@property (strong, nonatomic) CSCHealthAddressee* ReferentB;

	+ (CSCNationalHealthOffice*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
