/*
	CSCPersonOccupationDetail.h
	The implementation of properties and methods for the CSCPersonOccupationDetail object.
	Generated by SudzC.com
*/
#import "CSCPersonOccupationDetail.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
@implementation CSCPersonOccupationDetail
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize CurrencyCode = _CurrencyCode;
	@synthesize CurrencyLabel = _CurrencyLabel;
	@synthesize GrossSalary = _GrossSalary;
	@synthesize NetSalary = _NetSalary;
	@synthesize SalaryGrading = _SalaryGrading;

	- (id) init
	{
		if(self = [super init])
		{
			self.Extension = nil; // [[CSCObject alloc] init];
			self.ExtensionList = [[NSMutableArray alloc] init];
			self.CurrencyCode = nil;
			self.CurrencyLabel = nil;
			self.GrossSalary = nil;
			self.NetSalary = nil;

		}
		return self;
	}

	+ (CSCPersonOccupationDetail*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCPersonOccupationDetail*)[[CSCPersonOccupationDetail alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Extension = [[CSCObject createWithNode: [Soap getNode: node withName: @"Extension"]] object];
			self.ExtensionList = [[CSCArrayOfExtensionElement createWithNode: [Soap getNode: node withName: @"ExtensionList"]] object];
			self.CurrencyCode = [Soap getNodeValue: node withName: @"CurrencyCode"];
			self.CurrencyLabel = [Soap getNodeValue: node withName: @"CurrencyLabel"];
			self.GrossSalary = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"GrossSalary"]];
			self.NetSalary = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"NetSalary"]];
			self.SalaryGrading = [[Soap getNodeValue: node withName: @"SalaryGrading"] intValue];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"PersonOccupationDetail"];
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
		if (self.CurrencyCode != nil) [s appendFormat: @"<CurrencyCode>%@</CurrencyCode>", [[self.CurrencyCode stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.CurrencyLabel != nil) [s appendFormat: @"<CurrencyLabel>%@</CurrencyLabel>", [[self.CurrencyLabel stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.GrossSalary != nil) [s appendFormat: @"<GrossSalary>%@</GrossSalary>", [NSString stringWithFormat: @"%@", self.GrossSalary]];
		if (self.NetSalary != nil) [s appendFormat: @"<NetSalary>%@</NetSalary>", [NSString stringWithFormat: @"%@", self.NetSalary]];
		[s appendFormat: @"<SalaryGrading>%@</SalaryGrading>", [NSString stringWithFormat: @"%i", self.SalaryGrading]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCPersonOccupationDetail class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
