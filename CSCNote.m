/*
	CSCNote.h
	The implementation of properties and methods for the CSCNote object.
	Generated by SudzC.com
*/
#import "CSCNote.h"

#import "CSCObject.h"
#import "CSCReference.h"
#import "CSCArrayOfString.h"
#import "CSCArrayOfString.h"
@implementation CSCNote
	@synthesize Accessibility = _Accessibility;
	@synthesize AccessibilityLabel = _AccessibilityLabel;
	@synthesize Author = _Author;
	@synthesize BusinessObject = _BusinessObject;
	@synthesize CreationDate = _CreationDate;
	@synthesize Object = _Object;
	@synthesize ProfileList = _ProfileList;
	@synthesize Text = _Text;
	@synthesize Title = _Title;
	@synthesize UpdateDate = _UpdateDate;

	- (id) init
	{
		if(self = [super init])
		{
			self.Accessibility = nil;
			self.AccessibilityLabel = nil;
			self.Author = nil;
			self.BusinessObject = nil; // [[CSCObject alloc] init];
			self.CreationDate = nil;
			self.Object = nil; // [[CSCReference alloc] init];
			self.ProfileList = [[NSMutableArray alloc] init];
			self.Text = [[NSMutableArray alloc] init];
			self.Title = nil;
			self.UpdateDate = nil;

		}
		return self;
	}

	+ (CSCNote*) createWithNode: (CXMLNode*) node
	{
		if(node == nil) { return nil; }
		return (CSCNote*)[[CSCNote alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node {
		if(self = [super initWithNode: node])
		{
			self.Accessibility = [Soap getNodeValue: node withName: @"Accessibility"];
			self.AccessibilityLabel = [Soap getNodeValue: node withName: @"AccessibilityLabel"];
			self.Author = [Soap getNodeValue: node withName: @"Author"];
			self.BusinessObject = [[CSCObject createWithNode: [Soap getNode: node withName: @"BusinessObject"]] object];
			self.CreationDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"CreationDate"]];
			self.Object = [[CSCReference createWithNode: [Soap getNode: node withName: @"Object"]] object];
			self.ProfileList = [[CSCArrayOfString createWithNode: [Soap getNode: node withName: @"ProfileList"]] object];
			self.Text = [[CSCArrayOfString createWithNode: [Soap getNode: node withName: @"Text"]] object];
			self.Title = [Soap getNodeValue: node withName: @"Title"];
			self.UpdateDate = [Soap dateFromString: [Soap getNodeValue: node withName: @"UpdateDate"]];
		}
		return self;
	}

	- (NSMutableString*) serialize
	{
		return [self serialize: @"Note"];
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
		if (self.Accessibility != nil) [s appendFormat: @"<Accessibility>%@</Accessibility>", [[self.Accessibility stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.AccessibilityLabel != nil) [s appendFormat: @"<AccessibilityLabel>%@</AccessibilityLabel>", [[self.AccessibilityLabel stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.Author != nil) [s appendFormat: @"<Author>%@</Author>", [[self.Author stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.BusinessObject != nil) [s appendString: [self.BusinessObject serialize: @"BusinessObject"]];
		if (self.CreationDate != nil) [s appendFormat: @"<CreationDate>%@</CreationDate>", [Soap getDateString: self.CreationDate]];
		if (self.Object != nil) [s appendString: [self.Object serialize: @"Object"]];
		if (self.ProfileList != nil && self.ProfileList.count > 0) {
			[s appendFormat: @"<ProfileList>%@</ProfileList>", [CSCArrayOfString serialize: self.ProfileList]];
		} else {
			[s appendString: @"<ProfileList/>"];
		}
		if (self.Text != nil && self.Text.count > 0) {
			[s appendFormat: @"<Text>%@</Text>", [CSCArrayOfString serialize: self.Text]];
		} else {
			[s appendString: @"<Text/>"];
		}
		if (self.Title != nil) [s appendFormat: @"<Title>%@</Title>", [[self.Title stringByReplacingOccurrencesOfString:@"\"" withString:@"&quot;"] stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"]];
		if (self.UpdateDate != nil) [s appendFormat: @"<UpdateDate>%@</UpdateDate>", [Soap getDateString: self.UpdateDate]];

		return s;
	}
	
	- (NSMutableString*) serializeAttributes
	{
		NSMutableString* s = [super serializeAttributes];

		return s;
	}
	
	-(BOOL)isEqual:(id)object{
		if(object != nil && [object isKindOfClass:[CSCNote class]]) {
			return [[self serialize] isEqualToString:[object serialize]];
		}
		return NO;
	}
	
	-(NSUInteger)hash{
		return [Soap generateHash:self];

	}

@end