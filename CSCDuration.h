/*
	CSCDuration.h
	The interface definition of properties and methods for the CSCDuration object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
#import "CSCObject.h"
@class CSCObject;


@interface CSCDuration : CSCObject
{
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	int _RenewalDay;
	int _RenewalMonth;
	NSString* _RenewalTerm;
	NSString* _Type;
	NSString* _Unit;
	int _Value;
	
}
		
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property int RenewalDay;
	@property int RenewalMonth;
	@property (strong, nonatomic) NSString* RenewalTerm;
	@property (strong, nonatomic) NSString* Type;
	@property (strong, nonatomic) NSString* Unit;
	@property int Value;

	+ (CSCDuration*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
