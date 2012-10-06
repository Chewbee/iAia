/*
	CSCDeathTax.h
	The implementation of properties and methods for the CSCDeathTax object.
	Generated by SudzC.com
*/
#import "CSCDeathTax.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
#import "CSCPartyRole.h"
@implementation CSCDeathTax
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize Fraction990I = _Fraction990I;
	@synthesize Person = _Person;
	@synthesize TotalPrimes757B = _TotalPrimes757B;
	@synthesize TotalPrimes990I = _TotalPrimes990I;

	- (id) init
	{
		if(self = [super init])
		{
			self.Extension = nil; // [[CSCObject alloc] init];
			self.ExtensionList = [[NSMutableArray alloc] init];
			self.Fraction990I = nil;
			self.Person = nil; // [[CSCPartyRole alloc] init];
			self.TotalPrimes757B = nil;
			self.TotalPrimes990I = nil;

		}
		return self;
	}

	+ (CSCDeathTax*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCDeathTax*)[[CSCDeathTax alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Extension = [[CSCObject createWithNode: [Soap getNode: node withName: @"Extension"]] object];
			self.ExtensionList = [[CSCArrayOfExtensionElement createWithNode: [Soap getNode: node withName: @"ExtensionList"]] object];
			self.Fraction990I = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"Fraction990I"]];
			self.Person = [[CSCPartyRole createWithNode: [Soap getNode: node withName: @"Person"]] object];
			self.TotalPrimes757B = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"TotalPrimes757B"]];
			self.TotalPrimes990I = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"TotalPrimes990I"]];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"DeathTax"];
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
		if (self.Fraction990I != nil) [s appendFormat: @"<Fraction990I>%@</Fraction990I>", [NSString stringWithFormat: @"%@", self.Fraction990I]];
		if (self.Person != nil) [s appendString: [self.Person serialize: @"Person"]];
		if (self.TotalPrimes757B != nil) [s appendFormat: @"<TotalPrimes757B>%@</TotalPrimes757B>", [NSString stringWithFormat: @"%@", self.TotalPrimes757B]];
		if (self.TotalPrimes990I != nil) [s appendFormat: @"<TotalPrimes990I>%@</TotalPrimes990I>", [NSString stringWithFormat: @"%@", self.TotalPrimes990I]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCDeathTax class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
