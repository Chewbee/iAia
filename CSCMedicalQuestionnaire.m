/*
	CSCMedicalQuestionnaire.h
	The implementation of properties and methods for the CSCMedicalQuestionnaire object.
	Generated by SudzC.com
*/
#import "CSCMedicalQuestionnaire.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
#import "CSCArrayOfQuestionAnswer.h"
@implementation CSCMedicalQuestionnaire
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize AnswerSummary = _AnswerSummary;
	@synthesize Identifier = _Identifier;
	@synthesize QuestionAnswerList = _QuestionAnswerList;

	- (id) init
	{
		if(self = [super init])
		{
			self.Extension = nil; // [[CSCObject alloc] init];
			self.ExtensionList = [[NSMutableArray alloc] init];
			self.Identifier = nil;
			self.QuestionAnswerList = [[NSMutableArray alloc] init];

		}
		return self;
	}

	+ (CSCMedicalQuestionnaire*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCMedicalQuestionnaire*)[[CSCMedicalQuestionnaire alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Extension = [[CSCObject createWithNode: [Soap getNode: node withName: @"Extension"]] object];
			self.ExtensionList = [[CSCArrayOfExtensionElement createWithNode: [Soap getNode: node withName: @"ExtensionList"]] object];
			self.AnswerSummary = [[Soap getNodeValue: node withName: @"AnswerSummary"] boolValue];
			self.Identifier = [Soap getNodeValue: node withName: @"Identifier"];
			self.QuestionAnswerList = [[CSCArrayOfQuestionAnswer createWithNode: [Soap getNode: node withName: @"QuestionAnswerList"]] object];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"MedicalQuestionnaire"];
	}
  
	- (NSMutableString*) serialize: (NSString*) nodeName
	{
		NSMutableString* s = [NSMutableString string];
		[s appendFormat: @"<%@", nodeName];
		[s appendString: [self serializeAttributes]];
		[s appendString: @">"];
		[s appendString: [self serializeElements]];
		[s appendFormat: @"</%@>", nodeName];
		return s;
	}
	
	- (NSMutableString*) serializeElements
	{
		NSMutableString* s = [super serializeElements];
		if (self.Extension != nil) [s appendString: [self.Extension serialize: @"Extension"]];
		if (self.ExtensionList != nil && self.ExtensionList.count > 0) {
			[s appendFormat: @"<ExtensionList>%@</ExtensionList>", [CSCArrayOfExtensionElement serialize: self.ExtensionList]];
		} else {
			[s appendString: @"<ExtensionList/>"];
		}
		[s appendFormat: @"<AnswerSummary>%@</AnswerSummary>", (self.AnswerSummary)?@"true":@"false"];
		if (self.Identifier != nil) [s appendFormat: @"<Identifier>%@</Identifier>", [[self.Identifier stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.QuestionAnswerList != nil && self.QuestionAnswerList.count > 0) {
			[s appendFormat: @"<QuestionAnswerList>%@</QuestionAnswerList>", [CSCArrayOfQuestionAnswer serialize: self.QuestionAnswerList]];
		} else {
			[s appendString: @"<QuestionAnswerList/>"];
		}

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCMedicalQuestionnaire class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
