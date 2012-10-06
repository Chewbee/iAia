/*
	CSCArrayOfFeesOverride.h
	The implementation of properties and methods for the CSCArrayOfFeesOverride array.
	Generated by SudzC.com
*/
#import "CSCArrayOfFeesOverride.h"

#import "CSCFeesOverride.h"
@implementation CSCArrayOfFeesOverride

	+ (id) createWithNode: (CXMLNode*) node
	{
		return [[CSCArrayOfFeesOverride alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				CSCFeesOverride* value = [[CSCFeesOverride createWithNode: child] object];
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
			[s appendString: [item serialize: @"FeesOverride"]];
		}
		return s;
	}
@end
