/*
	CSCLoanRepayment.h
	The interface definition of properties and methods for the CSCLoanRepayment object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
#import "CSCObject.h"
@class CSCObject;


@interface CSCLoanRepayment : CSCObject
{
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	NSDecimalNumber* _AmountDue;
	NSDecimalNumber* _Interests;
	NSDecimalNumber* _LumpSum;
	NSString* _PaymentType;
	NSString* _Status;
	NSString* _Type;
	
}
		
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) NSDecimalNumber* AmountDue;
	@property (strong, nonatomic) NSDecimalNumber* Interests;
	@property (strong, nonatomic) NSDecimalNumber* LumpSum;
	@property (strong, nonatomic) NSString* PaymentType;
	@property (strong, nonatomic) NSString* Status;
	@property (strong, nonatomic) NSString* Type;

	+ (CSCLoanRepayment*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
