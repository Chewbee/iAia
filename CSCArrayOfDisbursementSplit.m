/*
	CSCArrayOfDisbursementSplit.h
	The implementation of properties and methods for the CSCArrayOfDisbursementSplit array.
	Generated by SudzC.com
*/
#import "CSCArrayOfDisbursementSplit.h"

#import "CSCDisbursementSplit.h"
@implementation CSCArrayOfDisbursementSplit

	+ (id) createWithNode: (CXMLNode*) node
	{
		return [[CSCArrayOfDisbursementSplit alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				CSCDisbursementSplit* value = [[CSCDisbursementSplit createWithNode: child] object];
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
			[s appendString: [item serialize: @"DisbursementSplit"]];
		}
		return s;
	}
@end
