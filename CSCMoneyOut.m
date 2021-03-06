/*
	CSCMoneyOut.h
	The implementation of properties and methods for the CSCMoneyOut object.
	Generated by SudzC.com
*/
#import "CSCMoneyOut.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
#import "CSCPostalAddress.h"
@implementation CSCMoneyOut
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize PaymentDate = _PaymentDate;
	@synthesize PaymentType = _PaymentType;
	@synthesize PaymentTypeLabel = _PaymentTypeLabel;
	@synthesize PostalAddress = _PostalAddress;
	@synthesize Status = _Status;

	- (id) init
	{
		if(self = [super init])
		{
			self.Extension = nil; // [[CSCObject alloc] init];
			self.ExtensionList = [[NSMutableArray alloc] init];
			self.PaymentDate = nil;
			self.PaymentType = nil;
			self.PaymentTypeLabel = nil;
			self.PostalAddress = nil; // [[CSCPostalAddress alloc] init];
			self.Status = nil;

		}
		return self;
	}

	+ (CSCMoneyOut*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCMoneyOut*)[[CSCMoneyOut alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Extension = [[CSCObject createWithNode: [Soap getNode: node withName: @"Extension"]] object];
			self.ExtensionList = [[CSCArrayOfExtensionElement createWithNode: [Soap getNode: node withName: @"ExtensionList"]] object];
			self.PaymentDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"PaymentDate"]];
			self.PaymentType = [Soap getNodeValue: node withName: @"PaymentType"];
			self.PaymentTypeLabel = [Soap getNodeValue: node withName: @"PaymentTypeLabel"];
			self.PostalAddress = [[CSCPostalAddress createWithNode: [Soap getNode: node withName: @"PostalAddress"]] object];
			self.Status = [Soap getNodeValue: node withName: @"Status"];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"MoneyOut"];
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
		if (self.PaymentDate != nil) [s appendFormat: @"<PaymentDate>%@</PaymentDate>", [Soap getDateString: self.PaymentDate]];
		if (self.PaymentType != nil) [s appendFormat: @"<PaymentType>%@</PaymentType>", [[self.PaymentType stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.PaymentTypeLabel != nil) [s appendFormat: @"<PaymentTypeLabel>%@</PaymentTypeLabel>", [[self.PaymentTypeLabel stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.PostalAddress != nil) [s appendString: [self.PostalAddress serialize: @"PostalAddress"]];
		if (self.Status != nil) [s appendFormat: @"<Status>%@</Status>", [[self.Status stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCMoneyOut class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
