/*
	CSCLoanInstalment.h
	The implementation of properties and methods for the CSCLoanInstalment object.
	Generated by SudzC.com
*/
#import "CSCLoanInstalment.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
@implementation CSCLoanInstalment
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize Amount = _Amount;
	@synthesize Balance = _Balance;
	@synthesize DueDate = _DueDate;
	@synthesize Interest = _Interest;
	@synthesize No = _No;
	@synthesize Principal = _Principal;

	- (id) init
	{
		if(self = [super init])
		{
			self.Extension = nil; // [[CSCObject alloc] init];
			self.ExtensionList = [[NSMutableArray alloc] init];
			self.Amount = nil;
			self.Balance = nil;
			self.DueDate = nil;
			self.Interest = nil;
			self.Principal = nil;

		}
		return self;
	}

	+ (CSCLoanInstalment*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCLoanInstalment*)[[CSCLoanInstalment alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Extension = [[CSCObject createWithNode: [Soap getNode: node withName: @"Extension"]] object];
			self.ExtensionList = [[CSCArrayOfExtensionElement createWithNode: [Soap getNode: node withName: @"ExtensionList"]] object];
			self.Amount = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"Amount"]];
			self.Balance = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"Balance"]];
			self.DueDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"DueDate"]];
			self.Interest = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"Interest"]];
			self.No = [[Soap getNodeValue: node withName: @"No"] intValue];
			self.Principal = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"Principal"]];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"LoanInstalment"];
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
		if (self.Balance != nil) [s appendFormat: @"<Balance>%@</Balance>", [NSString stringWithFormat: @"%@", self.Balance]];
		if (self.DueDate != nil) [s appendFormat: @"<DueDate>%@</DueDate>", [Soap getDateString: self.DueDate]];
		if (self.Interest != nil) [s appendFormat: @"<Interest>%@</Interest>", [NSString stringWithFormat: @"%@", self.Interest]];
		[s appendFormat: @"<No>%@</No>", [NSString stringWithFormat: @"%i", self.No]];
		if (self.Principal != nil) [s appendFormat: @"<Principal>%@</Principal>", [NSString stringWithFormat: @"%@", self.Principal]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCLoanInstalment class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
