/*
	CSCHealthParty.h
	The implementation of properties and methods for the CSCHealthParty object.
	Generated by SudzC.com
*/
#import "CSCHealthParty.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
#import "CSCBankAccount.h"
#import "CSCEMailAddress.h"
#import "CSCHealthProfessional.h"
#import "CSCNationalHealthOffice.h"
#import "CSCArrayOfNetworkMembership.h"
#import "CSCOrganization.h"
#import "CSCPerson.h"
#import "CSCPhoneAddress.h"
#import "CSCPostalAddress.h"
#import "CSCArrayOfPartyRole.h"
@implementation CSCHealthParty
	@synthesize DisplayId = _DisplayId;
	@synthesize EffectiveDate = _EffectiveDate;
	@synthesize EndDate = _EndDate;
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize StartDate = _StartDate;
	@synthesize BankAccount = _BankAccount;
	@synthesize CoefficientMCO = _CoefficientMCO;
	@synthesize ConventionTarifaire = _ConventionTarifaire;
	@synthesize EMailAddress = _EMailAddress;
	@synthesize HealthProfessional = _HealthProfessional;
	@synthesize Identifier = _Identifier;
	@synthesize IndemniteKilometrique = _IndemniteKilometrique;
	@synthesize InputDate = _InputDate;
	@synthesize NationalHealthOffice = _NationalHealthOffice;
	@synthesize NetworkMembershipList = _NetworkMembershipList;
	@synthesize NumeroRPPS = _NumeroRPPS;
	@synthesize Organization = _Organization;
	@synthesize Person = _Person;
	@synthesize PhoneAddress = _PhoneAddress;
	@synthesize PostalAddress = _PostalAddress;
	@synthesize RoleList = _RoleList;
	@synthesize Specialty = _Specialty;
	@synthesize TitleCode = _TitleCode;
	@synthesize TitleLabel = _TitleLabel;
	@synthesize Trade = _Trade;
	@synthesize TradeLabel = _TradeLabel;
	@synthesize ZoneTarif = _ZoneTarif;

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
			self.BankAccount = nil; // [[CSCBankAccount alloc] init];
			self.CoefficientMCO = nil;
			self.ConventionTarifaire = nil;
			self.EMailAddress = nil; // [[CSCEMailAddress alloc] init];
			self.HealthProfessional = nil; // [[CSCHealthProfessional alloc] init];
			self.Identifier = nil;
			self.IndemniteKilometrique = nil;
			self.InputDate = nil;
			self.NationalHealthOffice = nil; // [[CSCNationalHealthOffice alloc] init];
			self.NetworkMembershipList = [[NSMutableArray alloc] init];
			self.NumeroRPPS = nil;
			self.Organization = nil; // [[CSCOrganization alloc] init];
			self.Person = nil; // [[CSCPerson alloc] init];
			self.PhoneAddress = nil; // [[CSCPhoneAddress alloc] init];
			self.PostalAddress = nil; // [[CSCPostalAddress alloc] init];
			self.RoleList = [[NSMutableArray alloc] init];
			self.Specialty = nil;
			self.TitleCode = nil;
			self.TitleLabel = nil;
			self.Trade = nil;
			self.TradeLabel = nil;
			self.ZoneTarif = nil;

		}
		return self;
	}

	+ (CSCHealthParty*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCHealthParty*)[[CSCHealthParty alloc] initWithNode: node];
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
			self.BankAccount = [[CSCBankAccount createWithNode: [Soap getNode: node withName: @"BankAccount"]] object];
			self.CoefficientMCO = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"CoefficientMCO"]];
			self.ConventionTarifaire = [Soap getNodeValue: node withName: @"ConventionTarifaire"];
			self.EMailAddress = [[CSCEMailAddress createWithNode: [Soap getNode: node withName: @"EMailAddress"]] object];
			self.HealthProfessional = [[CSCHealthProfessional createWithNode: [Soap getNode: node withName: @"HealthProfessional"]] object];
			self.Identifier = [Soap getNodeValue: node withName: @"Identifier"];
			self.IndemniteKilometrique = [Soap getNodeValue: node withName: @"IndemniteKilometrique"];
			self.InputDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"InputDate"]];
			self.NationalHealthOffice = [[CSCNationalHealthOffice createWithNode: [Soap getNode: node withName: @"NationalHealthOffice"]] object];
			self.NetworkMembershipList = [[CSCArrayOfNetworkMembership createWithNode: [Soap getNode: node withName: @"NetworkMembershipList"]] object];
			self.NumeroRPPS = [Soap getNodeValue: node withName: @"NumeroRPPS"];
			self.Organization = [[CSCOrganization createWithNode: [Soap getNode: node withName: @"Organization"]] object];
			self.Person = [[CSCPerson createWithNode: [Soap getNode: node withName: @"Person"]] object];
			self.PhoneAddress = [[CSCPhoneAddress createWithNode: [Soap getNode: node withName: @"PhoneAddress"]] object];
			self.PostalAddress = [[CSCPostalAddress createWithNode: [Soap getNode: node withName: @"PostalAddress"]] object];
			self.RoleList = [[CSCArrayOfPartyRole createWithNode: [Soap getNode: node withName: @"RoleList"]] object];
			self.Specialty = [Soap getNodeValue: node withName: @"Specialty"];
			self.TitleCode = [Soap getNodeValue: node withName: @"TitleCode"];
			self.TitleLabel = [Soap getNodeValue: node withName: @"TitleLabel"];
			self.Trade = [Soap getNodeValue: node withName: @"Trade"];
			self.TradeLabel = [Soap getNodeValue: node withName: @"TradeLabel"];
			self.ZoneTarif = [Soap getNodeValue: node withName: @"ZoneTarif"];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"HealthParty"];
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
		if (self.BankAccount != nil) [s appendString: [self.BankAccount serialize: @"BankAccount"]];
		if (self.CoefficientMCO != nil) [s appendFormat: @"<CoefficientMCO>%@</CoefficientMCO>", [NSString stringWithFormat: @"%@", self.CoefficientMCO]];
		if (self.ConventionTarifaire != nil) [s appendFormat: @"<ConventionTarifaire>%@</ConventionTarifaire>", [[self.ConventionTarifaire stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.EMailAddress != nil) [s appendString: [self.EMailAddress serialize: @"EMailAddress"]];
		if (self.HealthProfessional != nil) [s appendString: [self.HealthProfessional serialize: @"HealthProfessional"]];
		if (self.Identifier != nil) [s appendFormat: @"<Identifier>%@</Identifier>", [[self.Identifier stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.IndemniteKilometrique != nil) [s appendFormat: @"<IndemniteKilometrique>%@</IndemniteKilometrique>", [[self.IndemniteKilometrique stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.InputDate != nil) [s appendFormat: @"<InputDate>%@</InputDate>", [Soap getDateString: self.InputDate]];
		if (self.NationalHealthOffice != nil) [s appendString: [self.NationalHealthOffice serialize: @"NationalHealthOffice"]];
		if (self.NetworkMembershipList != nil && self.NetworkMembershipList.count > 0) {
			[s appendFormat: @"<NetworkMembershipList>%@</NetworkMembershipList>", [CSCArrayOfNetworkMembership serialize: self.NetworkMembershipList]];
		} else {
			[s appendString: @"<NetworkMembershipList/>"];
		}
		if (self.NumeroRPPS != nil) [s appendFormat: @"<NumeroRPPS>%@</NumeroRPPS>", [[self.NumeroRPPS stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Organization != nil) [s appendString: [self.Organization serialize: @"Organization"]];
		if (self.Person != nil) [s appendString: [self.Person serialize: @"Person"]];
		if (self.PhoneAddress != nil) [s appendString: [self.PhoneAddress serialize: @"PhoneAddress"]];
		if (self.PostalAddress != nil) [s appendString: [self.PostalAddress serialize: @"PostalAddress"]];
		if (self.RoleList != nil && self.RoleList.count > 0) {
			[s appendFormat: @"<RoleList>%@</RoleList>", [CSCArrayOfPartyRole serialize: self.RoleList]];
		} else {
			[s appendString: @"<RoleList/>"];
		}
		if (self.Specialty != nil) [s appendFormat: @"<Specialty>%@</Specialty>", [[self.Specialty stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.TitleCode != nil) [s appendFormat: @"<TitleCode>%@</TitleCode>", [[self.TitleCode stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.TitleLabel != nil) [s appendFormat: @"<TitleLabel>%@</TitleLabel>", [[self.TitleLabel stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Trade != nil) [s appendFormat: @"<Trade>%@</Trade>", [[self.Trade stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.TradeLabel != nil) [s appendFormat: @"<TradeLabel>%@</TradeLabel>", [[self.TradeLabel stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.ZoneTarif != nil) [s appendFormat: @"<ZoneTarif>%@</ZoneTarif>", [[self.ZoneTarif stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCHealthParty class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
