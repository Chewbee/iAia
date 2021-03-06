/*
	CSCArrayOfPersonalIncome.h
	The implementation of properties and methods for the CSCArrayOfPersonalIncome array.
	Generated by SudzC.com
*/
#import "CSCArrayOfPersonalIncome.h"

#import "CSCPersonalIncome.h"
@implementation CSCArrayOfPersonalIncome

	+ (id) createWithNode: (CXMLNode*) node
	{
		return [[CSCArrayOfPersonalIncome alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				CSCPersonalIncome* value = [[CSCPersonalIncome createWithNode: child] object];
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
			[s appendString: [item serialize: @"PersonalIncome"]];
		}
		return s;
	}
@end
