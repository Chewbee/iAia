/*
	CSCVehicleUsage.h
	The interface definition of properties and methods for the CSCVehicleUsage object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
#import "CSCObject.h"
@class CSCObject;


@interface CSCVehicleUsage : CSCObject
{
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	NSString* _Code;
	NSString* _Label;
	
}
		
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) NSString* Code;
	@property (strong, nonatomic) NSString* Label;

	+ (CSCVehicleUsage*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
