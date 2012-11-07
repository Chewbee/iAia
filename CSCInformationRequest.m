/*
	CSCInformationRequest.h
	The implementation of properties and methods for the CSCInformationRequest object.
	Generated by SudzC.com
*/
#import "CSCInformationRequest.h"

#import "CSCWMActivity.h"
#import "CSCObject.h"
#import "CSCInformationReceipt.h"
#import "CSCOrganization.h"
#import "CSCOrganization.h"
#import "CSCPerson.h"
#import "CSCPerson.h"
#import "CSCReference.h"
@implementation CSCInformationRequest
	@synthesize Activity = _Activity;
	@synthesize BusinessObject = _BusinessObject;
	@synthesize InformationReceipt = _InformationReceipt;
	@synthesize Organization = _Organization;
	@synthesize OrganizationAddressee = _OrganizationAddressee;
	@synthesize Person = _Person;
	@synthesize PersonAddressee = _PersonAddressee;
	@synthesize PrimaryObject = _PrimaryObject;
	@synthesize RequestDate = _RequestDate;
	@synthesize Type = _Type;
	@synthesize TypeLabel = _TypeLabel;

	- (id) init
	{
		if(self = [super init])
		{
			self.Activity = nil; // [[CSCWMActivity alloc] init];
			self.BusinessObject = nil; // [[CSCObject alloc] init];
			self.InformationReceipt = nil; // [[CSCInformationReceipt alloc] init];
			self.Organization = nil; // [[CSCOrganization alloc] init];
			self.OrganizationAddressee = nil; // [[CSCOrganization alloc] init];
			self.Person = nil; // [[CSCPerson alloc] init];
			self.PersonAddressee = nil; // [[CSCPerson alloc] init];
			self.PrimaryObject = nil; // [[CSCReference alloc] init];
			self.RequestDate = nil;
			self.Type = nil;
			self.TypeLabel = nil;

		}
		return self;
	}

	+ (CSCInformationRequest*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCInformationRequest*)[[CSCInformationRequest alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Activity = [[CSCWMActivity createWithNode: [Soap getNode: node withName: @"Activity"]] object];
			self.BusinessObject = [[CSCObject createWithNode: [Soap getNode: node withName: @"BusinessObject"]] object];
			self.InformationReceipt = [[CSCInformationReceipt createWithNode: [Soap getNode: node withName: @"InformationReceipt"]] object];
			self.Organization = [[CSCOrganization createWithNode: [Soap getNode: node withName: @"Organization"]] object];
			self.OrganizationAddressee = [[CSCOrganization createWithNode: [Soap getNode: node withName: @"OrganizationAddressee"]] object];
			self.Person = [[CSCPerson createWithNode: [Soap getNode: node withName: @"Person"]] object];
			self.PersonAddressee = [[CSCPerson createWithNode: [Soap getNode: node withName: @"PersonAddressee"]] object];
			self.PrimaryObject = [[CSCReference createWithNode: [Soap getNode: node withName: @"PrimaryObject"]] object];
			self.RequestDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"RequestDate"]];
			self.Type = [Soap getNodeValue: node withName: @"Type"];
			self.TypeLabel = [Soap getNodeValue: node withName: @"TypeLabel"];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"InformationRequest"];
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
		if (self.Activity != nil) [s appendString: [self.Activity serialize: @"Activity"]];
		if (self.BusinessObject != nil) [s appendString: [self.BusinessObject serialize: @"BusinessObject"]];
		if (self.InformationReceipt != nil) [s appendString: [self.InformationReceipt serialize: @"InformationReceipt"]];
		if (self.Organization != nil) [s appendString: [self.Organization serialize: @"Organization"]];
		if (self.OrganizationAddressee != nil) [s appendString: [self.OrganizationAddressee serialize: @"OrganizationAddressee"]];
		if (self.Person != nil) [s appendString: [self.Person serialize: @"Person"]];
		if (self.PersonAddressee != nil) [s appendString: [self.PersonAddressee serialize: @"PersonAddressee"]];
		if (self.PrimaryObject != nil) [s appendString: [self.PrimaryObject serialize: @"PrimaryObject"]];
		if (self.RequestDate != nil) [s appendFormat: @"<RequestDate>%@</RequestDate>", [Soap getDateString: self.RequestDate]];
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
		if(object != nil && [object isKindOfClass:[CSCInformationRequest class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end