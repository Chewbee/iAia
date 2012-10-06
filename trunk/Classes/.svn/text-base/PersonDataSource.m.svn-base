//
//  PersonDataSource.m
//  iAia
//
//  Created by Georges-Henry Portefait on 29/04/10.
//  Copyright 2010 IDO Productions. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonDataSource.h"

/**
 Complete google sample 
 http://maps.google.com/maps/geo?q=1600+Amphitheatre+Parkway,+Mountain+View,+CA&output=json&oe=utf8\
 &sensor=true_or_false&key=ABQIAAAAyqohumyqXdA_2xN-Zma-7RRy_-6pGTgJPcqgXSI2grqSwcPQUBR7eCoczD2T97mx7ulawMnCpkhtSA
 
 http://maps.google.com/maps/api/geocode/
 
 */
#define GOOGLE_KEY @"&key=ABQIAAAAyqohumyqXdA_2xN-Zma-7RRy_-6pGTgJPcqgXSI2grqSwcPQUBR7eCoczD2T97mx7ulawMnCpkhtSA"
#define GOOGLE_GEOCODING_QUERY @"http://maps.google.com/maps/api/geocode/json?latlng=40.714224,-73.961452&oe=utf8&sensor=false"

/**
 q=1600+Amphitheatre+Parkway,+Mountain+View,+CA&output=json&oe=utf8\
 &sensor=true_or_false&key=ABQIAAAAyqohumyqXdA_2xN-Zma-7RRy_-6pGTgJPcqgXSI2grqSwcPQUBR7eCoczD2T97mx7ulawMnCpkhtSA"
 
 */
#define PERSON_QUERY @"" 

@implementation PersonDataSource

@synthesize title, firstName, name, clientNumber , dateOfBirth, maritalStatus , professionalStatus ; 

#pragma mark -
#pragma mark alloc and dealloc

//
-(id) init {
	if (self = [super init]) {
		_webServiceReturnString = [[NSMutableString alloc]init] ;
	}
	return self ; 
}
//
-(void) dealloc {
	[super dealloc] ;
	[_webServiceReturnString release] ;
}
#pragma mark -
#pragma mark Fecthing info from anywhere
//
-(void) getInformationWith:(NSString*) aCustomerKey {
	NSError *error = nil ; 
	NSMutableString *serviceQuery = [[NSMutableString alloc]init];
	// effective call to Google geoloc services
	[serviceQuery setString:GOOGLE_GEOCODING_QUERY ] ;
	[serviceQuery appendString:GOOGLE_KEY] ; 
	//build URL from string
	NSURL *serviceQueryURL = [[NSURL alloc ]initWithString:serviceQuery];
	// Get the contents of the URL as a string, and parse the JSON into Foundation objects.
    NSMutableString *webServiceReturnInThread = [NSMutableString stringWithContentsOfURL:serviceQueryURL encoding:NSUTF8StringEncoding error:&error];
	// if there is an error from the Google call log it 
	if (error) {
		NSLog(@"Error fetching from the internet :\n%@\n%@\n%@", [error localizedDescription], [error localizedFailureReason], [error localizedRecoveryOptions]);
	}
	// Stub returning a predefined JSON String
	 [webServiceReturnInThread appendString:@","] ; 
	[webServiceReturnInThread setString:@"{\"title\":\"Mr\",\"name\":\"alonso\",\"firstName\":\"fernando\",\"dateOfBirth\":\"01/08/1971\",\"maritalStatus\":\"Single\",\"professionalStatus\":\"Active\",\"clientNumber\":\"321\"}"] ;
	
	// Message back to the main thread
	//[self performSelectorOnMainThread:@selector(processPersonWebServiceReturn:) withObject:webServiceReturnInThread waitUntilDone:YES]; 
	[self processPersonWebServiceReturn: webServiceReturnInThread] ; 
	
	[serviceQuery release] ;
	[serviceQueryURL release] ;
}

-(void) processPersonWebServiceReturn:(NSMutableString*) aReturnString {
	
	NSMutableDictionary	* webServiceReturnDictionary = [NSMutableDictionary dictionaryWithCapacity:3];
	// Parsing will result in Foundation objects
	//NSLog(@"Dumping aReturnString : '%@'\nEnd of dump",aReturnString) ; 
	
	webServiceReturnDictionary = [aReturnString JSONValue];
	
	// Now we need to dig through the resulting objects.
    // Read the documentation and make liberal use of the debugger or logs.
	for (id key in [webServiceReturnDictionary allKeys]) {
		
		//NSLog(@"Key:'%@' Value:'%@'",key,[webServiceReturnDictionary valueForKey:key]) ; 
		
		[self setValue:[webServiceReturnDictionary valueForKey:key] forKey:key];
	}
}


-(void) dummyForNow {
	
	int 	FlickrAPIKey = 0 ; 
	// Construct a Flickr API request.
	// Important! Enter your Flickr API key in FlickrAPIKey.h
    NSString *urlString = [NSString stringWithFormat:@"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&tags=%@&per_page=10&format=json&nojsoncallback=1", FlickrAPIKey, @"stanfordtree"];
    NSURL *url = [NSURL URLWithString:urlString];
	
    // Get the contents of the URL as a string, and parse the JSON into Foundation objects.
    NSString *jsonString = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSDictionary *results = [jsonString JSONValue];
    
    // Now we need to dig through the resulting objects.
    // Read the documentation and make liberal use of the debugger or logs.
    NSArray *photos = [[results objectForKey:@"photos"] objectForKey:@"photo"];
    for (NSDictionary *photo in photos) {
        /*// Get the title for each photo
		 NSString *title = [photo objectForKey:@"title"];
		 [photoNames addObject:(title.length > 0 ? title : @"Untitled")];
		 
		 // Construct the URL for each photo.
		 NSString *photoURLString = [NSString stringWithFormat:@"http://farm%@.static.flickr.com/%@/%@_%@_s.jpg", [photo objectForKey:@"farm"], [photo objectForKey:@"server"], [photo objectForKey:@"id"], [photo objectForKey:@"secret"]];
		 [photoURLs addObject:[NSURL URLWithString:photoURLString]];
		 */
	}
}

@end

/**
 GEO_ABORTED_REQUEST	10101	
 Status code indicating that the request was aborted due to a newer request.
 
 GEO_BAD_KEY	610	
 Status code indicating a missing or invalid API key.
 
 GEO_BAD_REQUEST	400	
 Status code indicating that the request could not be processed properly by the servers.
 
 GEO_BAD_STATUS_START	600	
 The lower numerical limit of bad status codes.
 
 GEO_MISSING_ADDRESS	601	
 Status code indicating that the address parameter is missing.
 
 GEO_MISSING_QUERY	601	
 Status code indicating that the query parameter is missing. This is a generalization of the GEO_MISSING_ADDRESS code introduced in the geocoder.
 
 GEO_SERVER_ERROR	500	
 Status code indicating problem with the geocode server. For example, this value may be returned if the geoserver is down.
 
 GEO_SUCCESS	200	
 Status code indicating a successful geocoding query.
 
 GEO_TOO_MANY_QUERIES	620	
 Status indicating that we received too many requests in the 24h period.
 
 GEO_UNAVAILABLE_ADDRESS	603	
 Status indicating that for legal or other reasons we may not return a reply to this particular query.
 
 GEO_UNKNOWN_ADDRESS	602	
 Status code indicating an unknown or incorrect address.
 
 GEO_UNKNOWN_DIRECTIONS	604	
 Status code indicating that no directions could be computed.
 */