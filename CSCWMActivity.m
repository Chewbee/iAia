/*
	CSCWMActivity.h
	The implementation of properties and methods for the CSCWMActivity object.
	Generated by SudzC.com
*/
#import "CSCWMActivity.h"

#import "CSCArrayOfString.h"
@implementation CSCWMActivity
	@synthesize Cancellation = _Cancellation;
	@synthesize EffectiveDate = _EffectiveDate;
	@synthesize Identifier = _Identifier;
	@synthesize Key = _Key;
	@synthesize Label = _Label;
	@synthesize No = _No;
	@synthesize RequestDate = _RequestDate;
	@synthesize Status = _Status;
	@synthesize StatusLabel = _StatusLabel;
	@synthesize Type = _Type;
	@synthesize UpdateDate = _UpdateDate;
	@synthesize User = _User;
	@synthesize WorkqueueList = _WorkqueueList;

	- (id) init
	{
		if(self = [super init])
		{
			self.EffectiveDate = nil;
			self.Identifier = nil;
			self.Key = nil;
			self.Label = nil;
			self.RequestDate = nil;
			self.Status = nil;
			self.StatusLabel = nil;
			self.Type = nil;
			self.UpdateDate = nil;
			self.User = nil;
			self.WorkqueueList = [[NSMutableArray alloc] init];

		}
		return self;
	}

	+ (CSCWMActivity*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCWMActivity*)[[CSCWMActivity alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Cancellation = [[Soap getNodeValue: node withName: @"Cancellation"] boolValue];
			self.EffectiveDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"EffectiveDate"]];
			self.Identifier = [Soap getNodeValue: node withName: @"Identifier"];
			self.Key = [Soap getNodeValue: node withName: @"Key"];
			self.Label = [Soap getNodeValue: node withName: @"Label"];
			self.No = [[Soap getNodeValue: node withName: @"No"] intValue];
			self.RequestDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"RequestDate"]];
			self.Status = [Soap getNodeValue: node withName: @"Status"];
			self.StatusLabel = [Soap getNodeValue: node withName: @"StatusLabel"];
			self.Type = [Soap getNodeValue: node withName: @"Type"];
			self.UpdateDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"UpdateDate"]];
			self.User = [Soap getNodeValue: node withName: @"User"];
			self.WorkqueueList = [[CSCArrayOfString createWithNode: [Soap getNode: node withName: @"WorkqueueList"]] object];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"WMActivity"];
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
		[s appendFormat: @"<Cancellation>%@</Cancellation>", (self.Cancellation)?@"true":@"false"];
		if (self.EffectiveDate != nil) [s appendFormat: @"<EffectiveDate>%@</EffectiveDate>", [Soap getDateString: self.EffectiveDate]];
		if (self.Identifier != nil) [s appendFormat: @"<Identifier>%@</Identifier>", [[self.Identifier stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Key != nil) [s appendFormat: @"<Key>%@</Key>", [[self.Key stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Label != nil) [s appendFormat: @"<Label>%@</Label>", [[self.Label stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<No>%@</No>", [NSString stringWithFormat: @"%i", self.No]];
		if (self.RequestDate != nil) [s appendFormat: @"<RequestDate>%@</RequestDate>", [Soap getDateString: self.RequestDate]];
		if (self.Status != nil) [s appendFormat: @"<Status>%@</Status>", [[self.Status stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.StatusLabel != nil) [s appendFormat: @"<StatusLabel>%@</StatusLabel>", [[self.StatusLabel stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Type != nil) [s appendFormat: @"<Type>%@</Type>", [[self.Type stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.UpdateDate != nil) [s appendFormat: @"<UpdateDate>%@</UpdateDate>", [Soap getDateString: self.UpdateDate]];
		if (self.User != nil) [s appendFormat: @"<User>%@</User>", [[self.User stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.WorkqueueList != nil && self.WorkqueueList.count > 0) {
			[s appendFormat: @"<WorkqueueList>%@</WorkqueueList>", [CSCArrayOfString serialize: self.WorkqueueList]];
		} else {
			[s appendString: @"<WorkqueueList/>"];
		}

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCWMActivity class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
