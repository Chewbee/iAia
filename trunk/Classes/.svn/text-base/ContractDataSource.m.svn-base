//
//  ContractDataSource.m
//  iAia
//
//  Created by Georges-Henry Portefait on 29/04/10.
//  Copyright 2010 IDO Productions. All rights reserved.
//

#import "ContractDataSource.h"


@implementation ContractDataSource

@synthesize contractProduct, contractNumber, contractStatus, contractTerm ; 

#pragma mark -
#pragma mark alloc and dealloc
//
-(void) dealloc {
	
	[contractProduct release];
	[contractNumber release];
	[contractStatus release];
	[contractTerm release];
	
	[super dealloc];
}
//
#pragma mark -
#pragma mark Fecthing info from anywhere
//
-(void) getInformationWith:(NSString*) aContractNumber {
	
	NSMutableString		* webServiceReturnInThread =[[NSMutableString alloc]init]; ; 
	NSMutableDictionary	* webServiceReturnDictionary ; 
	
	[webServiceReturnInThread setString:@"{\"contractProduct\":\"EPA-MS\",\"contractNumber\":\"11223344\",\"contractStatus\":\"In-Force\",\"contractTerm\":\"01/01/2021\"}"] ;
	
	// parsing JSON to dictionary
	webServiceReturnDictionary = [webServiceReturnInThread JSONValue];
	// settings keys for the objects based on dictionary
	for (id key in [webServiceReturnDictionary allKeys]) {
		
		[self setValue:[webServiceReturnDictionary valueForKey:key] forKey:key];
	}
	[webServiceReturnInThread release] ; 
}
//
-(NSString*) contractDetails {
	
	NSString * returnedString = [[[NSString alloc]
								  initWithFormat:@"%@ %@ %@ %@",
								  [self contractProduct], [self contractNumber],[self contractStatus],[self contractTerm]]
								 autorelease] ;
	
	return returnedString ; 
}
@end
