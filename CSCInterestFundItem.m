/*
	CSCInterestFundItem.h
	The implementation of properties and methods for the CSCInterestFundItem object.
	Generated by SudzC.com
*/
#import "CSCInterestFundItem.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
@implementation CSCInterestFundItem
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize ActualRate = _ActualRate;
	@synthesize ActualRateBasis = _ActualRateBasis;
	@synthesize DistributionRate = _DistributionRate;
	@synthesize EstimatedGrossValue = _EstimatedGrossValue;
	@synthesize EstimatedNetValue = _EstimatedNetValue;
	@synthesize EstimatedRate = _EstimatedRate;
	@synthesize EstimatedRateBasis = _EstimatedRateBasis;
	@synthesize GrossCashValue = _GrossCashValue;
	@synthesize MinimumGrossValue = _MinimumGrossValue;
	@synthesize MinimumNetValue = _MinimumNetValue;
	@synthesize MinimumRate = _MinimumRate;
	@synthesize MinimumRateBasis = _MinimumRateBasis;
	@synthesize NetCashValue = _NetCashValue;

	- (id) init
	{
		if(self = [super init])
		{
			self.Extension = nil; // [[CSCObject alloc] init];
			self.ExtensionList = [[NSMutableArray alloc] init];
			self.ActualRate = nil;
			self.ActualRateBasis = nil;
			self.DistributionRate = nil;
			self.EstimatedGrossValue = nil;
			self.EstimatedNetValue = nil;
			self.EstimatedRate = nil;
			self.EstimatedRateBasis = nil;
			self.GrossCashValue = nil;
			self.MinimumGrossValue = nil;
			self.MinimumNetValue = nil;
			self.MinimumRate = nil;
			self.MinimumRateBasis = nil;
			self.NetCashValue = nil;

		}
		return self;
	}

	+ (CSCInterestFundItem*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCInterestFundItem*)[[CSCInterestFundItem alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Extension = [[CSCObject createWithNode: [Soap getNode: node withName: @"Extension"]] object];
			self.ExtensionList = [[CSCArrayOfExtensionElement createWithNode: [Soap getNode: node withName: @"ExtensionList"]] object];
			self.ActualRate = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"ActualRate"]];
			self.ActualRateBasis = [Soap getNodeValue: node withName: @"ActualRateBasis"];
			self.DistributionRate = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"DistributionRate"]];
			self.EstimatedGrossValue = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"EstimatedGrossValue"]];
			self.EstimatedNetValue = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"EstimatedNetValue"]];
			self.EstimatedRate = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"EstimatedRate"]];
			self.EstimatedRateBasis = [Soap getNodeValue: node withName: @"EstimatedRateBasis"];
			self.GrossCashValue = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"GrossCashValue"]];
			self.MinimumGrossValue = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"MinimumGrossValue"]];
			self.MinimumNetValue = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"MinimumNetValue"]];
			self.MinimumRate = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"MinimumRate"]];
			self.MinimumRateBasis = [Soap getNodeValue: node withName: @"MinimumRateBasis"];
			self.NetCashValue = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"NetCashValue"]];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"InterestFundItem"];
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
		if (self.ActualRate != nil) [s appendFormat: @"<ActualRate>%@</ActualRate>", [NSString stringWithFormat: @"%@", self.ActualRate]];
		if (self.ActualRateBasis != nil) [s appendFormat: @"<ActualRateBasis>%@</ActualRateBasis>", [[self.ActualRateBasis stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.DistributionRate != nil) [s appendFormat: @"<DistributionRate>%@</DistributionRate>", [NSString stringWithFormat: @"%@", self.DistributionRate]];
		if (self.EstimatedGrossValue != nil) [s appendFormat: @"<EstimatedGrossValue>%@</EstimatedGrossValue>", [NSString stringWithFormat: @"%@", self.EstimatedGrossValue]];
		if (self.EstimatedNetValue != nil) [s appendFormat: @"<EstimatedNetValue>%@</EstimatedNetValue>", [NSString stringWithFormat: @"%@", self.EstimatedNetValue]];
		if (self.EstimatedRate != nil) [s appendFormat: @"<EstimatedRate>%@</EstimatedRate>", [NSString stringWithFormat: @"%@", self.EstimatedRate]];
		if (self.EstimatedRateBasis != nil) [s appendFormat: @"<EstimatedRateBasis>%@</EstimatedRateBasis>", [[self.EstimatedRateBasis stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.GrossCashValue != nil) [s appendFormat: @"<GrossCashValue>%@</GrossCashValue>", [NSString stringWithFormat: @"%@", self.GrossCashValue]];
		if (self.MinimumGrossValue != nil) [s appendFormat: @"<MinimumGrossValue>%@</MinimumGrossValue>", [NSString stringWithFormat: @"%@", self.MinimumGrossValue]];
		if (self.MinimumNetValue != nil) [s appendFormat: @"<MinimumNetValue>%@</MinimumNetValue>", [NSString stringWithFormat: @"%@", self.MinimumNetValue]];
		if (self.MinimumRate != nil) [s appendFormat: @"<MinimumRate>%@</MinimumRate>", [NSString stringWithFormat: @"%@", self.MinimumRate]];
		if (self.MinimumRateBasis != nil) [s appendFormat: @"<MinimumRateBasis>%@</MinimumRateBasis>", [[self.MinimumRateBasis stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.NetCashValue != nil) [s appendFormat: @"<NetCashValue>%@</NetCashValue>", [NSString stringWithFormat: @"%@", self.NetCashValue]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCInterestFundItem class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
