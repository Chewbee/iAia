/*
	CSCAutoLoss.h
	The implementation of properties and methods for the CSCAutoLoss object.
	Generated by SudzC.com
*/
#import "CSCAutoLoss.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
#import "CSCArrayOfDamage.h"
#import "CSCVehicleDamage.h"
#import "CSCVehicleDamage.h"
@implementation CSCAutoLoss
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize AccidentDate = _AccidentDate;
	@synthesize AlcoholTest = _AlcoholTest;
	@synthesize ApplicableDamageList = _ApplicableDamageList;
	@synthesize Column = _Column;
	@synthesize HitAndRun = _HitAndRun;
	@synthesize InjuredPersons = _InjuredPersons;
	@synthesize MaterialDamageCause = _MaterialDamageCause;
	@synthesize NarcoticTest = _NarcoticTest;
	@synthesize OtherMaterialDamage = _OtherMaterialDamage;
	@synthesize OtherVehicleDamage = _OtherVehicleDamage;
	@synthesize SignedStatement = _SignedStatement;
	@synthesize SketchRemark = _SketchRemark;
	@synthesize TheftRecoveryDate = _TheftRecoveryDate;
	@synthesize ThirdPartyAccident = _ThirdPartyAccident;
	@synthesize ThirdPartyDamage = _ThirdPartyDamage;
	@synthesize Trailer = _Trailer;
	@synthesize VehicleDamage = _VehicleDamage;
	@synthesize Witness = _Witness;

	- (id) init
	{
		if(self = [super init])
		{
			self.Extension = nil; // [[CSCObject alloc] init];
			self.ExtensionList = [[NSMutableArray alloc] init];
			self.AccidentDate = nil;
			self.AlcoholTest = nil;
			self.ApplicableDamageList = [[NSMutableArray alloc] init];
			self.Column = nil;
			self.MaterialDamageCause = nil;
			self.NarcoticTest = nil;
			self.TheftRecoveryDate = nil;
			self.ThirdPartyDamage = nil; // [[CSCVehicleDamage alloc] init];
			self.VehicleDamage = nil; // [[CSCVehicleDamage alloc] init];

		}
		return self;
	}

	+ (CSCAutoLoss*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCAutoLoss*)[[CSCAutoLoss alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Extension = [[CSCObject createWithNode: [Soap getNode: node withName: @"Extension"]] object];
			self.ExtensionList = [[CSCArrayOfExtensionElement createWithNode: [Soap getNode: node withName: @"ExtensionList"]] object];
			self.AccidentDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"AccidentDate"]];
			self.AlcoholTest = [Soap getNodeValue: node withName: @"AlcoholTest"];
			self.ApplicableDamageList = [[CSCArrayOfDamage createWithNode: [Soap getNode: node withName: @"ApplicableDamageList"]] object];
			self.Column = [Soap getNodeValue: node withName: @"Column"];
			self.HitAndRun = [[Soap getNodeValue: node withName: @"HitAndRun"] boolValue];
			self.InjuredPersons = [[Soap getNodeValue: node withName: @"InjuredPersons"] boolValue];
			self.MaterialDamageCause = [Soap getNodeValue: node withName: @"MaterialDamageCause"];
			self.NarcoticTest = [Soap getNodeValue: node withName: @"NarcoticTest"];
			self.OtherMaterialDamage = [[Soap getNodeValue: node withName: @"OtherMaterialDamage"] boolValue];
			self.OtherVehicleDamage = [[Soap getNodeValue: node withName: @"OtherVehicleDamage"] boolValue];
			self.SignedStatement = [[Soap getNodeValue: node withName: @"SignedStatement"] boolValue];
			self.SketchRemark = [[Soap getNodeValue: node withName: @"SketchRemark"] boolValue];
			self.TheftRecoveryDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"TheftRecoveryDate"]];
			self.ThirdPartyAccident = [[Soap getNodeValue: node withName: @"ThirdPartyAccident"] boolValue];
			self.ThirdPartyDamage = [[CSCVehicleDamage createWithNode: [Soap getNode: node withName: @"ThirdPartyDamage"]] object];
			self.Trailer = [[Soap getNodeValue: node withName: @"Trailer"] boolValue];
			self.VehicleDamage = [[CSCVehicleDamage createWithNode: [Soap getNode: node withName: @"VehicleDamage"]] object];
			self.Witness = [[Soap getNodeValue: node withName: @"Witness"] boolValue];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"AutoLoss"];
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
		if (self.AccidentDate != nil) [s appendFormat: @"<AccidentDate>%@</AccidentDate>", [Soap getDateString: self.AccidentDate]];
		if (self.AlcoholTest != nil) [s appendFormat: @"<AlcoholTest>%@</AlcoholTest>", [[self.AlcoholTest stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.ApplicableDamageList != nil && self.ApplicableDamageList.count > 0) {
			[s appendFormat: @"<ApplicableDamageList>%@</ApplicableDamageList>", [CSCArrayOfDamage serialize: self.ApplicableDamageList]];
		} else {
			[s appendString: @"<ApplicableDamageList/>"];
		}
		if (self.Column != nil) [s appendFormat: @"<Column>%@</Column>", [[self.Column stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<HitAndRun>%@</HitAndRun>", (self.HitAndRun)?@"true":@"false"];
		[s appendFormat: @"<InjuredPersons>%@</InjuredPersons>", (self.InjuredPersons)?@"true":@"false"];
		if (self.MaterialDamageCause != nil) [s appendFormat: @"<MaterialDamageCause>%@</MaterialDamageCause>", [[self.MaterialDamageCause stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.NarcoticTest != nil) [s appendFormat: @"<NarcoticTest>%@</NarcoticTest>", [[self.NarcoticTest stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<OtherMaterialDamage>%@</OtherMaterialDamage>", (self.OtherMaterialDamage)?@"true":@"false"];
		[s appendFormat: @"<OtherVehicleDamage>%@</OtherVehicleDamage>", (self.OtherVehicleDamage)?@"true":@"false"];
		[s appendFormat: @"<SignedStatement>%@</SignedStatement>", (self.SignedStatement)?@"true":@"false"];
		[s appendFormat: @"<SketchRemark>%@</SketchRemark>", (self.SketchRemark)?@"true":@"false"];
		if (self.TheftRecoveryDate != nil) [s appendFormat: @"<TheftRecoveryDate>%@</TheftRecoveryDate>", [Soap getDateString: self.TheftRecoveryDate]];
		[s appendFormat: @"<ThirdPartyAccident>%@</ThirdPartyAccident>", (self.ThirdPartyAccident)?@"true":@"false"];
		if (self.ThirdPartyDamage != nil) [s appendString: [self.ThirdPartyDamage serialize: @"ThirdPartyDamage"]];
		[s appendFormat: @"<Trailer>%@</Trailer>", (self.Trailer)?@"true":@"false"];
		if (self.VehicleDamage != nil) [s appendString: [self.VehicleDamage serialize: @"VehicleDamage"]];
		[s appendFormat: @"<Witness>%@</Witness>", (self.Witness)?@"true":@"false"];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCAutoLoss class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
