/*
	CSCUnitLinkedFund.h
	The implementation of properties and methods for the CSCUnitLinkedFund object.
	Generated by SudzC.com
*/
#import "CSCUnitLinkedFund.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
#import "CSCArrayOfUnitLinkedFundItem.h"
#import "CSCArrayOfPeriod.h"
@implementation CSCUnitLinkedFund
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize Category = _Category;
	@synthesize GrossCashValue = _GrossCashValue;
	@synthesize GrossUnits = _GrossUnits;
	@synthesize ISIN = _ISIN;
	@synthesize ItemList = _ItemList;
	@synthesize Label = _Label;
	@synthesize Liquidity = _Liquidity;
	@synthesize MarketingPeriodList = _MarketingPeriodList;
	@synthesize NetCashValue = _NetCashValue;
	@synthesize UnitValue = _UnitValue;
	@synthesize UnitValueDate = _UnitValueDate;
	@synthesize Units = _Units;

	- (id) init
	{
		if(self = [super init])
		{
			self.Extension = nil; // [[CSCObject alloc] init];
			self.ExtensionList = [[NSMutableArray alloc] init];
			self.Category = nil;
			self.GrossCashValue = nil;
			self.GrossUnits = nil;
			self.ISIN = nil;
			self.ItemList = [[NSMutableArray alloc] init];
			self.Label = nil;
			self.Liquidity = nil;
			self.MarketingPeriodList = [[NSMutableArray alloc] init];
			self.NetCashValue = nil;
			self.UnitValue = nil;
			self.UnitValueDate = nil;
			self.Units = nil;

		}
		return self;
	}

	+ (CSCUnitLinkedFund*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCUnitLinkedFund*)[[CSCUnitLinkedFund alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Extension = [[CSCObject createWithNode: [Soap getNode: node withName: @"Extension"]] object];
			self.ExtensionList = [[CSCArrayOfExtensionElement createWithNode: [Soap getNode: node withName: @"ExtensionList"]] object];
			self.Category = [Soap getNodeValue: node withName: @"Category"];
			self.GrossCashValue = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"GrossCashValue"]];
			self.GrossUnits = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"GrossUnits"]];
			self.ISIN = [Soap getNodeValue: node withName: @"ISIN"];
			self.ItemList = [[CSCArrayOfUnitLinkedFundItem createWithNode: [Soap getNode: node withName: @"ItemList"]] object];
			self.Label = [Soap getNodeValue: node withName: @"Label"];
			self.Liquidity = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"Liquidity"]];
			self.MarketingPeriodList = [[CSCArrayOfPeriod createWithNode: [Soap getNode: node withName: @"MarketingPeriodList"]] object];
			self.NetCashValue = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"NetCashValue"]];
			self.UnitValue = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"UnitValue"]];
			self.UnitValueDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"UnitValueDate"]];
			self.Units = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"Units"]];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"UnitLinkedFund"];
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
		if (self.Category != nil) [s appendFormat: @"<Category>%@</Category>", [[self.Category stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.GrossCashValue != nil) [s appendFormat: @"<GrossCashValue>%@</GrossCashValue>", [NSString stringWithFormat: @"%@", self.GrossCashValue]];
		if (self.GrossUnits != nil) [s appendFormat: @"<GrossUnits>%@</GrossUnits>", [NSString stringWithFormat: @"%@", self.GrossUnits]];
		if (self.ISIN != nil) [s appendFormat: @"<ISIN>%@</ISIN>", [[self.ISIN stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.ItemList != nil && self.ItemList.count > 0) {
			[s appendFormat: @"<ItemList>%@</ItemList>", [CSCArrayOfUnitLinkedFundItem serialize: self.ItemList]];
		} else {
			[s appendString: @"<ItemList/>"];
		}
		if (self.Label != nil) [s appendFormat: @"<Label>%@</Label>", [[self.Label stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Liquidity != nil) [s appendFormat: @"<Liquidity>%@</Liquidity>", [NSString stringWithFormat: @"%@", self.Liquidity]];
		if (self.MarketingPeriodList != nil && self.MarketingPeriodList.count > 0) {
			[s appendFormat: @"<MarketingPeriodList>%@</MarketingPeriodList>", [CSCArrayOfPeriod serialize: self.MarketingPeriodList]];
		} else {
			[s appendString: @"<MarketingPeriodList/>"];
		}
		if (self.NetCashValue != nil) [s appendFormat: @"<NetCashValue>%@</NetCashValue>", [NSString stringWithFormat: @"%@", self.NetCashValue]];
		if (self.UnitValue != nil) [s appendFormat: @"<UnitValue>%@</UnitValue>", [NSString stringWithFormat: @"%@", self.UnitValue]];
		if (self.UnitValueDate != nil) [s appendFormat: @"<UnitValueDate>%@</UnitValueDate>", [Soap getDateString: self.UnitValueDate]];
		if (self.Units != nil) [s appendFormat: @"<Units>%@</Units>", [NSString stringWithFormat: @"%@", self.Units]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCUnitLinkedFund class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
