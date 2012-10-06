//
//  PersonFacadeModel.h
//  iAia
//
//  Created by Georges-Henry Portefait on 05/05/10.
//  Copyright 2010 GH Portefait. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "PersonDataSource.h"
#import "ContractDataSource.h"
#import "FinancialEventDataSource.h"

@class PersonDataSource ;
@class	ContractDataSource ;
@class FinancialEventDataSource ; 

@interface PersonFacadeModel : NSObject {

	NSDate							* _lastUpdate ; 
	
	
	PersonDataSource				* aPersonDataSource ; 
	ContractDataSource			* aContractDataSource ; 
	FinancialEventDataSource	* aFinancialEventDataSource ; 
}

@property (readonly, nonatomic, retain)	PersonDataSource				* aPersonDataSource ; 
@property (readonly, nonatomic, retain)	ContractDataSource			* aContractDataSource ; 
@property (readonly, nonatomic, retain)	FinancialEventDataSource	* aFinancialEventDataSource ; 

/**
 Singleton pattern of the class
 */
+(PersonFacadeModel*) sharedInstance ; 
/**
General updater of the model will manage time difference
 */
-(void) getInformationWith:(NSString*) aCustomerKey ;

-(NSString*) title ;
-(NSString*) firstName ; 
-(NSString*) name ; 
-(NSString*) clientNumber ; 
-(NSString*) dateOfBirth ; 
-(NSString*) maritalStatus ;
-(NSString*) professionalStatus ;

-(NSString*) contractDetails ; 
@end
