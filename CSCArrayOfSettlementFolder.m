/*
	CSCArrayOfSettlementFolder.h
	The implementation of properties and methods for the CSCArrayOfSettlementFolder array.
	Generated by SudzC.com
*/
#import "CSCArrayOfSettlementFolder.h"

#import "CSCSettlementFolder.h"
@implementation CSCArrayOfSettlementFolder

	+ (id) createWithNode: (CXMLNode*) node
	{
		return [[CSCArrayOfSettlementFolder alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				CSCSettlementFolder* value = [[CSCSettlementFolder createWithNode: child] object];
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
			[s appendString: [item serialize: @"SettlementFolder"]];
		}
		return s;
	}
@end
