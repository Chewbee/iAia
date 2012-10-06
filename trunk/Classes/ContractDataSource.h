//
//  ContractDataSource.h
//  iAia
//
//  Created by Georges-Henry Portefait on 29/04/10.
//  Copyright 2010 IDO Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContractTableViewCell.h"

@interface ContractDataSource : NSObject {

	NSString	* contractProduct ; 
	NSString	* contractNumber ;
	NSString  * contractStatus ; 
	NSString	* contractTerm ; 
	
}

@property (retain)		NSString	* contractProduct ; 
@property (retain)		NSString	* contractNumber ;
@property (retain)		NSString	* contractStatus ;
@property (retain)		NSString	* contractTerm ;


/**
 will return in a dictionnary all the necessary fields for the person, where ever they came from 
 */
-(void) getInformationWith:(NSString*) aContractNumber ;
-(NSString*) contractDetails ;

@end
