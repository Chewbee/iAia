/*
	CSCHealthFormula.h
	The interface definition of properties and methods for the CSCHealthFormula object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
@class CSCArrayOfHealthFormulaItem;
#import "CSCObject.h"
@class CSCObject;


@interface CSCHealthFormula : CSCObject
{
	NSString* _DisplayId;
	NSDate* _EffectiveDate;
	NSDate* _EndDate;
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	NSDate* _StartDate;
	NSString* _Identifier;
	NSMutableArray* _ItemList;
	NSString* _Label;
	
}
		
	@property (strong, nonatomic) NSString* DisplayId;
	@property (strong, nonatomic) NSDate* EffectiveDate;
	@property (strong, nonatomic) NSDate* EndDate;
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) NSDate* StartDate;
	@property (strong, nonatomic) NSString* Identifier;
	@property (strong, nonatomic) NSMutableArray* ItemList;
	@property (strong, nonatomic) NSString* Label;

	+ (CSCHealthFormula*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
