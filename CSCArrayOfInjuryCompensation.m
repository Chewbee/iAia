/*
	CSCArrayOfInjuryCompensation.h
	The implementation of properties and methods for the CSCArrayOfInjuryCompensation array.
	Generated by SudzC.com
*/
#import "CSCArrayOfInjuryCompensation.h"

#import "CSCInjuryCompensation.h"
@implementation CSCArrayOfInjuryCompensation

	+ (id) createWithNode: (CXMLNode*) node
	{
		return [[CSCArrayOfInjuryCompensation alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				CSCInjuryCompensation* value = [[CSCInjuryCompensation createWithNode: child] object];
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
			[s appendString: [item serialize: @"InjuryCompensation"]];
		}
		return s;
	}
@end
