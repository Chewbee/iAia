/*
	CSCSettlementPayment.h
	The implementation of properties and methods for the CSCSettlementPayment object.
	Generated by SudzC.com
*/
#import "CSCSettlementPayment.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
#import "CSCHealthBenefit.h"
#import "CSCSettlementFolder.h"
#import "CSCTechnicalOperation.h"
@implementation CSCSettlementPayment
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize DeductibleAmount = _DeductibleAmount;
	@synthesize DisbursementDate = _DisbursementDate;
	@synthesize HealthBenefit = _HealthBenefit;
	@synthesize PaymentType = _PaymentType;
	@synthesize SettlementFolder = _SettlementFolder;
	@synthesize Status = _Status;
	@synthesize StatusMotive = _StatusMotive;
	@synthesize StatusMotiveLabel = _StatusMotiveLabel;
	@synthesize TechnicalOperation = _TechnicalOperation;
	@synthesize Type = _Type;
	@synthesize TypeLabel = _TypeLabel;

	- (id) init
	{
		if(self = [super init])
		{
			self.Extension = nil; // [[CSCObject alloc] init];
			self.ExtensionList = [[NSMutableArray alloc] init];
			self.DeductibleAmount = nil;
			self.DisbursementDate = nil;
			self.HealthBenefit = nil; // [[CSCHealthBenefit alloc] init];
			self.PaymentType = nil;
			self.SettlementFolder = nil; // [[CSCSettlementFolder alloc] init];
			self.Status = nil;
			self.StatusMotive = nil;
			self.StatusMotiveLabel = nil;
			self.TechnicalOperation = nil; // [[CSCTechnicalOperation alloc] init];
			self.Type = nil;
			self.TypeLabel = nil;

		}
		return self;
	}

	+ (CSCSettlementPayment*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCSettlementPayment*)[[CSCSettlementPayment alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Extension = [[CSCObject createWithNode: [Soap getNode: node withName: @"Extension"]] object];
			self.ExtensionList = [[CSCArrayOfExtensionElement createWithNode: [Soap getNode: node withName: @"ExtensionList"]] object];
			self.DeductibleAmount = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"DeductibleAmount"]];
			self.DisbursementDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"DisbursementDate"]];
			self.HealthBenefit = [[CSCHealthBenefit createWithNode: [Soap getNode: node withName: @"HealthBenefit"]] object];
			self.PaymentType = [Soap getNodeValue: node withName: @"PaymentType"];
			self.SettlementFolder = [[CSCSettlementFolder createWithNode: [Soap getNode: node withName: @"SettlementFolder"]] object];
			self.Status = [Soap getNodeValue: node withName: @"Status"];
			self.StatusMotive = [Soap getNodeValue: node withName: @"StatusMotive"];
			self.StatusMotiveLabel = [Soap getNodeValue: node withName: @"StatusMotiveLabel"];
			self.TechnicalOperation = [[CSCTechnicalOperation createWithNode: [Soap getNode: node withName: @"TechnicalOperation"]] object];
			self.Type = [Soap getNodeValue: node withName: @"Type"];
			self.TypeLabel = [Soap getNodeValue: node withName: @"TypeLabel"];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"SettlementPayment"];
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
		if (self.DeductibleAmount != nil) [s appendFormat: @"<DeductibleAmount>%@</DeductibleAmount>", [NSString stringWithFormat: @"%@", self.DeductibleAmount]];
		if (self.DisbursementDate != nil) [s appendFormat: @"<DisbursementDate>%@</DisbursementDate>", [Soap getDateString: self.DisbursementDate]];
		if (self.HealthBenefit != nil) [s appendString: [self.HealthBenefit serialize: @"HealthBenefit"]];
		if (self.PaymentType != nil) [s appendFormat: @"<PaymentType>%@</PaymentType>", [[self.PaymentType stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.SettlementFolder != nil) [s appendString: [self.SettlementFolder serialize: @"SettlementFolder"]];
		if (self.Status != nil) [s appendFormat: @"<Status>%@</Status>", [[self.Status stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.StatusMotive != nil) [s appendFormat: @"<StatusMotive>%@</StatusMotive>", [[self.StatusMotive stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.StatusMotiveLabel != nil) [s appendFormat: @"<StatusMotiveLabel>%@</StatusMotiveLabel>", [[self.StatusMotiveLabel stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.TechnicalOperation != nil) [s appendString: [self.TechnicalOperation serialize: @"TechnicalOperation"]];
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
		if(object != nil && [object isKindOfClass:[CSCSettlementPayment class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
