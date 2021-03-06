/*
	CSCClaimReserve.h
	The interface definition of properties and methods for the CSCClaimReserve object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
#import "CSCObject.h"
@class CSCObject;


@interface CSCClaimReserve : CSCObject
{
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	NSDecimalNumber* _CompensationAmount;
	NSDecimalNumber* _FeesAmount;
	NSDecimalNumber* _RecourseAmount;
	
}
		
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) NSDecimalNumber* CompensationAmount;
	@property (strong, nonatomic) NSDecimalNumber* FeesAmount;
	@property (strong, nonatomic) NSDecimalNumber* RecourseAmount;

	+ (CSCClaimReserve*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
