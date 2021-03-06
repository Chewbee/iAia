/*
	CSCArrayOfHealthConditionalLimit.h
	The implementation of properties and methods for the CSCArrayOfHealthConditionalLimit array.
	Generated by SudzC.com
*/
#import "CSCArrayOfHealthConditionalLimit.h"

#import "CSCHealthConditionalLimit.h"
@implementation CSCArrayOfHealthConditionalLimit

	+ (id) createWithNode: (CXMLNode*) node
	{
		return [[CSCArrayOfHealthConditionalLimit alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				CSCHealthConditionalLimit* value = [[CSCHealthConditionalLimit createWithNode: child] object];
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
			[s appendString: [item serialize: @"HealthConditionalLimit"]];
		}
		return s;
	}
@end
