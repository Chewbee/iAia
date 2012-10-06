/*
	CSCSavingsPool.h
	The implementation of properties and methods for the CSCSavingsPool object.
	Generated by SudzC.com
*/
#import "CSCSavingsPool.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
#import "CSCArrayOfBeneficiary.h"
#import "CSCArrayOfClause.h"
#import "CSCArrayOfCoverageFund.h"
#import "CSCArrayOfFundsAllocation.h"
#import "CSCArrayOfSavingsScheme.h"
@implementation CSCSavingsPool
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize BeneficiaryList = _BeneficiaryList;
	@synthesize ClauseList = _ClauseList;
	@synthesize CoverageFundList = _CoverageFundList;
	@synthesize FundsAllocationList = _FundsAllocationList;
	@synthesize GrossCashValue = _GrossCashValue;
	@synthesize NetCashValue = _NetCashValue;
	@synthesize SavingsSchemeList = _SavingsSchemeList;

	- (id) init
	{
		if(self = [super init])
		{
			self.Extension = nil; // [[CSCObject alloc] init];
			self.ExtensionList = [[NSMutableArray alloc] init];
			self.BeneficiaryList = [[NSMutableArray alloc] init];
			self.ClauseList = [[NSMutableArray alloc] init];
			self.CoverageFundList = [[NSMutableArray alloc] init];
			self.FundsAllocationList = [[NSMutableArray alloc] init];
			self.GrossCashValue = nil;
			self.NetCashValue = nil;
			self.SavingsSchemeList = [[NSMutableArray alloc] init];

		}
		return self;
	}

	+ (CSCSavingsPool*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCSavingsPool*)[[CSCSavingsPool alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Extension = [[CSCObject createWithNode: [Soap getNode: node withName: @"Extension"]] object];
			self.ExtensionList = [[CSCArrayOfExtensionElement createWithNode: [Soap getNode: node withName: @"ExtensionList"]] object];
			self.BeneficiaryList = [[CSCArrayOfBeneficiary createWithNode: [Soap getNode: node withName: @"BeneficiaryList"]] object];
			self.ClauseList = [[CSCArrayOfClause createWithNode: [Soap getNode: node withName: @"ClauseList"]] object];
			self.CoverageFundList = [[CSCArrayOfCoverageFund createWithNode: [Soap getNode: node withName: @"CoverageFundList"]] object];
			self.FundsAllocationList = [[CSCArrayOfFundsAllocation createWithNode: [Soap getNode: node withName: @"FundsAllocationList"]] object];
			self.GrossCashValue = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"GrossCashValue"]];
			self.NetCashValue = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"NetCashValue"]];
			self.SavingsSchemeList = [[CSCArrayOfSavingsScheme createWithNode: [Soap getNode: node withName: @"SavingsSchemeList"]] object];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"SavingsPool"];
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
		if (self.BeneficiaryList != nil && self.BeneficiaryList.count > 0) {
			[s appendFormat: @"<BeneficiaryList>%@</BeneficiaryList>", [CSCArrayOfBeneficiary serialize: self.BeneficiaryList]];
		} else {
			[s appendString: @"<BeneficiaryList/>"];
		}
		if (self.ClauseList != nil && self.ClauseList.count > 0) {
			[s appendFormat: @"<ClauseList>%@</ClauseList>", [CSCArrayOfClause serialize: self.ClauseList]];
		} else {
			[s appendString: @"<ClauseList/>"];
		}
		if (self.CoverageFundList != nil && self.CoverageFundList.count > 0) {
			[s appendFormat: @"<CoverageFundList>%@</CoverageFundList>", [CSCArrayOfCoverageFund serialize: self.CoverageFundList]];
		} else {
			[s appendString: @"<CoverageFundList/>"];
		}
		if (self.FundsAllocationList != nil && self.FundsAllocationList.count > 0) {
			[s appendFormat: @"<FundsAllocationList>%@</FundsAllocationList>", [CSCArrayOfFundsAllocation serialize: self.FundsAllocationList]];
		} else {
			[s appendString: @"<FundsAllocationList/>"];
		}
		if (self.GrossCashValue != nil) [s appendFormat: @"<GrossCashValue>%@</GrossCashValue>", [NSString stringWithFormat: @"%@", self.GrossCashValue]];
		if (self.NetCashValue != nil) [s appendFormat: @"<NetCashValue>%@</NetCashValue>", [NSString stringWithFormat: @"%@", self.NetCashValue]];
		if (self.SavingsSchemeList != nil && self.SavingsSchemeList.count > 0) {
			[s appendFormat: @"<SavingsSchemeList>%@</SavingsSchemeList>", [CSCArrayOfSavingsScheme serialize: self.SavingsSchemeList]];
		} else {
			[s appendString: @"<SavingsSchemeList/>"];
		}

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCSavingsPool class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
