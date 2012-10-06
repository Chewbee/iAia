/*
	CSCLoanSettlement.h
	The implementation of properties and methods for the CSCLoanSettlement object.
	Generated by SudzC.com
*/
#import "CSCLoanSettlement.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
@implementation CSCLoanSettlement
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize AmountDue = _AmountDue;
	@synthesize Interests = _Interests;
	@synthesize LumpSum = _LumpSum;
	@synthesize PaymentType = _PaymentType;
	@synthesize Status = _Status;
	@synthesize Type = _Type;

	- (id) init
	{
		if(self = [super init])
		{
			self.Extension = nil; // [[CSCObject alloc] init];
			self.ExtensionList = [[NSMutableArray alloc] init];
			self.AmountDue = nil;
			self.Interests = nil;
			self.LumpSum = nil;
			self.PaymentType = nil;
			self.Status = nil;
			self.Type = nil;

		}
		return self;
	}

	+ (CSCLoanSettlement*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCLoanSettlement*)[[CSCLoanSettlement alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Extension = [[CSCObject createWithNode: [Soap getNode: node withName: @"Extension"]] object];
			self.ExtensionList = [[CSCArrayOfExtensionElement createWithNode: [Soap getNode: node withName: @"ExtensionList"]] object];
			self.AmountDue = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"AmountDue"]];
			self.Interests = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"Interests"]];
			self.LumpSum = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"LumpSum"]];
			self.PaymentType = [Soap getNodeValue: node withName: @"PaymentType"];
			self.Status = [Soap getNodeValue: node withName: @"Status"];
			self.Type = [Soap getNodeValue: node withName: @"Type"];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"LoanSettlement"];
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
		if (self.AmountDue != nil) [s appendFormat: @"<AmountDue>%@</AmountDue>", [NSString stringWithFormat: @"%@", self.AmountDue]];
		if (self.Interests != nil) [s appendFormat: @"<Interests>%@</Interests>", [NSString stringWithFormat: @"%@", self.Interests]];
		if (self.LumpSum != nil) [s appendFormat: @"<LumpSum>%@</LumpSum>", [NSString stringWithFormat: @"%@", self.LumpSum]];
		if (self.PaymentType != nil) [s appendFormat: @"<PaymentType>%@</PaymentType>", [[self.PaymentType stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Status != nil) [s appendFormat: @"<Status>%@</Status>", [[self.Status stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Type != nil) [s appendFormat: @"<Type>%@</Type>", [[self.Type stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCLoanSettlement class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
