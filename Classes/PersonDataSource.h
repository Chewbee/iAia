//
//  PersonDataSource.h
//  iAia
//
//  Created by Georges-Henry Portefait on 29/04/10.
// copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersonDataSource : NSObject {
	
	NSString	* clientNumber ;
	
	NSString	* title ; 
	NSString	* firstName ; 
	NSString	* name ; 
	NSString	* dateOfBirth ;
	NSString	* maritalStatus ;
	NSString	* professionalStatus ; 
	
	NSMutableString		* _webServiceReturnedString ; 
	NSMutableData		* _webServiceReturnedData ; 
	
}


@property	(nonatomic, strong) NSString * clientNumber ;
@property	(nonatomic, strong) NSString * title ;  
@property	(nonatomic, strong) NSString * firstName ; 
@property	(nonatomic, strong) NSString * name ; 
@property	(nonatomic, strong) NSString * dateOfBirth ;
@property	(nonatomic, strong) NSString * maritalStatus ;
@property	(nonatomic, strong) NSString * professionalStatus ; 

/**
 Singleton method
 */
+(PersonDataSource*) sharedInstance ;
/**
 */
-(void) basicQuery ; 
/**
 will fire a thread to go get the data
 */
-(void) getPersonInformationWith:(NSString*) aCustomerKey ;
/**
 returning from thread method, parses the JSON string into a dictionnary, extract the keys in the dictionnary to set the members
 */
-(void) processWebServiceReturn:(NSMutableString*) aReturnString ;
/**
 */
-(void)  InitiateAsynchronousQuery ; 
/**
 */
@end
