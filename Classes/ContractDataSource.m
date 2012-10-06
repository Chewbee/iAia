//
//  ContractDataSource.m
//  iAia
//
//  Created by Georges-Henry Portefait on 29/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "ContractDataSource.h"




@implementation ContractDataSource

@synthesize dataReady ;

#pragma mark -
#pragma mark alloc and dealloc
//
static ContractDataSource * _theContractDataSource = nil ;
// Singleton implemention
+(ContractDataSource*) sharedInstance {
	if ( _theContractDataSource == nil ) {
		_theContractDataSource = [[self alloc]init] ;
	}
	return _theContractDataSource ;
}

-(id)init {
    CSCWMccde =[[CSCWorkManagementClientContractDisplayExtract alloc]init] ;
    [self setDataReady: FALSE] ;
    return self ;
}

-(void) refreshData {
    [CSCWMccde invokeService];
    [self setDataReady: [CSCWMccde isFaulty]];
};
@end
