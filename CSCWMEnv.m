/*
	CSCWMEnv.h
	The implementation of properties and methods for the CSCWMEnv object.
	Generated by SudzC.com
*/
#import "CSCWMEnv.h"

#import "CSCArrayOfString.h"
#import "CSCArrayOfString.h"
#import "CSCArrayOfProp.h"
#import "CSCArrayOfString.h"
@implementation CSCWMEnv
	@synthesize ActivityIdentifier = _ActivityIdentifier;
	@synthesize DataProfiles = _DataProfiles;
	@synthesize EffectiveDate = _EffectiveDate;
	@synthesize Language = _Language;
	@synthesize Mode = _Mode;
	@synthesize Profiles = _Profiles;
	@synthesize UserData = _UserData;
	@synthesize UserID = _UserID;
	@synthesize Workqueues = _Workqueues;

	- (id) init
	{
		if(self = [super init])
		{
			self.ActivityIdentifier = nil;
			self.DataProfiles = [[NSMutableArray alloc] init];
			self.EffectiveDate = nil ;
			self.Language = nil;
			self.Mode = nil;
			self.Profiles = [[NSMutableArray alloc] init];
            [self.Profiles addObject:@"all_user"];
			self.UserData = [[NSMutableArray alloc] init];
			self.UserID = @"CSCUSR1";
			self.Workqueues = [[NSMutableArray alloc] init];

		}
		return self;
	}

	+ (CSCWMEnv*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCWMEnv*)[[CSCWMEnv alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.ActivityIdentifier = [Soap getNodeValue: node withName: @"ActivityIdentifier"];
			self.DataProfiles = [[CSCArrayOfString createWithNode: [Soap getNode: node withName: @"DataProfiles"]] object];
			self.EffectiveDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"EffectiveDate"]];
			self.Language = [Soap getNodeValue: node withName: @"Language"];
			self.Mode = [Soap getNodeValue: node withName: @"Mode"];
			self.Profiles = [[CSCArrayOfString createWithNode: [Soap getNode: node withName: @"Profiles"]] object];
			self.UserData = [[CSCArrayOfProp createWithNode: [Soap getNode: node withName: @"UserData"]] object];
			self.UserID = [Soap getNodeValue: node withName: @"UserID"];
			self.Workqueues = [[CSCArrayOfString createWithNode: [Soap getNode: node withName: @"Workqueues"]] object];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"WMEnv"];
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
		if (self.ActivityIdentifier != nil) [s appendFormat: @"<ActivityIdentifier>%@</ActivityIdentifier>", [[self.ActivityIdentifier stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.DataProfiles != nil && self.DataProfiles.count > 0) {
			[s appendFormat: @"<DataProfiles>%@</DataProfiles>", [CSCArrayOfString serialize: self.DataProfiles]];
		} else {
			[s appendString: @"<DataProfiles/>"];
		}
		if (self.EffectiveDate != nil) [s appendFormat: @"<EffectiveDate>%@</EffectiveDate>", [Soap getDateString: self.EffectiveDate]];
		if (self.Language != nil) [s appendFormat: @"<Language>%@</Language>", [[self.Language stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Mode != nil) [s appendFormat: @"<Mode>%@</Mode>", [[self.Mode stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Profiles != nil && self.Profiles.count > 0) {
			[s appendFormat: @"<Profiles>%@</Profiles>", [CSCArrayOfString serialize: self.Profiles]];
		} else {
			[s appendString: @"<Profiles/>"];
		}
		if (self.UserData != nil && self.UserData.count > 0) {
			[s appendFormat: @"<UserData>%@</UserData>", [CSCArrayOfProp serialize: self.UserData]];
		} else {
			[s appendString: @"<UserData/>"];
		}
		if (self.UserID != nil) [s appendFormat: @"<UserID>%@</UserID>", [[self.UserID stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Workqueues != nil && self.Workqueues.count > 0) {
			[s appendFormat: @"<Workqueues>%@</Workqueues>", [CSCArrayOfString serialize: self.Workqueues]];
		} else {
			[s appendString: @"<Workqueues/>"];
		}

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCWMEnv class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end
