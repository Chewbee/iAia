/*
	CSCRegistration.h
	The implementation of properties and methods for the CSCRegistration object.
	Generated by SudzC.com
*/
#import "CSCRegistration.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
@implementation CSCRegistration
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize ActivityDescription = _ActivityDescription;
	@synthesize BusinessCode = _BusinessCode;
	@synthesize CountryCode = _CountryCode;
	@synthesize EndDate = _EndDate;
	@synthesize NumeroRM = _NumeroRM;
	@synthesize NumeroSIREN = _NumeroSIREN;
	@synthesize NumeroSIRET = _NumeroSIRET;
	@synthesize OrganizationNumber = _OrganizationNumber;
	@synthesize VATNumber = _VATNumber;

	- (id) init
	{
		if(self = [super init])
		{
			self.Extension = nil; // [[CSCObject alloc] init];
			self.ExtensionList = [[NSMutableArray alloc] init];
			self.ActivityDescription = nil;
			self.BusinessCode = nil;
			self.CountryCode = nil;
			self.EndDate = nil;
			self.NumeroRM = nil;
			self.NumeroSIREN = nil;
			self.NumeroSIRET = nil;
			self.OrganizationNumber = nil;
			self.VATNumber = nil;

		}
		return self;
	}

	+ (CSCRegistration*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCRegistration*)[[CSCRegistration alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Extension = [[CSCObject createWithNode: [Soap getNode: node withName: @"Extension"]] object];
			self.ExtensionList = [[CSCArrayOfExtensionElement createWithNode: [Soap getNode: node withName: @"ExtensionList"]] object];
			self.ActivityDescription = [Soap getNodeValue: node withName: @"ActivityDescription"];
			self.BusinessCode = [Soap getNodeValue: node withName: @"BusinessCode"];
			self.CountryCode = [Soap getNodeValue: node withName: @"CountryCode"];
			self.EndDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"EndDate"]];
			self.NumeroRM = [Soap getNodeValue: node withName: @"NumeroRM"];
			self.NumeroSIREN = [Soap getNodeValue: node withName: @"NumeroSIREN"];
			self.NumeroSIRET = [Soap getNodeValue: node withName: @"NumeroSIRET"];
			self.OrganizationNumber = [Soap getNodeValue: node withName: @"OrganizationNumber"];
			self.VATNumber = [Soap getNodeValue: node withName: @"VATNumber"];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"Registration"];
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
		if (self.ActivityDescription != nil) [s appendFormat: @"<ActivityDescription>%@</ActivityDescription>", [[self.ActivityDescription stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.BusinessCode != nil) [s appendFormat: @"<BusinessCode>%@</BusinessCode>", [[self.BusinessCode stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.CountryCode != nil) [s appendFormat: @"<CountryCode>%@</CountryCode>", [[self.CountryCode stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.EndDate != nil) [s appendFormat: @"<EndDate>%@</EndDate>", [Soap getDateString: self.EndDate]];
		if (self.NumeroRM != nil) [s appendFormat: @"<NumeroRM>%@</NumeroRM>", [[self.NumeroRM stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.NumeroSIREN != nil) [s appendFormat: @"<NumeroSIREN>%@</NumeroSIREN>", [[self.NumeroSIREN stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.NumeroSIRET != nil) [s appendFormat: @"<NumeroSIRET>%@</NumeroSIRET>", [[self.NumeroSIRET stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.OrganizationNumber != nil) [s appendFormat: @"<OrganizationNumber>%@</OrganizationNumber>", [[self.OrganizationNumber stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.VATNumber != nil) [s appendFormat: @"<VATNumber>%@</VATNumber>", [[self.VATNumber stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCRegistration class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
