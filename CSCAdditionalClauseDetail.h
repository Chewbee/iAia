/*
	CSCAdditionalClauseDetail.h
	The interface definition of properties and methods for the CSCAdditionalClauseDetail object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
#import "CSCObject.h"
@class CSCObject;


@interface CSCAdditionalClauseDetail : CSCObject
{
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	NSString* _ClauseCode;
	NSString* _ClauseLabel;
	
}
		
	@property (strong, nonatomic) CSCObject* Extension;
	@property (strong, nonatomic) NSMutableArray* ExtensionList;
	@property (strong, nonatomic) NSString* ClauseCode;
	@property (strong, nonatomic) NSString* ClauseLabel;

	+ (CSCAdditionalClauseDetail*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
