/*
	CSCExtraPremiumDetail.h
	The implementation of properties and methods for the CSCExtraPremiumDetail object.
	Generated by SudzC.com
*/
#import "CSCExtraPremiumDetail.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
@implementation CSCExtraPremiumDetail
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize Amount = _Amount;
	@synthesize AmountOverride = _AmountOverride;
	@synthesize CalculationType = _CalculationType;
	@synthesize Decrease = _Decrease;
	@synthesize DecreaseMotive = _DecreaseMotive;
	@synthesize DerogationA = _DerogationA;
	@synthesize DerogationB = _DerogationB;
	@synthesize DerogationC = _DerogationC;
	@synthesize DerogationD = _DerogationD;
	@synthesize Duration = _Duration;
	@synthesize MajorationA = _MajorationA;
	@synthesize MajorationB = _MajorationB;
	@synthesize MajorationC = _MajorationC;
	@synthesize MajorationD = _MajorationD;
	@synthesize OverrideMotive = _OverrideMotive;

	- (id) init
	{
		if(self = [super init])
		{
			self.Extension = nil; // [[CSCObject alloc] init];
			self.ExtensionList = [[NSMutableArray alloc] init];
			self.Amount = nil;
			self.AmountOverride = nil;
			self.CalculationType = nil;
			self.Decrease = nil;
			self.DecreaseMotive = nil;
			self.DerogationA = nil;
			self.DerogationB = nil;
			self.DerogationC = nil;
			self.DerogationD = nil;
			self.MajorationA = nil;
			self.MajorationB = nil;
			self.MajorationC = nil;
			self.MajorationD = nil;
			self.OverrideMotive = nil;

		}
		return self;
	}

	+ (CSCExtraPremiumDetail*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCExtraPremiumDetail*)[[CSCExtraPremiumDetail alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Extension = [[CSCObject createWithNode: [Soap getNode: node withName: @"Extension"]] object];
			self.ExtensionList = [[CSCArrayOfExtensionElement createWithNode: [Soap getNode: node withName: @"ExtensionList"]] object];
			self.Amount = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"Amount"]];
			self.AmountOverride = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"AmountOverride"]];
			self.CalculationType = [Soap getNodeValue: node withName: @"CalculationType"];
			self.Decrease = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"Decrease"]];
			self.DecreaseMotive = [Soap getNodeValue: node withName: @"DecreaseMotive"];
			self.DerogationA = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"DerogationA"]];
			self.DerogationB = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"DerogationB"]];
			self.DerogationC = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"DerogationC"]];
			self.DerogationD = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"DerogationD"]];
			self.Duration = [[Soap getNodeValue: node withName: @"Duration"] intValue];
			self.MajorationA = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"MajorationA"]];
			self.MajorationB = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"MajorationB"]];
			self.MajorationC = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"MajorationC"]];
			self.MajorationD = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"MajorationD"]];
			self.OverrideMotive = [Soap getNodeValue: node withName: @"OverrideMotive"];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"ExtraPremiumDetail"];
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
		if (self.Amount != nil) [s appendFormat: @"<Amount>%@</Amount>", [NSString stringWithFormat: @"%@", self.Amount]];
		if (self.AmountOverride != nil) [s appendFormat: @"<AmountOverride>%@</AmountOverride>", [NSString stringWithFormat: @"%@", self.AmountOverride]];
		if (self.CalculationType != nil) [s appendFormat: @"<CalculationType>%@</CalculationType>", [[self.CalculationType stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Decrease != nil) [s appendFormat: @"<Decrease>%@</Decrease>", [NSString stringWithFormat: @"%@", self.Decrease]];
		if (self.DecreaseMotive != nil) [s appendFormat: @"<DecreaseMotive>%@</DecreaseMotive>", [[self.DecreaseMotive stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.DerogationA != nil) [s appendFormat: @"<DerogationA>%@</DerogationA>", [NSString stringWithFormat: @"%@", self.DerogationA]];
		if (self.DerogationB != nil) [s appendFormat: @"<DerogationB>%@</DerogationB>", [NSString stringWithFormat: @"%@", self.DerogationB]];
		if (self.DerogationC != nil) [s appendFormat: @"<DerogationC>%@</DerogationC>", [NSString stringWithFormat: @"%@", self.DerogationC]];
		if (self.DerogationD != nil) [s appendFormat: @"<DerogationD>%@</DerogationD>", [NSString stringWithFormat: @"%@", self.DerogationD]];
		[s appendFormat: @"<Duration>%@</Duration>", [NSString stringWithFormat: @"%i", self.Duration]];
		if (self.MajorationA != nil) [s appendFormat: @"<MajorationA>%@</MajorationA>", [NSString stringWithFormat: @"%@", self.MajorationA]];
		if (self.MajorationB != nil) [s appendFormat: @"<MajorationB>%@</MajorationB>", [NSString stringWithFormat: @"%@", self.MajorationB]];
		if (self.MajorationC != nil) [s appendFormat: @"<MajorationC>%@</MajorationC>", [NSString stringWithFormat: @"%@", self.MajorationC]];
		if (self.MajorationD != nil) [s appendFormat: @"<MajorationD>%@</MajorationD>", [NSString stringWithFormat: @"%@", self.MajorationD]];
		if (self.OverrideMotive != nil) [s appendFormat: @"<OverrideMotive>%@</OverrideMotive>", [[self.OverrideMotive stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCExtraPremiumDetail class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
