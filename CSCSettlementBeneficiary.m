/*
	CSCSettlementBeneficiary.h
	The implementation of properties and methods for the CSCSettlementBeneficiary object.
	Generated by SudzC.com
*/
#import "CSCSettlementBeneficiary.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
#import "CSCArrayOfDisbursementSplit.h"
#import "CSCOrganization.h"
#import "CSCPerson.h"
#import "CSCArrayOfPartyRole.h"
#import "CSCArrayOfSettlementItem.h"
#import "CSCSettlementTax.h"
#import "CSCArrayOfSettlementTax.h"
@implementation CSCSettlementBeneficiary
	@synthesize DisplayId = _DisplayId;
	@synthesize EffectiveDate = _EffectiveDate;
	@synthesize EndDate = _EndDate;
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize StartDate = _StartDate;
	@synthesize AcceptanceDate = _AcceptanceDate;
	@synthesize AcceptanceDecision = _AcceptanceDecision;
	@synthesize DisbursementSplitList = _DisbursementSplitList;
	@synthesize Identifier = _Identifier;
	@synthesize Organization = _Organization;
	@synthesize Person = _Person;
	@synthesize RoleList = _RoleList;
	@synthesize SettlementItemList = _SettlementItemList;
	@synthesize Tax = _Tax;
	@synthesize TaxList = _TaxList;
	@synthesize TotalAmount = _TotalAmount;

	- (id) init
	{
		if(self = [super init])
		{
			self.DisplayId = nil;
			self.EffectiveDate = nil;
			self.EndDate = nil;
			self.Extension = nil; // [[CSCObject alloc] init];
			self.ExtensionList = [[NSMutableArray alloc] init];
			self.StartDate = nil;
			self.AcceptanceDate = nil;
			self.AcceptanceDecision = nil;
			self.DisbursementSplitList = [[NSMutableArray alloc] init];
			self.Identifier = nil;
			self.Organization = nil; // [[CSCOrganization alloc] init];
			self.Person = nil; // [[CSCPerson alloc] init];
			self.RoleList = [[NSMutableArray alloc] init];
			self.SettlementItemList = [[NSMutableArray alloc] init];
			self.Tax = nil; // [[CSCSettlementTax alloc] init];
			self.TaxList = [[NSMutableArray alloc] init];
			self.TotalAmount = nil;

		}
		return self;
	}

	+ (CSCSettlementBeneficiary*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCSettlementBeneficiary*)[[CSCSettlementBeneficiary alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.DisplayId = [Soap getNodeValue: node withName: @"DisplayId"];
			self.EffectiveDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"EffectiveDate"]];
			self.EndDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"EndDate"]];
			self.Extension = [[CSCObject createWithNode: [Soap getNode: node withName: @"Extension"]] object];
			self.ExtensionList = [[CSCArrayOfExtensionElement createWithNode: [Soap getNode: node withName: @"ExtensionList"]] object];
			self.StartDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"StartDate"]];
			self.AcceptanceDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"AcceptanceDate"]];
			self.AcceptanceDecision = [Soap getNodeValue: node withName: @"AcceptanceDecision"];
			self.DisbursementSplitList = [[CSCArrayOfDisbursementSplit createWithNode: [Soap getNode: node withName: @"DisbursementSplitList"]] object];
			self.Identifier = [Soap getNodeValue: node withName: @"Identifier"];
			self.Organization = [[CSCOrganization createWithNode: [Soap getNode: node withName: @"Organization"]] object];
			self.Person = [[CSCPerson createWithNode: [Soap getNode: node withName: @"Person"]] object];
			self.RoleList = [[CSCArrayOfPartyRole createWithNode: [Soap getNode: node withName: @"RoleList"]] object];
			self.SettlementItemList = [[CSCArrayOfSettlementItem createWithNode: [Soap getNode: node withName: @"SettlementItemList"]] object];
			self.Tax = [[CSCSettlementTax createWithNode: [Soap getNode: node withName: @"Tax"]] object];
			self.TaxList = [[CSCArrayOfSettlementTax createWithNode: [Soap getNode: node withName: @"TaxList"]] object];
			self.TotalAmount = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"TotalAmount"]];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"SettlementBeneficiary"];
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
		if (self.DisplayId != nil) [s appendFormat: @"<DisplayId>%@</DisplayId>", [[self.DisplayId stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.EffectiveDate != nil) [s appendFormat: @"<EffectiveDate>%@</EffectiveDate>", [Soap getDateString: self.EffectiveDate]];
		if (self.EndDate != nil) [s appendFormat: @"<EndDate>%@</EndDate>", [Soap getDateString: self.EndDate]];
		if (self.Extension != nil) [s appendString: [self.Extension serialize: @"Extension"]];
		if (self.ExtensionList != nil && self.ExtensionList.count > 0) {
			[s appendFormat: @"<ExtensionList>%@</ExtensionList>", [CSCArrayOfExtensionElement serialize: self.ExtensionList]];
		} else {
			[s appendString: @"<ExtensionList/>"];
		}
		if (self.StartDate != nil) [s appendFormat: @"<StartDate>%@</StartDate>", [Soap getDateString: self.StartDate]];
		if (self.AcceptanceDate != nil) [s appendFormat: @"<AcceptanceDate>%@</AcceptanceDate>", [Soap getDateString: self.AcceptanceDate]];
		if (self.AcceptanceDecision != nil) [s appendFormat: @"<AcceptanceDecision>%@</AcceptanceDecision>", [[self.AcceptanceDecision stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.DisbursementSplitList != nil && self.DisbursementSplitList.count > 0) {
			[s appendFormat: @"<DisbursementSplitList>%@</DisbursementSplitList>", [CSCArrayOfDisbursementSplit serialize: self.DisbursementSplitList]];
		} else {
			[s appendString: @"<DisbursementSplitList/>"];
		}
		if (self.Identifier != nil) [s appendFormat: @"<Identifier>%@</Identifier>", [[self.Identifier stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Organization != nil) [s appendString: [self.Organization serialize: @"Organization"]];
		if (self.Person != nil) [s appendString: [self.Person serialize: @"Person"]];
		if (self.RoleList != nil && self.RoleList.count > 0) {
			[s appendFormat: @"<RoleList>%@</RoleList>", [CSCArrayOfPartyRole serialize: self.RoleList]];
		} else {
			[s appendString: @"<RoleList/>"];
		}
		if (self.SettlementItemList != nil && self.SettlementItemList.count > 0) {
			[s appendFormat: @"<SettlementItemList>%@</SettlementItemList>", [CSCArrayOfSettlementItem serialize: self.SettlementItemList]];
		} else {
			[s appendString: @"<SettlementItemList/>"];
		}
		if (self.Tax != nil) [s appendString: [self.Tax serialize: @"Tax"]];
		if (self.TaxList != nil && self.TaxList.count > 0) {
			[s appendFormat: @"<TaxList>%@</TaxList>", [CSCArrayOfSettlementTax serialize: self.TaxList]];
		} else {
			[s appendString: @"<TaxList/>"];
		}
		if (self.TotalAmount != nil) [s appendFormat: @"<TotalAmount>%@</TotalAmount>", [NSString stringWithFormat: @"%@", self.TotalAmount]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCSettlementBeneficiary class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
