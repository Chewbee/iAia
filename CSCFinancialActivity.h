/*
	CSCFinancialActivity.h
	The interface definition of properties and methods for the CSCFinancialActivity object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
#import "CSCObject.h"
@class CSCObject;


@interface CSCFinancialActivity : CSCObject
{
	NSString* _DisplayId;
	NSDate* _EffectiveDate;
	NSDate* _EndDate;
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	NSDate* _StartDate;
	NSString* _OperationIdentifier1;
	NSString* _OperationIdentifier2;
	NSString* _OperationType1;
	NSString* _OperationType2;
	
}
		
	@property (strong, nonatomic) NSString* DisplayId;
	@property (strong, nonatomic) NSDate* EffectiveDate;
	@property (strong, nonatomic) NSDate* EndDate;
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) NSDate* StartDate;
	@property (strong, nonatomic) NSString* OperationIdentifier1;
	@property (strong, nonatomic) NSString* OperationIdentifier2;
	@property (strong, nonatomic) NSString* OperationType1;
	@property (strong, nonatomic) NSString* OperationType2;

	+ (CSCFinancialActivity*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
