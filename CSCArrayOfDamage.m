/*
	CSCArrayOfDamage.h
	The implementation of properties and methods for the CSCArrayOfDamage array.
	Generated by SudzC.com
*/
#import "CSCArrayOfDamage.h"

#import "CSCDamage.h"
@implementation CSCArrayOfDamage

	+ (id) createWithNode: (CXMLNode*) node
	{
		return [[CSCArrayOfDamage alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				CSCDamage* value = [[CSCDamage createWithNode: child] object];
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
			[s appendString: [item serialize: @"Damage"]];
		}
		return s;
	}
@end
