/*
	CSCFinancialOption.h
	The implementation of properties and methods for the CSCFinancialOption object.
	Generated by SudzC.com
*/
#import "CSCFinancialOption.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
#import "CSCArrayOfFeesOverride.h"
#import "CSCArrayOfString.h"
#import "CSCArrayOfFundsAllocation.h"
@implementation CSCFinancialOption
	@synthesize DisplayId = _DisplayId;
	@synthesize EffectiveDate = _EffectiveDate;
	@synthesize EndDate = _EndDate;
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize StartDate = _StartDate;
	@synthesize FeesOverrideList = _FeesOverrideList;
	@synthesize Frequency = _Frequency;
	@synthesize FrequencyList = _FrequencyList;
	@synthesize FullType = _FullType;
	@synthesize FullTypeLabel = _FullTypeLabel;
	@synthesize FundsAllocationList = _FundsAllocationList;
	@synthesize Identifier = _Identifier;
	@synthesize Label = _Label;
	@synthesize NextDueDate = _NextDueDate;
	@synthesize Operations = _Operations;
	@synthesize PreviousDueDate = _PreviousDueDate;
	@synthesize SignatureDate = _SignatureDate;
	@synthesize SwitchStatus = _SwitchStatus;
	@synthesize Type = _Type;

	- (id) init
	{
		if(self = [super init])
		{
			self.DisplayId = nil;
			self.EffectiveDate = nil;
			self.EndDate = nil;
			self.Extension = nil; // [[CSCObject alloc] init];
			self.ExtensionList = [[NSMutableArray alloc] init];
			self.StartDate = nil;
			self.FeesOverrideList = [[NSMutableArray alloc] init];
			self.Frequency = nil;
			self.FrequencyList = [[NSMutableArray alloc] init];
			self.FullType = nil;
			self.FullTypeLabel = nil;
			self.FundsAllocationList = [[NSMutableArray alloc] init];
			self.Identifier = nil;
			self.Label = nil;
			self.NextDueDate = nil;
			self.PreviousDueDate = nil;
			self.SignatureDate = nil;
			self.SwitchStatus = nil;
			self.Type = nil;

		}
		return self;
	}

	+ (CSCFinancialOption*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCFinancialOption*)[[CSCFinancialOption alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.DisplayId = [Soap getNodeValue: node withName: @"DisplayId"];
			self.EffectiveDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"EffectiveDate"]];
			self.EndDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"EndDate"]];
			self.Extension = [[CSCObject createWithNode: [Soap getNode: node withName: @"Extension"]] object];
			self.ExtensionList = [[CSCArrayOfExtensionElement createWithNode: [Soap getNode: node withName: @"ExtensionList"]] object];
			self.StartDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"StartDate"]];
			self.FeesOverrideList = [[CSCArrayOfFeesOverride createWithNode: [Soap getNode: node withName: @"FeesOverrideList"]] object];
			self.Frequency = [Soap getNodeValue: node withName: @"Frequency"];
			self.FrequencyList = [[CSCArrayOfString createWithNode: [Soap getNode: node withName: @"FrequencyList"]] object];
			self.FullType = [Soap getNodeValue: node withName: @"FullType"];
			self.FullTypeLabel = [Soap getNodeValue: node withName: @"FullTypeLabel"];
			self.FundsAllocationList = [[CSCArrayOfFundsAllocation createWithNode: [Soap getNode: node withName: @"FundsAllocationList"]] object];
			self.Identifier = [Soap getNodeValue: node withName: @"Identifier"];
			self.Label = [Soap getNodeValue: node withName: @"Label"];
			self.NextDueDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"NextDueDate"]];
			self.Operations = [[Soap getNodeValue: node withName: @"Operations"] intValue];
			self.PreviousDueDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"PreviousDueDate"]];
			self.SignatureDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"SignatureDate"]];
			self.SwitchStatus = [Soap getNodeValue: node withName: @"SwitchStatus"];
			self.Type = [Soap getNodeValue: node withName: @"Type"];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"FinancialOption"];
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
		if (self.DisplayId != nil) [s appendFormat: @"<DisplayId>%@</DisplayId>", [[self.DisplayId stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.EffectiveDate != nil) [s appendFormat: @"<EffectiveDate>%@</EffectiveDate>", [Soap getDateString: self.EffectiveDate]];
		if (self.EndDate != nil) [s appendFormat: @"<EndDate>%@</EndDate>", [Soap getDateString: self.EndDate]];
		if (self.Extension != nil) [s appendString: [self.Extension serialize: @"Extension"]];
		if (self.ExtensionList != nil && self.ExtensionList.count > 0) {
			[s appendFormat: @"<ExtensionList>%@</ExtensionList>", [CSCArrayOfExtensionElement serialize: self.ExtensionList]];
		} else {
			[s appendString: @"<ExtensionList/>"];
		}
		if (self.StartDate != nil) [s appendFormat: @"<StartDate>%@</StartDate>", [Soap getDateString: self.StartDate]];
		if (self.FeesOverrideList != nil && self.FeesOverrideList.count > 0) {
			[s appendFormat: @"<FeesOverrideList>%@</FeesOverrideList>", [CSCArrayOfFeesOverride serialize: self.FeesOverrideList]];
		} else {
			[s appendString: @"<FeesOverrideList/>"];
		}
		if (self.Frequency != nil) [s appendFormat: @"<Frequency>%@</Frequency>", [[self.Frequency stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.FrequencyList != nil && self.FrequencyList.count > 0) {
			[s appendFormat: @"<FrequencyList>%@</FrequencyList>", [CSCArrayOfString serialize: self.FrequencyList]];
		} else {
			[s appendString: @"<FrequencyList/>"];
		}
		if (self.FullType != nil) [s appendFormat: @"<FullType>%@</FullType>", [[self.FullType stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.FullTypeLabel != nil) [s appendFormat: @"<FullTypeLabel>%@</FullTypeLabel>", [[self.FullTypeLabel stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.FundsAllocationList != nil && self.FundsAllocationList.count > 0) {
			[s appendFormat: @"<FundsAllocationList>%@</FundsAllocationList>", [CSCArrayOfFundsAllocation serialize: self.FundsAllocationList]];
		} else {
			[s appendString: @"<FundsAllocationList/>"];
		}
		if (self.Identifier != nil) [s appendFormat: @"<Identifier>%@</Identifier>", [[self.Identifier stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Label != nil) [s appendFormat: @"<Label>%@</Label>", [[self.Label stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.NextDueDate != nil) [s appendFormat: @"<NextDueDate>%@</NextDueDate>", [Soap getDateString: self.NextDueDate]];
		[s appendFormat: @"<Operations>%@</Operations>", [NSString stringWithFormat: @"%i", self.Operations]];
		if (self.PreviousDueDate != nil) [s appendFormat: @"<PreviousDueDate>%@</PreviousDueDate>", [Soap getDateString: self.PreviousDueDate]];
		if (self.SignatureDate != nil) [s appendFormat: @"<SignatureDate>%@</SignatureDate>", [Soap getDateString: self.SignatureDate]];
		if (self.SwitchStatus != nil) [s appendFormat: @"<SwitchStatus>%@</SwitchStatus>", [[self.SwitchStatus stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Type != nil) [s appendFormat: @"<Type>%@</Type>", [[self.Type stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCFinancialOption class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
