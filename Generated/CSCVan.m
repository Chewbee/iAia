/*
	CSCVan.h
	The implementation of properties and methods for the CSCVan object.
	Generated by SudzC.com
*/
#import "CSCVan.h"

#import "CSCObject.h"
#import "CSCArrayOfExtensionElement.h"
#import "CSCPostalAddress.h"
@implementation CSCVan
	@synthesize Extension = _Extension;
	@synthesize ExtensionList = _ExtensionList;
	@synthesize PostalAddress = _PostalAddress;
	@synthesize SumInsured = _SumInsured;
	@synthesize SumInsuredValuation = _SumInsuredValuation;
	@synthesize SumInsuredValuationLabel = _SumInsuredValuationLabel;
	@synthesize Age = _Age;
	@synthesize AlarmSystem = _AlarmSystem;
	@synthesize AntiTheftMarking = _AntiTheftMarking;
	@synthesize AntiTheftSystem = _AntiTheftSystem;
	@synthesize AntiTheftSystemLabel = _AntiTheftSystemLabel;
	@synthesize Color = _Color;
	@synthesize Damaged = _Damaged;
	@synthesize FirstUseDate = _FirstUseDate;
	@synthesize Make = _Make;
	@synthesize MakeLabel = _MakeLabel;
	@synthesize Model = _Model;
	@synthesize ModelLabel = _ModelLabel;
	@synthesize ModelYear = _ModelYear;
	@synthesize RegistrationCountry = _RegistrationCountry;
	@synthesize RegistrationDocumentNumber = _RegistrationDocumentNumber;
	@synthesize RegistrationNumber = _RegistrationNumber;
	@synthesize SerialNumber = _SerialNumber;
	@synthesize SumInsuredTax = _SumInsuredTax;
	@synthesize VehicleCategory = _VehicleCategory;
	@synthesize VehicleCategoryLabel = _VehicleCategoryLabel;
	@synthesize VehicleIdentificationNumber = _VehicleIdentificationNumber;
	@synthesize Weight = _Weight;
	@synthesize CubicCapacity = _CubicCapacity;
	@synthesize GearLockDevice = _GearLockDevice;
	@synthesize MotorType = _MotorType;
	@synthesize MotorTypeLabel = _MotorTypeLabel;
	@synthesize Power = _Power;
	@synthesize SeatsPositions = _SeatsPositions;
	@synthesize LadenWeight = _LadenWeight;
	@synthesize Type = _Type;
	@synthesize TypeLabel = _TypeLabel;

	- (id) init
	{
		if(self = [super init])
		{
			self.Extension = nil; // [[CSCObject alloc] init];
			self.ExtensionList = [[NSMutableArray alloc] init];
			self.PostalAddress = nil; // [[CSCPostalAddress alloc] init];
			self.SumInsured = nil;
			self.SumInsuredValuation = nil;
			self.SumInsuredValuationLabel = nil;
			self.AntiTheftSystem = nil;
			self.AntiTheftSystemLabel = nil;
			self.Color = nil;
			self.FirstUseDate = nil;
			self.Make = nil;
			self.MakeLabel = nil;
			self.Model = nil;
			self.ModelLabel = nil;
			self.RegistrationCountry = nil;
			self.RegistrationDocumentNumber = nil;
			self.RegistrationNumber = nil;
			self.SerialNumber = nil;
			self.VehicleCategory = nil;
			self.VehicleCategoryLabel = nil;
			self.VehicleIdentificationNumber = nil;
			self.MotorType = nil;
			self.MotorTypeLabel = nil;
			self.Power = nil;
			self.LadenWeight = nil;
			self.Type = nil;
			self.TypeLabel = nil;

		}
		return self;
	}

	+ (CSCVan*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCVan*)[[CSCVan alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Extension = [[CSCObject createWithNode: [Soap getNode: node withName: @"Extension"]] object];
			self.ExtensionList = [[CSCArrayOfExtensionElement createWithNode: [Soap getNode: node withName: @"ExtensionList"]] object];
			self.PostalAddress = [[CSCPostalAddress createWithNode: [Soap getNode: node withName: @"PostalAddress"]] object];
			self.SumInsured = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"SumInsured"]];
			self.SumInsuredValuation = [Soap getNodeValue: node withName: @"SumInsuredValuation"];
			self.SumInsuredValuationLabel = [Soap getNodeValue: node withName: @"SumInsuredValuationLabel"];
			self.Age = [[Soap getNodeValue: node withName: @"Age"] intValue];
			self.AlarmSystem = [[Soap getNodeValue: node withName: @"AlarmSystem"] boolValue];
			self.AntiTheftMarking = [[Soap getNodeValue: node withName: @"AntiTheftMarking"] boolValue];
			self.AntiTheftSystem = [Soap getNodeValue: node withName: @"AntiTheftSystem"];
			self.AntiTheftSystemLabel = [Soap getNodeValue: node withName: @"AntiTheftSystemLabel"];
			self.Color = [Soap getNodeValue: node withName: @"Color"];
			self.Damaged = [[Soap getNodeValue: node withName: @"Damaged"] boolValue];
			self.FirstUseDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"FirstUseDate"]];
			self.Make = [Soap getNodeValue: node withName: @"Make"];
			self.MakeLabel = [Soap getNodeValue: node withName: @"MakeLabel"];
			self.Model = [Soap getNodeValue: node withName: @"Model"];
			self.ModelLabel = [Soap getNodeValue: node withName: @"ModelLabel"];
			self.ModelYear = [[Soap getNodeValue: node withName: @"ModelYear"] intValue];
			self.RegistrationCountry = [Soap getNodeValue: node withName: @"RegistrationCountry"];
			self.RegistrationDocumentNumber = [Soap getNodeValue: node withName: @"RegistrationDocumentNumber"];
			self.RegistrationNumber = [Soap getNodeValue: node withName: @"RegistrationNumber"];
			self.SerialNumber = [Soap getNodeValue: node withName: @"SerialNumber"];
			self.SumInsuredTax = [[Soap getNodeValue: node withName: @"SumInsuredTax"] boolValue];
			self.VehicleCategory = [Soap getNodeValue: node withName: @"VehicleCategory"];
			self.VehicleCategoryLabel = [Soap getNodeValue: node withName: @"VehicleCategoryLabel"];
			self.VehicleIdentificationNumber = [Soap getNodeValue: node withName: @"VehicleIdentificationNumber"];
			self.Weight = [[Soap getNodeValue: node withName: @"Weight"] intValue];
			self.CubicCapacity = [[Soap getNodeValue: node withName: @"CubicCapacity"] intValue];
			self.GearLockDevice = [[Soap getNodeValue: node withName: @"GearLockDevice"] boolValue];
			self.MotorType = [Soap getNodeValue: node withName: @"MotorType"];
			self.MotorTypeLabel = [Soap getNodeValue: node withName: @"MotorTypeLabel"];
			self.Power = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"Power"]];
			self.SeatsPositions = [[Soap getNodeValue: node withName: @"SeatsPositions"] intValue];
			self.LadenWeight = [NSDecimalNumber decimalNumberWithString: [Soap getNodeValue: node withName: @"LadenWeight"]];
			self.Type = [Soap getNodeValue: node withName: @"Type"];
			self.TypeLabel = [Soap getNodeValue: node withName: @"TypeLabel"];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"Van"];
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
		if (self.PostalAddress != nil) [s appendString: [self.PostalAddress serialize: @"PostalAddress"]];
		if (self.SumInsured != nil) [s appendFormat: @"<SumInsured>%@</SumInsured>", [NSString stringWithFormat: @"%@", self.SumInsured]];
		if (self.SumInsuredValuation != nil) [s appendFormat: @"<SumInsuredValuation>%@</SumInsuredValuation>", [[self.SumInsuredValuation stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.SumInsuredValuationLabel != nil) [s appendFormat: @"<SumInsuredValuationLabel>%@</SumInsuredValuationLabel>", [[self.SumInsuredValuationLabel stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<Age>%@</Age>", [NSString stringWithFormat: @"%i", self.Age]];
		[s appendFormat: @"<AlarmSystem>%@</AlarmSystem>", (self.AlarmSystem)?@"true":@"false"];
		[s appendFormat: @"<AntiTheftMarking>%@</AntiTheftMarking>", (self.AntiTheftMarking)?@"true":@"false"];
		if (self.AntiTheftSystem != nil) [s appendFormat: @"<AntiTheftSystem>%@</AntiTheftSystem>", [[self.AntiTheftSystem stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.AntiTheftSystemLabel != nil) [s appendFormat: @"<AntiTheftSystemLabel>%@</AntiTheftSystemLabel>", [[self.AntiTheftSystemLabel stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Color != nil) [s appendFormat: @"<Color>%@</Color>", [[self.Color stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<Damaged>%@</Damaged>", (self.Damaged)?@"true":@"false"];
		if (self.FirstUseDate != nil) [s appendFormat: @"<FirstUseDate>%@</FirstUseDate>", [Soap getDateString: self.FirstUseDate]];
		if (self.Make != nil) [s appendFormat: @"<Make>%@</Make>", [[self.Make stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.MakeLabel != nil) [s appendFormat: @"<MakeLabel>%@</MakeLabel>", [[self.MakeLabel stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Model != nil) [s appendFormat: @"<Model>%@</Model>", [[self.Model stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.ModelLabel != nil) [s appendFormat: @"<ModelLabel>%@</ModelLabel>", [[self.ModelLabel stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<ModelYear>%@</ModelYear>", [NSString stringWithFormat: @"%i", self.ModelYear]];
		if (self.RegistrationCountry != nil) [s appendFormat: @"<RegistrationCountry>%@</RegistrationCountry>", [[self.RegistrationCountry stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.RegistrationDocumentNumber != nil) [s appendFormat: @"<RegistrationDocumentNumber>%@</RegistrationDocumentNumber>", [[self.RegistrationDocumentNumber stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.RegistrationNumber != nil) [s appendFormat: @"<RegistrationNumber>%@</RegistrationNumber>", [[self.RegistrationNumber stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.SerialNumber != nil) [s appendFormat: @"<SerialNumber>%@</SerialNumber>", [[self.SerialNumber stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<SumInsuredTax>%@</SumInsuredTax>", (self.SumInsuredTax)?@"true":@"false"];
		if (self.VehicleCategory != nil) [s appendFormat: @"<VehicleCategory>%@</VehicleCategory>", [[self.VehicleCategory stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.VehicleCategoryLabel != nil) [s appendFormat: @"<VehicleCategoryLabel>%@</VehicleCategoryLabel>", [[self.VehicleCategoryLabel stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.VehicleIdentificationNumber != nil) [s appendFormat: @"<VehicleIdentificationNumber>%@</VehicleIdentificationNumber>", [[self.VehicleIdentificationNumber stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		[s appendFormat: @"<Weight>%@</Weight>", [NSString stringWithFormat: @"%i", self.Weight]];
		[s appendFormat: @"<CubicCapacity>%@</CubicCapacity>", [NSString stringWithFormat: @"%i", self.CubicCapacity]];
		[s appendFormat: @"<GearLockDevice>%@</GearLockDevice>", (self.GearLockDevice)?@"true":@"false"];
		if (self.MotorType != nil) [s appendFormat: @"<MotorType>%@</MotorType>", [[self.MotorType stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.MotorTypeLabel != nil) [s appendFormat: @"<MotorTypeLabel>%@</MotorTypeLabel>", [[self.MotorTypeLabel stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Power != nil) [s appendFormat: @"<Power>%@</Power>", [NSString stringWithFormat: @"%@", self.Power]];
		[s appendFormat: @"<SeatsPositions>%@</SeatsPositions>", [NSString stringWithFormat: @"%i", self.SeatsPositions]];
		if (self.LadenWeight != nil) [s appendFormat: @"<LadenWeight>%@</LadenWeight>", [NSString stringWithFormat: @"%@", self.LadenWeight]];
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
		if(object != nil && [object isKindOfClass:[CSCVan class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end