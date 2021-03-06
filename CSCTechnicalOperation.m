/*
	CSCTechnicalOperation.h
	The implementation of properties and methods for the CSCTechnicalOperation object.
	Generated by SudzC.com
*/
#import "CSCTechnicalOperation.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
@implementation CSCTechnicalOperation
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize Amount = _Amount;
	@synthesize Date = _Date;
	@synthesize Type = _Type;
	@synthesize TypeLabel = _TypeLabel;
	@synthesize User = _User;

	- (id) init
	{
		if(self = [super init])
		{
			self.Extension = nil; // [[CSCObject alloc] init];
			self.ExtensionList = [[NSMutableArray alloc] init];
			self.Amount = nil;
			self.Date = nil;
			self.Type = nil;
			self.TypeLabel = nil;
			self.User = nil;

		}
		return self;
	}

	+ (CSCTechnicalOperation*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCTechnicalOperation*)[[CSCTechnicalOperation alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Extension = [[CSCObject createWithNode: [Soap getNode: node withName: @"Extension"]] object];
			self.ExtensionList = [[CSCArrayOfExtensionElement createWithNode: [Soap getNode: node withName: @"ExtensionList"]] object];
			self.Amount = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"Amount"]];
			self.Date = [Soap dateFromString: [Soap getNodeValue: node withName: @"Date"]];
			self.Type = [Soap getNodeValue: node withName: @"Type"];
			self.TypeLabel = [Soap getNodeValue: node withName: @"TypeLabel"];
			self.User = [Soap getNodeValue: node withName: @"User"];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"TechnicalOperation"];
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
		if (self.Date != nil) [s appendFormat: @"<Date>%@</Date>", [Soap getDateString: self.Date]];
		if (self.Type != nil) [s appendFormat: @"<Type>%@</Type>", [[self.Type stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.TypeLabel != nil) [s appendFormat: @"<TypeLabel>%@</TypeLabel>", [[self.TypeLabel stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.User != nil) [s appendFormat: @"<User>%@</User>", [[self.User stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCTechnicalOperation class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
