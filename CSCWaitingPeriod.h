/*
	CSCWaitingPeriod.h
	The interface definition of properties and methods for the CSCWaitingPeriod object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
@class CSCHealthFormula;
#import "CSCObject.h"
@class CSCObject;


@interface CSCWaitingPeriod : CSCObject
{
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	BOOL _Abrogation;
	NSDate* _Date;
	CSCHealthFormula* _HealthFormula;
	
}
		
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property BOOL Abrogation;
	@property (strong, nonatomic) NSDate* Date;
	@property (strong, nonatomic) CSCHealthFormula* HealthFormula;

	+ (CSCWaitingPeriod*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
