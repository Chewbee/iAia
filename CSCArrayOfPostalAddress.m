/*
	CSCArrayOfPostalAddress.h
	The implementation of properties and methods for the CSCArrayOfPostalAddress array.
	Generated by SudzC.com
*/
#import "CSCArrayOfPostalAddress.h"

#import "CSCPostalAddress.h"
@implementation CSCArrayOfPostalAddress

	+ (id) createWithNode: (CXMLNode*) node
	{
		return [[CSCArrayOfPostalAddress alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				CSCPostalAddress* value = [[CSCPostalAddress createWithNode: child] object];
				if(value != nil) {
					[self addObject: value];
				}
			}
		}
		return self;
	}
	
	+ (NSMutableString*) serialize: (NSArray*) array
	{
		NSMutableString* s = [NSMutableString string];
		for(id item in array) {
			[s appendString: [item serialize: @"PostalAddress"]];
		}
		return s;
	}
@end
