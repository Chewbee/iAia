/*
	CSCArrayOfLoanInstalment.h
	The implementation of properties and methods for the CSCArrayOfLoanInstalment array.
	Generated by SudzC.com
*/
#import "CSCArrayOfLoanInstalment.h"

#import "CSCLoanInstalment.h"
@implementation CSCArrayOfLoanInstalment

	+ (id) createWithNode: (CXMLNode*) node
	{
		return [[CSCArrayOfLoanInstalment alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				CSCLoanInstalment* value = [[CSCLoanInstalment createWithNode: child] object];
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
			[s appendString: [item serialize: @"LoanInstalment"]];
		}
		return s;
	}
@end
