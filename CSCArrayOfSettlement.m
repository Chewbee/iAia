/*
	CSCArrayOfSettlement.h
	The implementation of properties and methods for the CSCArrayOfSettlement array.
	Generated by SudzC.com
*/
#import "CSCArrayOfSettlement.h"

#import "CSCSettlement.h"
@implementation CSCArrayOfSettlement

	+ (id) createWithNode: (CXMLNode*) node
	{
		return [[CSCArrayOfSettlement alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				CSCSettlement* value = [[CSCSettlement createWithNode: child] object];
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
			[s appendString: [item serialize: @"Settlement"]];
		}
		return s;
	}
@end
