/*
	CSCArrayOfQuestionAnswer.h
	The implementation of properties and methods for the CSCArrayOfQuestionAnswer array.
	Generated by SudzC.com
*/
#import "CSCArrayOfQuestionAnswer.h"

#import "CSCQuestionAnswer.h"
@implementation CSCArrayOfQuestionAnswer

	+ (id) createWithNode: (CXMLNode*) node
	{
		return [[CSCArrayOfQuestionAnswer alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				CSCQuestionAnswer* value = [[CSCQuestionAnswer createWithNode: child] object];
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
			[s appendString: [item serialize: @"QuestionAnswer"]];
		}
		return s;
	}
@end
