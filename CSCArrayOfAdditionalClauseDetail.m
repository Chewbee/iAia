/*
	CSCArrayOfAdditionalClauseDetail.h
	The implementation of properties and methods for the CSCArrayOfAdditionalClauseDetail array.
	Generated by SudzC.com
*/
#import "CSCArrayOfAdditionalClauseDetail.h"

#import "CSCAdditionalClauseDetail.h"
@implementation CSCArrayOfAdditionalClauseDetail

	+ (id) createWithNode: (CXMLNode*) node
	{
		return [[CSCArrayOfAdditionalClauseDetail alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				CSCAdditionalClauseDetail* value = [[CSCAdditionalClauseDetail createWithNode: child] object];
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
			[s appendString: [item serialize: @"AdditionalClauseDetail"]];
		}
		return s;
	}
@end
