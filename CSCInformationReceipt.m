/*
	CSCInformationReceipt.h
	The implementation of properties and methods for the CSCInformationReceipt object.
	Generated by SudzC.com
*/
#import "CSCInformationReceipt.h"

#import "CSCObject.h"
#import "CSCArrayOfInformationRequest.h"
#import "CSCOrganization.h"
#import "CSCPerson.h"
#import "CSCOrganization.h"
#import "CSCPerson.h"
@implementation CSCInformationReceipt
	@synthesize BusinessObject = _BusinessObject;
	@synthesize Channel = _Channel;
	@synthesize ChannelLabel = _ChannelLabel;
	@synthesize EdmsIdentifier = _EdmsIdentifier;
	@synthesize EdmsType = _EdmsType;
	@synthesize Identifier = _Identifier;
	@synthesize InformationRequestList = _InformationRequestList;
	@synthesize Organization = _Organization;
	@synthesize Person = _Person;
	@synthesize ReceivedDate = _ReceivedDate;
	@synthesize ReceivedTime = _ReceivedTime;
	@synthesize SenderOrganization = _SenderOrganization;
	@synthesize SenderPerson = _SenderPerson;
	@synthesize Type = _Type;
	@synthesize TypeLabel = _TypeLabel;

	- (id) init
	{
		if(self = [super init])
		{
			self.BusinessObject = nil; // [[CSCObject alloc] init];
			self.Channel = nil;
			self.ChannelLabel = nil;
			self.EdmsIdentifier = nil;
			self.EdmsType = nil;
			self.Identifier = nil;
			self.InformationRequestList = [[NSMutableArray alloc] init];
			self.Organization = nil; // [[CSCOrganization alloc] init];
			self.Person = nil; // [[CSCPerson alloc] init];
			self.ReceivedDate = nil;
			self.ReceivedTime = nil;
			self.SenderOrganization = nil; // [[CSCOrganization alloc] init];
			self.SenderPerson = nil; // [[CSCPerson alloc] init];
			self.Type = nil;
			self.TypeLabel = nil;

		}
		return self;
	}

	+ (CSCInformationReceipt*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCInformationReceipt*)[[CSCInformationReceipt alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.BusinessObject = [[CSCObject createWithNode: [Soap getNode: node withName: @"BusinessObject"]] object];
			self.Channel = [Soap getNodeValue: node withName: @"Channel"];
			self.ChannelLabel = [Soap getNodeValue: node withName: @"ChannelLabel"];
			self.EdmsIdentifier = [Soap getNodeValue: node withName: @"EdmsIdentifier"];
			self.EdmsType = [Soap getNodeValue: node withName: @"EdmsType"];
			self.Identifier = [Soap getNodeValue: node withName: @"Identifier"];
			self.InformationRequestList = [[CSCArrayOfInformationRequest createWithNode: [Soap getNode: node withName: @"InformationRequestList"]] object];
			self.Organization = [[CSCOrganization createWithNode: [Soap getNode: node withName: @"Organization"]] object];
			self.Person = [[CSCPerson createWithNode: [Soap getNode: node withName: @"Person"]] object];
			self.ReceivedDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"ReceivedDate"]];
			self.ReceivedTime = [Soap dateFromString: [Soap getNodeValue: node withName: @"ReceivedTime"]];
			self.SenderOrganization = [[CSCOrganization createWithNode: [Soap getNode: node withName: @"SenderOrganization"]] object];
			self.SenderPerson = [[CSCPerson createWithNode: [Soap getNode: node withName: @"SenderPerson"]] object];
			self.Type = [Soap getNodeValue: node withName: @"Type"];
			self.TypeLabel = [Soap getNodeValue: node withName: @"TypeLabel"];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"InformationReceipt"];
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
		if (self.BusinessObject != nil) [s appendString: [self.BusinessObject serialize: @"BusinessObject"]];
		if (self.Channel != nil) [s appendFormat: @"<Channel>%@</Channel>", [[self.Channel stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.ChannelLabel != nil) [s appendFormat: @"<ChannelLabel>%@</ChannelLabel>", [[self.ChannelLabel stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.EdmsIdentifier != nil) [s appendFormat: @"<EdmsIdentifier>%@</EdmsIdentifier>", [[self.EdmsIdentifier stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.EdmsType != nil) [s appendFormat: @"<EdmsType>%@</EdmsType>", [[self.EdmsType stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Identifier != nil) [s appendFormat: @"<Identifier>%@</Identifier>", [[self.Identifier stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.InformationRequestList != nil && self.InformationRequestList.count > 0) {
			[s appendFormat: @"<InformationRequestList>%@</InformationRequestList>", [CSCArrayOfInformationRequest serialize: self.InformationRequestList]];
		} else {
			[s appendString: @"<InformationRequestList/>"];
		}
		if (self.Organization != nil) [s appendString: [self.Organization serialize: @"Organization"]];
		if (self.Person != nil) [s appendString: [self.Person serialize: @"Person"]];
		if (self.ReceivedDate != nil) [s appendFormat: @"<ReceivedDate>%@</ReceivedDate>", [Soap getDateString: self.ReceivedDate]];
		if (self.ReceivedTime != nil) [s appendFormat: @"<ReceivedTime>%@</ReceivedTime>", [Soap getDateString: self.ReceivedTime]];
		if (self.SenderOrganization != nil) [s appendString: [self.SenderOrganization serialize: @"SenderOrganization"]];
		if (self.SenderPerson != nil) [s appendString: [self.SenderPerson serialize: @"SenderPerson"]];
		if (self.Type != nil) [s appendFormat: @"<Type>%@</Type>", [[self.Type stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.TypeLabel != nil) [s appendFormat: @"<TypeLabel>%@</TypeLabel>", [[self.TypeLabel stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCInformationReceipt class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
