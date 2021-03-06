/*
	CSCHealthInsurer.h
	The implementation of properties and methods for the CSCHealthInsurer object.
	Generated by SudzC.com
*/
#import "CSCHealthInsurer.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
@implementation CSCHealthInsurer
	@synthesize DisplayId = _DisplayId;
	@synthesize EffectiveDate = _EffectiveDate;
	@synthesize EndDate = _EndDate;
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize StartDate = _StartDate;
	@synthesize Address = _Address;
	@synthesize DisplayId1 = _DisplayId1;
	@synthesize EMailAddress = _EMailAddress;
	@synthesize FaxNumber = _FaxNumber;
	@synthesize HeadquartersIdentifier = _HeadquartersIdentifier;
	@synthesize HeadquartersName = _HeadquartersName;
	@synthesize Identifier = _Identifier;
	@synthesize Name = _Name;
	@synthesize NumeroAMC = _NumeroAMC;
	@synthesize NumeroPrefectoral = _NumeroPrefectoral;
	@synthesize NumeroRNM = _NumeroRNM;
	@synthesize PhoneNumber = _PhoneNumber;

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
			self.Address = nil;
			self.DisplayId1 = nil;
			self.EMailAddress = nil;
			self.FaxNumber = nil;
			self.HeadquartersIdentifier = nil;
			self.HeadquartersName = nil;
			self.Identifier = nil;
			self.Name = nil;
			self.NumeroAMC = nil;
			self.NumeroPrefectoral = nil;
			self.NumeroRNM = nil;
			self.PhoneNumber = nil;

		}
		return self;
	}

	+ (CSCHealthInsurer*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCHealthInsurer*)[[CSCHealthInsurer alloc] initWithNode: node];
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
			self.Address = [Soap getNodeValue: node withName: @"Address"];
			self.DisplayId1 = [Soap getNodeValue: node withName: @"DisplayId1"];
			self.EMailAddress = [Soap getNodeValue: node withName: @"EMailAddress"];
			self.FaxNumber = [Soap getNodeValue: node withName: @"FaxNumber"];
			self.HeadquartersIdentifier = [Soap getNodeValue: node withName: @"HeadquartersIdentifier"];
			self.HeadquartersName = [Soap getNodeValue: node withName: @"HeadquartersName"];
			self.Identifier = [Soap getNodeValue: node withName: @"Identifier"];
			self.Name = [Soap getNodeValue: node withName: @"Name"];
			self.NumeroAMC = [Soap getNodeValue: node withName: @"NumeroAMC"];
			self.NumeroPrefectoral = [Soap getNodeValue: node withName: @"NumeroPrefectoral"];
			self.NumeroRNM = [Soap getNodeValue: node withName: @"NumeroRNM"];
			self.PhoneNumber = [Soap getNodeValue: node withName: @"PhoneNumber"];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"HealthInsurer"];
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
		if (self.Address != nil) [s appendFormat: @"<Address>%@</Address>", [[self.Address stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.DisplayId1 != nil) [s appendFormat: @"<DisplayId1>%@</DisplayId1>", [[self.DisplayId1 stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.EMailAddress != nil) [s appendFormat: @"<EMailAddress>%@</EMailAddress>", [[self.EMailAddress stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.FaxNumber != nil) [s appendFormat: @"<FaxNumber>%@</FaxNumber>", [[self.FaxNumber stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.HeadquartersIdentifier != nil) [s appendFormat: @"<HeadquartersIdentifier>%@</HeadquartersIdentifier>", [[self.HeadquartersIdentifier stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.HeadquartersName != nil) [s appendFormat: @"<HeadquartersName>%@</HeadquartersName>", [[self.HeadquartersName stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Identifier != nil) [s appendFormat: @"<Identifier>%@</Identifier>", [[self.Identifier stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Name != nil) [s appendFormat: @"<Name>%@</Name>", [[self.Name stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.NumeroAMC != nil) [s appendFormat: @"<NumeroAMC>%@</NumeroAMC>", [[self.NumeroAMC stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.NumeroPrefectoral != nil) [s appendFormat: @"<NumeroPrefectoral>%@</NumeroPrefectoral>", [[self.NumeroPrefectoral stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.NumeroRNM != nil) [s appendFormat: @"<NumeroRNM>%@</NumeroRNM>", [[self.NumeroRNM stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.PhoneNumber != nil) [s appendFormat: @"<PhoneNumber>%@</PhoneNumber>", [[self.PhoneNumber stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCHealthInsurer class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
