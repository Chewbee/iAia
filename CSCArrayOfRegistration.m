/*
	CSCArrayOfRegistration.h
	The implementation of properties and methods for the CSCArrayOfRegistration array.
	Generated by SudzC.com
*/
#import "CSCArrayOfRegistration.h"

#import "CSCRegistration.h"
@implementation CSCArrayOfRegistration

	+ (id) createWithNode: (CXMLNode*) node
	{
		return [[CSCArrayOfRegistration alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				CSCRegistration* value = [[CSCRegistration createWithNode: child] object];
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
			[s appendString: [item serialize: @"Registration"]];
		}
		return s;
	}
@end
