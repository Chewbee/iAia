//
//  PersonDataSource.h
//  iAia
//
//  Created by Georges-Henry Portefait on 29/04/10.
// copyright 2010 IDO Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSON.h"

@interface PersonDataSource : NSObject {
	
	NSString	* clientNumber ;
	
	NSString	* title ; 
	NSString	* firstName ; 
	NSString	* name ; 
	NSString	* dateOfBirth ;
	NSString	* maritalStatus ;
	NSString	* professionalStatus ; 
	
	NSMutableString		* _webServiceReturnString ; 
	
}


@property	(nonatomic, retain) NSString * clientNumber ;
@property	(nonatomic, retain) NSString * title ;  
@property	(nonatomic, retain) NSString * firstName ; 
@property	(nonatomic, retain) NSString * name ; 
@property	(nonatomic, retain) NSString * dateOfBirth ;
@property	(nonatomic, retain) NSString * maritalStatus ;
@property	(nonatomic, retain) NSString * professionalStatus ; 

/**
 will return in a dictionnary all the necessary fields for the person, where ever they came from 
 */
-(void) getInformationWith:(NSString*) aCustomerKey ;

-(void) processPersonWebServiceReturn:(NSMutableString*) aReturnString ; 

@end
