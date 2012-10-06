//
//  FinancialEventDataSource.m
//  iAia
//
//  Created by Georges-Henry Portefait on 29/04/10.
//  Copyright 2010 IDO Productions. All rights reserved.
//

#import "FinancialEventDataSource.h"


@implementation FinancialEventDataSource

#pragma mark -
#pragma mark alloc and dealloc
//
static FinancialEventDataSource * _theFinancialEventDataSource = nil ; 
// Singleton implemention
+(FinancialEventDataSource*) sharedInstance {
	static FinancialEventDataSource * _theFinancialEventDataSource = nil ; 
	
	if ( _theFinancialEventDataSource == nil ) {
		_theFinancialEventDataSource = [[self alloc]init] ; 
	}
	return _theFinancialEventDataSource ; 
}
//
-(void) dealloc {
	[_theFinancialEventDataSource release];
	[super dealloc];
}

@end
