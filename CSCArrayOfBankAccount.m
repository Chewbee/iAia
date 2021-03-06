/*
	CSCArrayOfBankAccount.h
	The implementation of properties and methods for the CSCArrayOfBankAccount array.
	Generated by SudzC.com
*/
#import "CSCArrayOfBankAccount.h"

#import "CSCBankAccount.h"
@implementation CSCArrayOfBankAccount

	+ (id) createWithNode: (CXMLNode*) node
	{
		return [[CSCArrayOfBankAccount alloc] initWithNode: node];
	}

	- (id) initWithNode: (CXMLNode*) node
	{
		if(self = [self init]) {
			for(CXMLElement* child in [node children])
			{
				CSCBankAccount* value = [[CSCBankAccount createWithNode: child] object];
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
			[s appendString: [item serialize: @"BankAccount"]];
		}
		return s;
	}
@end
