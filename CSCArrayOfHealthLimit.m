/*
	CSCArrayOfHealthLimit.h
	The implementation of properties and methods for the CSCArrayOfHealthLimit array.
	Generated by SudzC.com
*/
#import "CSCArrayOfHealthLimit.h"

#import "CSCHealthLimit.h"
@implementation CSCArrayOfHealthLimit

	+ (id) createWithNode: (CXMLNode*) node
	{
		return [[CSCArrayOfHealthLimit alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				CSCHealthLimit* value = [[CSCHealthLimit createWithNode: child] object];
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
			[s appendString: [item serialize: @"HealthLimit"]];
		}
		return s;
	}
@end
