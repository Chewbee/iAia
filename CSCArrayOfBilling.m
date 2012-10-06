/*
	CSCArrayOfBilling.h
	The implementation of properties and methods for the CSCArrayOfBilling array.
	Generated by SudzC.com
*/
#import "CSCArrayOfBilling.h"

#import "CSCBilling.h"
@implementation CSCArrayOfBilling

	+ (id) createWithNode: (CXMLNode*) node
	{
		return [[CSCArrayOfBilling alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				CSCBilling* value = [[CSCBilling createWithNode: child] object];
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
			[s appendString: [item serialize: @"Billing"]];
		}
		return s;
	}
@end
