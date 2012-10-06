/*
	CSCArrayOfContract.h
	The implementation of properties and methods for the CSCArrayOfContract array.
	Generated by SudzC.com
*/
#import "CSCArrayOfContract.h"

#import "CSCContract.h"
@implementation CSCArrayOfContract

	+ (id) createWithNode: (CXMLNode*) node
	{
		return [[CSCArrayOfContract alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				CSCContract* value = [[CSCContract createWithNode: child] object];
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
			[s appendString: [item serialize: @"Contract"]];
		}
		return s;
	}
@end
