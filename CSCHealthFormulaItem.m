/*
	CSCHealthFormulaItem.h
	The implementation of properties and methods for the CSCHealthFormulaItem object.
	Generated by SudzC.com
*/
#import "CSCHealthFormulaItem.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
#import "CSCArrayOfString.h"
@implementation CSCHealthFormulaItem
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize TextList = _TextList;
	@synthesize Type = _Type;

	- (id) init
	{
		if(self = [super init])
		{
			self.Extension = nil; // [[CSCObject alloc] init];
			self.ExtensionList = [[NSMutableArray alloc] init];
			self.TextList = [[NSMutableArray alloc] init];
			self.Type = nil;

		}
		return self;
	}

	+ (CSCHealthFormulaItem*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCHealthFormulaItem*)[[CSCHealthFormulaItem alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Extension = [[CSCObject createWithNode: [Soap getNode: node withName: @"Extension"]] object];
			self.ExtensionList = [[CSCArrayOfExtensionElement createWithNode: [Soap getNode: node withName: @"ExtensionList"]] object];
			self.TextList = [[CSCArrayOfString createWithNode: [Soap getNode: node withName: @"TextList"]] object];
			self.Type = [Soap getNodeValue: node withName: @"Type"];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"HealthFormulaItem"];
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
		if (self.TextList != nil && self.TextList.count > 0) {
			[s appendFormat: @"<TextList>%@</TextList>", [CSCArrayOfString serialize: self.TextList]];
		} else {
			[s appendString: @"<TextList/>"];
		}
		if (self.Type != nil) [s appendFormat: @"<Type>%@</Type>", [[self.Type stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCHealthFormulaItem class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
