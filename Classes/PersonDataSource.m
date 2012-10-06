//
//  PersonDataSource.m
//  iAia
//
//  Created by Georges-Henry Portefait on 29/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonDataSource.h"

#define PERSON_QUERY @"http://20.33.42.204:10101/person/queries/basic/list?idntfr_prsn_spec=PRSN0000907&" 

@implementation PersonDataSource

@synthesize title, firstName, name, clientNumber , dateOfBirth, maritalStatus , professionalStatus ; 

#pragma mark -
#pragma mark alloc and dealloc

// Singleton implemention
+(PersonDataSource*) sharedInstance {
	// singleton variable
	static PersonDataSource * _thePersonDataSource = nil ; 
	
	if ( _thePersonDataSource == nil ) {
		_thePersonDataSource = [[self alloc]init] ; 
	}
	return _thePersonDataSource ; 
}
//
-(id) init {
	if (self = [super init]) {
		_webServiceReturnedString = [[NSMutableString alloc]init] ;
	}
	return self ; 
}
//
-(void) dealloc {

	 ;
	 ;
    
     ;
}
#pragma mark -
#pragma mark Fetching info from anywhere
//
-(void) basicQuery {
	[[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:YES] ; 
	//
    /*
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults] ;
    NSString *login = [defaults stringForKey:@"login_preference" ] ;
    NSString *password = [defaults stringForKey:@"password_preference" ] ;
    NSString *clientNumber = [defaults stringForKey:@"number_preference" ] ;
	*/
    ///TODO: Build the query
	[self InitiateAsynchronousQuery];

}; 
//
-(void) getPersonInformationWith:(NSString*) aCustomerKey {
	
	///TODO check that the data are more than a minute old if not return as the data  are fresh enough NSDATE
	[[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:YES] ; 
	
	[self InitiateAsynchronousQuery];
}
//
//
-(void) processWebServiceReturn:(NSMutableString*) aReturnString
{
	[[UIApplication sharedApplication ]setNetworkActivityIndicatorVisible:NO] ; 
}

- (void) FreeReturningBuffers {
  if (_webServiceReturnedData ) {
		_webServiceReturnedData = nil ; 
	} 
		
	if (_webServiceReturnedString) {
		_webServiceReturnedString = nil ; 
	}

}
-(void)  InitiateAsynchronousQuery {
	
	NSURLConnection *urlConnection = nil ;
	NSURLRequest	*urlRequest = nil ;
	NSURL			*theURL	= nil ;
	
	[self FreeReturningBuffers];
    
	_webServiceReturnedData = [[NSMutableData alloc]init];
    
	NSMutableString *serviceQuery = [[NSMutableString alloc]init];
	///FIXME: Replace with AIA calls effective call to Google geoloc services
	[serviceQuery setString:PERSON_QUERY ] ;
	
	theURL = [[NSURL alloc] initWithString:serviceQuery ] ;
	urlRequest = [[NSURLRequest alloc] initWithURL:theURL] ;
	urlConnection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
}
#pragma mark -
#pragma mark NSURLConnection delegates
//
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	NSLog(@"connection didFailWithError %@",[error localizedFailureReason]);
	[self FreeReturningBuffers] ;
}
//
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
	[_webServiceReturnedData appendData:data] ;
	NSLog(@"Receiving data ... ") ; 
}
//
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	_webServiceReturnedString = [[NSMutableString alloc ] initWithData:_webServiceReturnedData encoding:NSUTF8StringEncoding];
	NSLog(@"Data reception completes %@",_webServiceReturnedString);
	
	///FIXME: HARDCODED Stub returning a predefined JSON String
	
     [_webServiceReturnedString setString:@"{\"title\":\"Mr\",\"name\":\"alonso\",\"firstName\":\"fernando\",\"dateOfBirth\":\"01/08/1971\",\"maritalStatus\":\"Single\",\"professionalStatus\":\"Active\",\"clientNumber\":\"321\"}"] ;
	 [self processWebServiceReturn:_webServiceReturnedString];
}
//

@end