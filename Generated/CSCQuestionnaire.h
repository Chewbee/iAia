/*
	CSCQuestionnaire.h
	The interface definition of properties and methods for the CSCQuestionnaire object.
	Generated by SudzC.com
*/

#import "Soap.h"
	
@class CSCObject;
@class CSCArrayOfExtensionElement;
@class CSCArrayOfQuestionAnswer;
#import "CSCObject.h"
@class CSCObject;


@interface CSCQuestionnaire : CSCObject
{
	CSCObject* _Extension;
	NSMutableArray* _ExtensionList;
	BOOL _AnswerSummary;
	NSString* _Identifier;
	NSMutableArray* _QuestionAnswerList;
	
}
		
	@property (retain, nonatomic) CSCObject* Extension;
	@property (retain, nonatomic) NSMutableArray* ExtensionList;
	@property BOOL AnswerSummary;
	@property (retain, nonatomic) NSString* Identifier;
	@property (retain, nonatomic) NSMutableArray* QuestionAnswerList;

	+ (CSCQuestionnaire*) createWithNode: (CXMLNode*) node;
	- (id) initWithNode: (CXMLNode*) node;
	- (NSMutableString*) serialize;
	- (NSMutableString*) serialize: (NSString*) nodeName;
	- (NSMutableString*) serializeAttributes;
	- (NSMutableString*) serializeElements;

@end
