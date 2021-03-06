/*
	CSCDamage.h
	The implementation of properties and methods for the CSCDamage object.
	Generated by SudzC.com
*/
#import "CSCDamage.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
@implementation CSCDamage
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize Code = _Code;
	@synthesize Label = _Label;
	@synthesize Parent = _Parent;
	@synthesize Text = _Text;

	- (id) init
	{
		if(self = [super init])
		{
			self.Extension = nil; // [[CSCObject alloc] init];
			self.ExtensionList = [[NSMutableArray alloc] init];
			self.Code = nil;
			self.Label = nil;
			self.Parent = nil;
			self.Text = nil;

		}
		return self;
	}

	+ (CSCDamage*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCDamage*)[[CSCDamage alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Extension = [[CSCObject createWithNode: [Soap getNode: node withName: @"Extension"]] object];
			self.ExtensionList = [[CSCArrayOfExtensionElement createWithNode: [Soap getNode: node withName: @"ExtensionList"]] object];
			self.Code = [Soap getNodeValue: node withName: @"Code"];
			self.Label = [Soap getNodeValue: node withName: @"Label"];
			self.Parent = [Soap getNodeValue: node withName: @"Parent"];
			self.Text = [Soap getNodeValue: node withName: @"Text"];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"Damage"];
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
		if (self.Code != nil) [s appendFormat: @"<Code>%@</Code>", [[self.Code stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Label != nil) [s appendFormat: @"<Label>%@</Label>", [[self.Label stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Parent != nil) [s appendFormat: @"<Parent>%@</Parent>", [[self.Parent stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Text != nil) [s appendFormat: @"<Text>%@</Text>", [[self.Text stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCDamage class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
