/*
	CSCHealthCoverageDetail.h
	The implementation of properties and methods for the CSCHealthCoverageDetail object.
	Generated by SudzC.com
*/
#import "CSCHealthCoverageDetail.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
#import "CSCArrayOfHealthFormula.h"
#import "CSCArrayOfPartyRole.h"
@implementation CSCHealthCoverageDetail
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize AccidentOption = _AccidentOption;
	@synthesize AccordNoemie = _AccordNoemie;
	@synthesize AssignmentMode = _AssignmentMode;
	@synthesize FormulaList = _FormulaList;
	@synthesize Level = _Level;
	@synthesize MaternityOption = _MaternityOption;
	@synthesize PayeeTitle = _PayeeTitle;
	@synthesize RoleList = _RoleList;

	- (id) init
	{
		if(self = [super init])
		{
			self.Extension = nil; // [[CSCObject alloc] init];
			self.ExtensionList = [[NSMutableArray alloc] init];
			self.AssignmentMode = nil;
			self.FormulaList = [[NSMutableArray alloc] init];
			self.Level = nil;
			self.PayeeTitle = nil;
			self.RoleList = [[NSMutableArray alloc] init];

		}
		return self;
	}

	+ (CSCHealthCoverageDetail*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCHealthCoverageDetail*)[[CSCHealthCoverageDetail alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Extension = [[CSCObject createWithNode: [Soap getNode: node withName: @"Extension"]] object];
			self.ExtensionList = [[CSCArrayOfExtensionElement createWithNode: [Soap getNode: node withName: @"ExtensionList"]] object];
			self.AccidentOption = [[Soap getNodeValue: node withName: @"AccidentOption"] boolValue];
			self.AccordNoemie = [[Soap getNodeValue: node withName: @"AccordNoemie"] boolValue];
			self.AssignmentMode = [Soap getNodeValue: node withName: @"AssignmentMode"];
			self.FormulaList = [[CSCArrayOfHealthFormula createWithNode: [Soap getNode: node withName: @"FormulaList"]] object];
			self.Level = [Soap getNodeValue: node withName: @"Level"];
			self.MaternityOption = [[Soap getNodeValue: node withName: @"MaternityOption"] boolValue];
			self.PayeeTitle = [Soap getNodeValue: node withName: @"PayeeTitle"];
			self.RoleList = [[CSCArrayOfPartyRole createWithNode: [Soap getNode: node withName: @"RoleList"]] object];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"HealthCoverageDetail"];
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
		[s appendFormat: @"<AccidentOption>%@</AccidentOption>", (self.AccidentOption)?@"true":@"false"];
		[s appendFormat: @"<AccordNoemie>%@</AccordNoemie>", (self.AccordNoemie)?@"true":@"false"];
		if (self.AssignmentMode != nil) [s appendFormat: @"<AssignmentMode>%@</AssignmentMode>", [[self.AssignmentMode stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.FormulaList != nil && self.FormulaList.count > 0) {
			[s appendFormat: @"<FormulaList>%@</FormulaList>", [CSCArrayOfHealthFormula serialize: self.FormulaList]];
		} else {
			[s appendString: @"<FormulaList/>"];
		}
		if (self.Level != nil) [s appendFormat: @"<Level>%@</Level>", [[self.Level stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<MaternityOption>%@</MaternityOption>", (self.MaternityOption)?@"true":@"false"];
		if (self.PayeeTitle != nil) [s appendFormat: @"<PayeeTitle>%@</PayeeTitle>", [[self.PayeeTitle stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.RoleList != nil && self.RoleList.count > 0) {
			[s appendFormat: @"<RoleList>%@</RoleList>", [CSCArrayOfPartyRole serialize: self.RoleList]];
		} else {
			[s appendString: @"<RoleList/>"];
		}

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCHealthCoverageDetail class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
