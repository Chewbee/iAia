//
//  PersonFacadeModel.m
//  iAia
//
//  Created by Georges-Henry Portefait on 05/05/10.
//  Copyright 2010 GH Portefait. All rights reserved.
//

#import "PersonFacadeModel.h"

#define TIME_BETWEEN_REFRESHES 10

@implementation PersonFacadeModel

@synthesize aPersonDataSource, aContractDataSource, aFinancialEventDataSource ; 

#pragma mark -
#pragma mark Singleton
// Singleton pattern implementation
+(PersonFacadeModel*) sharedInstance {
	static PersonFacadeModel * _sharedInstance = nil ;
	
	@synchronized (self) {
		if (_sharedInstance == nil ) {
			_sharedInstance =  [[PersonFacadeModel alloc]init];
		}
	}
	return _sharedInstance ; 
}
//
#pragma mark -
#pragma mark Init
-(id) init {
	
	_lastUpdate = nil ; 
	
	aPersonDataSource				= [[PersonDataSource alloc]init];
	aContractDataSource			= [[ContractDataSource alloc]init] ; 
	aFinancialEventDataSource	= [[FinancialEventDataSource alloc] init] ; 
	
	if (aPersonDataSource && aContractDataSource && aFinancialEventDataSource) {
		[aPersonDataSource addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil] ; 
		[aPersonDataSource addObserver:self forKeyPath:@"firstName" options:NSKeyValueObservingOptionNew context:nil] ; 
		[aPersonDataSource addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil] ; 
		[aPersonDataSource addObserver:self forKeyPath:@"dateOfBirth" options:NSKeyValueObservingOptionNew context:nil] ; 
		[aPersonDataSource addObserver:self forKeyPath:@"maritalStatus" options:NSKeyValueObservingOptionNew context:nil] ; 
		[aPersonDataSource addObserver:self forKeyPath:@"professionalStatus" options:NSKeyValueObservingOptionNew context:nil] ; 
		
		[aContractDataSource addObserver:self forKeyPath:@"contractProduct" options:NSKeyValueObservingOptionNew context:nil] ; 		
		
		return self ;
	}
	else {
		[aPersonDataSource release];
		aPersonDataSource = nil ;
		[aContractDataSource release];
		aContractDataSource = nil ; 
		[aFinancialEventDataSource release]; 
		aFinancialEventDataSource = nil ;
	}
	return nil ;
}
#pragma mark -
#pragma mark Data Methods
-(void) refreshTimer {
	NSDate *newDate = [[NSDate alloc]init] ; 
	[_lastUpdate release ];
	_lastUpdate = newDate ;
}
//
-(BOOL) hasToRefresh {
	//never called before case
	if (_lastUpdate == nil) {
		_lastUpdate = [[NSDate alloc] init];
		return YES;
	}
	// now !
	NSDate *newDate = [[NSDate alloc]init] ; 
	// compare stored with now
	if ([newDate timeIntervalSinceDate:_lastUpdate] > TIME_BETWEEN_REFRESHES ) {
		[_lastUpdate release ];
		_lastUpdate = newDate ;
		return YES; 
	} else {
		[newDate release];
	}
	return NO ;
}
#pragma mark -
#pragma mark KVO
//
-(void) observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
		[self refreshTimer] ; 
}
//
-(void) getInformationWith:(NSString*) aCustomerKey {
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	if ([self hasToRefresh]) 
	{
		[aPersonDataSource getInformationWith:aCustomerKey];
		[aContractDataSource getInformationWith:aCustomerKey];
	}
	[pool release];
}
//
//
#pragma mark -
#pragma mark Person Pseudo accessors
-(NSString*) title {
	return [aPersonDataSource title] ; 
}
//
-(NSString*) firstName {
	return [aPersonDataSource firstName] ; 
}
//
-(NSString*) name {
	return [aPersonDataSource name] ; 
}
//
-(NSString*) clientNumber {
	return [aPersonDataSource clientNumber];
}; 
//
-(NSString*) dateOfBirth {
	return [aPersonDataSource dateOfBirth];
};
//
-(NSString*) maritalStatus {
	return [aPersonDataSource maritalStatus] ;
};
//
-(NSString*) professionalStatus {
	return [aPersonDataSource professionalStatus] ; 
};
//
#pragma mark -
#pragma mark Contract Pseudo accessors
-(NSString*) contractDetails {
	return [aContractDataSource contractDetails];
}; 

@end
