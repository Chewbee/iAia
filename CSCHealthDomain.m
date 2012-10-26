/*
	CSCHealthDomain.h
	The implementation of properties and methods for the CSCHealthDomain object.
	Generated by SudzC.com
*/
#import "CSCHealthDomain.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
@implementation CSCHealthDomain
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize CalculationRule = _CalculationRule;
	@synthesize Channel = _Channel;
	@synthesize Code = _Code;
	@synthesize FootnoteNumber = _FootnoteNumber;
	@synthesize Label = _Label;
	@synthesize WaitingPeriod = _WaitingPeriod;

	- (id) init
	{
		if(self = [super init])
		{
			self.Extension = nil; // [[CSCObject alloc] init];
			self.ExtensionList = [[NSMutableArray alloc] init];
			self.CalculationRule = nil;
			self.Channel = nil;
			self.Code = nil;
			self.Label = nil;

		}
		return self;
	}

	+ (CSCHealthDomain*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCHealthDomain*)[[CSCHealthDomain alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Extension = [[CSCObject createWithNode: [Soap getNode: node withName: @"Extension"]] object];
			self.ExtensionList = [[CSCArrayOfExtensionElement createWithNode: [Soap getNode: node withName: @"ExtensionList"]] object];
			self.CalculationRule = [Soap getNodeValue: node withName: @"CalculationRule"];
			self.Channel = [Soap getNodeValue: node withName: @"Channel"];
			self.Code = [Soap getNodeValue: node withName: @"Code"];
			self.FootnoteNumber = [[Soap getNodeValue: node withName: @"FootnoteNumber"] intValue];
			self.Label = [Soap getNodeValue: node withName: @"Label"];
			self.WaitingPeriod = [[Soap getNodeValue: node withName: @"WaitingPeriod"] intValue];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"HealthDomain"];
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
		if (self.CalculationRule != nil) [s appendFormat: @"<CalculationRule>%@</CalculationRule>", [[self.CalculationRule stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Channel != nil) [s appendFormat: @"<Channel>%@</Channel>", [[self.Channel stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Code != nil) [s appendFormat: @"<Code>%@</Code>", [[self.Code stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<FootnoteNumber>%@</FootnoteNumber>", [NSString stringWithFormat: @"%i", self.FootnoteNumber]];
		if (self.Label != nil) [s appendFormat: @"<Label>%@</Label>", [[self.Label stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<WaitingPeriod>%@</WaitingPeriod>", [NSString stringWithFormat: @"%i", self.WaitingPeriod]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCHealthDomain class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
