/*
	CSCArrayOfAcceptanceDecision.h
	The implementation of properties and methods for the CSCArrayOfAcceptanceDecision array.
	Generated by SudzC.com
*/
#import "CSCArrayOfAcceptanceDecision.h"

#import "CSCAcceptanceDecision.h"
@implementation CSCArrayOfAcceptanceDecision

	+ (id) createWithNode: (CXMLNode*) node
	{
		return [[CSCArrayOfAcceptanceDecision alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				CSCAcceptanceDecision* value = [[CSCAcceptanceDecision createWithNode: child] object];
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
			[s appendString: [item serialize: @"AcceptanceDecision"]];
		}
		return s;
	}
@end
